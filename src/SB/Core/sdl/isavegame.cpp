#include "isavegame.h"

#include "zGlobals.h"

#include "iTRC.h"

#include <stdio.h>
#include <string.h>
#include <types.h>


// name is a total guess for now
struct st_ISG_TPL_TEX
{
    struct UnkIn
    {
        U32 unk_0;
        U32 unk_4;
        void* unk_8;
        U32 unk_c;
        U32 unk_10[4];
        U8 unk_20;
        U8 unk_21;
        U8 unk_22;
        U8 unk_23;
    };
    struct UnkOut
    {
        U8 unk_0;
        U8 unk_1;
        U8 unk_2;
        U8 unk_3;
        U32 unk_4;
        void* unk_8;
    };

    UnkIn* unk_0;
    UnkOut* unk_4;
};
// WIP. Looks like some sort of header for a file with embedded texture information.
struct st_ISG_TPL_TEXPALETTE
{
    U32 magic;
    U32 count;
    st_ISG_TPL_TEX* unk_8;
};

// .bss
static char cardwork[2][0xa000] ATTRIBUTE_ALIGN(32);

// .sbss
static volatile S32 g_isginit;
static st_ISG_TPL_TEXPALETTE* g_rawicon;
static st_ISG_TPL_TEXPALETTE* g_rawbanr;
static U32 g_iconsize;
static U32 g_banrsize;
static U8 isMounted;

// .data
static st_ISGSESSION g_isgdata_MAIN = { 0 };
static S32 g_legalSectSize[] = { 0x2000, 0, -1 };

S32 iSGStartup()
{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-volatile"
    if (g_isginit++ != 0)
#pragma clang diagnostic pop
    {
        return g_isginit;
    }

    return g_isginit;
}

S32 iSGShutdown()
{
    return 1;
}

char* iSGMakeName(en_NAMEGEN_TYPE type, const char* base, S32 idx)
{
    static S32 rotate = 0;
    static char rotatebuf[8][32] = { 0 };

    const char* fmt_sd = "%s%02d";
    char* use_buf = rotatebuf[rotate++];
    if (rotate == 8)
    {
        rotate = 0;
    }

    *use_buf = NULL;
    switch (type)
    {
    case ISG_NGTYP_GAMEFILE:

        if (base != NULL)
        {
            sprintf(use_buf, fmt_sd, base, idx);
        }
        else
        {
            sprintf(use_buf, fmt_sd, "SpongeBob", idx);
        }
        break;
    case ISG_NGTYP_GAMEDIR:
    case ISG_NGTYP_CONFIG:
    case ISG_NGTYP_ICONTHUM:
        break;
    }

    return use_buf;
}

st_ISGSESSION* iSGSessionBegin(void* cltdata, void (*chgfunc)(void*, en_CHGCODE), S32 monitor)
{
    iTRCDisk::CheckDVDAndResetState();
    memset(&g_isgdata_MAIN, 0, sizeof(st_ISGSESSION));

    g_isgdata_MAIN.slot = -1;
    g_isgdata_MAIN.chgfunc = chgfunc;
    g_isgdata_MAIN.cltdata = cltdata;

    return &g_isgdata_MAIN;
}

void iSGSessionEnd(st_ISGSESSION* isgdata)
{
}

S32 iSGTgtCount(st_ISGSESSION* isgdata, S32* max)
{
    return 0;
}

S32 iSGTgtPhysSlotIdx(st_ISGSESSION* isgdata, S32 tidx)
{
    S32 idx = -1;
    if (iSG_mcidx2slot(tidx, &idx, NULL))
    {
        return idx;
    }
    return -1;
}

S32 iSGTgtFormat(st_ISGSESSION* isgdata, S32 tgtidx, S32 async, S32* canRecover)
{
    return 0;
}

U32 iSGTgtState(st_ISGSESSION* isgdata, S32 tgtidx, const char* dpath)
{
    return 0;
}

S32 iSGTgtSetActive(st_ISGSESSION* isgdata, S32 tgtidx)
{
    return FALSE;
}

S32 iSGTgtHaveRoom(st_ISGSESSION* isgdata, S32 tidx, S32 fsize, const char* dpath,
                   const char* fname, S32* bytesNeeded, S32* availOnDisk, S32* needFile)
{
    return FALSE;
}

S32 iSGTgtHaveRoomStartup(st_ISGSESSION* isgdata, S32 tidx, S32 fsize, const char* dpath,
                          const char* fname, S32* bytesNeeded, S32* availOnDisk, S32* needFile)
{
    return FALSE;
}

S32 iSGFileSize(st_ISGSESSION* isgdata, const char* fname)
{
    return 0;
}

char* iSGFileModDate(st_ISGSESSION* isgdata, const char* fname)
{
    return iSGFileModDate(isgdata, fname, NULL, NULL, NULL, NULL, NULL, NULL);
}

static S32 iSG_get_fmoddate(st_ISG_MEMCARD_DATA* mcdata, const char* fname, int* sec, int* min,
                            int* hr, int* mon, int* day, int* yr)
{
    return FALSE;
}

char* iSGFileModDate(st_ISGSESSION* isgdata, const char* fname, S32* sec, S32* min, S32* hr,
                     S32* mon, S32* day, S32* yr)
{
    static char datestr[0x40] = { 0 };
    int sec_str = 0;
    int min_str = 0;
    int hr_str = 0;
    int mon_str = 0;
    int day_str = 0;
    int yr_str = 0;
    if (iSG_get_fmoddate(&isgdata->mcdata[isgdata->slot], fname, &sec_str, &min_str, &hr_str,
                         &mon_str, &day_str, &yr_str) != 0)
    {
        sprintf(datestr, "%02d/%02d/%04d %02d:%02d:%02d", mon_str, day_str, yr_str, hr_str, min_str,
                sec_str);

        if (sec != NULL)
        {
            *sec = sec_str;
        }
        if (min != NULL)
        {
            *min = min_str;
        }
        if (hr != NULL)
        {
            *hr = hr_str;
        }
        if (mon != NULL)
        {
            *mon = mon_str;
        }
        if (day != NULL)
        {
            *day = day_str;
        }
        if (yr != NULL)
        {
            *yr = yr_str;
        }
    }
    else
    {
        sprintf(datestr, "<Unknown Modification>");
    }
    return datestr;
}

void iSGMakeTimeStamp(char* str)
{
}

S32 iSGSelectGameDir(st_ISGSESSION* isgdata, const char* dname)
{
    return FALSE;
}

S32 iSGSetupGameDir(st_ISGSESSION* isgdata, const char* dname, S32 force_iconfix)
{
    return 1;
}

S32 iSGSaveFile(st_ISGSESSION* isgdata, const char* fname, char* data, S32 n, S32 async, char* arg5)
{
    return FALSE;
}

S32 iSGLoadFile(st_ISGSESSION* isgdata, const char* fname, char* databuf, S32 async)
{
    S32 numBytes = iSGFileSize(isgdata, fname);
    return iSGReadLeader(isgdata, fname, databuf, numBytes, async);
}

S32 iSGReadLeader(st_ISGSESSION* isgdata, const char* fname, char* databuf, S32 numbytes, S32 async)
{return FALSE;}

en_ASYNC_OPSTAT iSGPollStatus(st_ISGSESSION* isgdata, en_ASYNC_OPCODE* curop, S32 block)
{
    return isgdata->unk_26c;
}

en_ASYNC_OPERR iSGOpError(st_ISGSESSION* isgdata, char* errmsg)
{
    static const char* errmsgs[0x16] = {
        "No current error",
        "No operation in async queue",
        "Too many async ops queued simultaneously",
        "Init Failed",
        "Unable to access Save Game Directory",
        "Access Error - no card ?!? (eg yanked out)",
        "Access Error - no room on card (file handles free bytes, etc)",
        "Access Error - card is damaged or something bad",
        "Access Error - file being loaded appears to be corrupt (I-Level)",
        "Access Error - general problem",
        "Save Error - Not enough free space to save file",
        "Save Error - during initalization (async queue)",
        "Save Error - during write",
        "Save Error - opening file",
        "Load Error - during initalization (async queue)",
        "Load Error - during read",
        "Load Error - opening file",
        "Target problem (general error)",
        "Target Error - media removed or changed",
        "Target Error - Not ready for I/O (unformatted?)",
        "Operation encountered unknown error",
        NULL
    };

    en_ASYNC_OPERR err;
    if (errmsg == NULL)
    {
        return isgdata->unk_268;
    }

    if (isgdata->unk_268 < ISG_OPERR_NOMORE)
    {
        strncpy(errmsg, errmsgs[isgdata->unk_268], 0x80);
    }
    else
    {
        strncpy(errmsg, errmsgs[ISG_OPERR_UNKNOWN], 0x80);
    }
    errmsg[0x7f] = NULL;
    return isgdata->unk_268;
}

// Looks equivalent. Can't get variable initializtions to match.
S32 iSG_mcidx2slot(S32 param1, S32* out_slot, S32* param3)
{return 0;}

S32 iSGCheckForWrongDevice()
{
    return -1;
}

S32 iSGCheckForCorruptFiles(st_ISGSESSION* isgdata, char files[][64])
{return 0;}

U8 iSGCheckMemoryCard(st_ISGSESSION* isgdata, S32 index)
{
    return 0;
}

void iSGAutoSave_Startup()
{
}

st_ISGSESSION* iSGAutoSave_Connect(S32 idx_target, void* cltdata, void (*chg)(void*, en_CHGCODE))
{
    st_ISGSESSION* isgdata = iSGSessionBegin(cltdata, chg, 1);
    if (isgdata == NULL)
    {
        return isgdata;
    }

    if (iSGTgtSetActive(isgdata, idx_target) == 0)
    {
        iSGSessionEnd(isgdata);
        isgdata = NULL;
    }
    return isgdata;
}

void iSGAutoSave_Disconnect(st_ISGSESSION* isg)
{
    iSGSessionEnd(isg);
}

S32 iSGAutoSave_Monitor(st_ISGSESSION* isg, S32 idx_target)
{
    if (isg == NULL)
    {
        return 0;
    }

    U32 ret = iSGTgtState(isg, idx_target, NULL);
    if (ret == 0 || (ret & 1) == 0)
    {
        globals.autoSaveFeature = 0;
        return 0;
    }
    return 1;
}
