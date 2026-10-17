#include "isavegame.h"

#include "zGlobals.h"

#include "iTRC.h"

#include <cassert>
#include <climits>
#include <cstdint>
#include <stdio.h>
#include <string.h>
#include <types.h>

#include <immintrin.h>
#include "SDL3/SDL_error.h"
#include "SDL3/SDL_filesystem.h"
#include "SDL3/SDL_log.h"
#include "SDL3/SDL_storage.h"
#include "SDL3/SDL_time.h"

struct st_ISG_MEMCARD_DATA
{
    SDL_PathInfo stat;
};

#define ISG_NUM_SLOTS 2
#define ISG_NUM_FILES 3
struct st_ISGSESSION
{
    st_ISG_MEMCARD_DATA mcdata[ISG_NUM_SLOTS];
    S32 slot;
    en_ASYNC_OPERR io_err;
    en_ASYNC_OPSTAT io_status;
};

static S32 g_isginit = 0;
static SDL_Storage* user_storage = NULL;

static st_ISGSESSION g_isgdata_MAIN = {};

S32 iSGStartup()
{
    if (g_isginit++ != 0)
    {
        return g_isginit;
    }

    user_storage = SDL_OpenUserStorage("bfbbdecomp", "Battle For Bikini Bottom", 0);
    if (user_storage == NULL)
    {
        SDL_Log("Failed to get save directory: %s", SDL_GetError());
        g_isginit--;
        return 0;
    }

    return g_isginit;
}

S32 iSGShutdown()
{
    if (g_isginit != 0)
    {
        g_isginit--;
        SDL_CloseStorage(user_storage);
    }
    return 1;
}

char* iSGMakeName(en_NAMEGEN_TYPE type, const char* base, S32 idx)
{
    static S32 rotate = 0;
    static char rotatebuf[8][32] = { 0 };

    const char* fmt_sd = "%s%02d.sav";
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

    return &g_isgdata_MAIN;
}

void iSGSessionEnd(st_ISGSESSION* isgdata)
{
    memset(isgdata, 0, sizeof(st_ISGSESSION));
}

S32 iSGTgtCount(st_ISGSESSION* isgdata, S32* max)
{
    if (max != NULL)
    {
        *max = 2;
    }

    return 2;
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
    return TRUE;
}

U32 iSGTgtState(st_ISGSESSION* isgdata, S32 tgtidx, const char* dpath)
{
    return 0xf;
}

S32 iSGTgtSetActive(st_ISGSESSION* isgdata, S32 tgtidx)
{
    isgdata->slot = tgtidx;
    return TRUE;
}

S32 iSGTgtHaveRoom(st_ISGSESSION* isgdata, S32 tidx, S32 fsize, const char* dpath,
                   const char* fname, S32* bytesNeeded, S32* availOnDisk, S32* needFile)
{
    // Xbox block size is 16KB
    Sint64 remaining = SDL_GetStorageSpaceRemaining(user_storage) / (1024 * 16);
    *availOnDisk = MIN(remaining, INT32_MAX);
    // PCs are big and if there's not disk space for a save file then the user probably already
    // has huge problems
    return TRUE;
}

S32 iSGTgtHaveRoomStartup(st_ISGSESSION* isgdata, S32 tidx, S32 fsize, const char* dpath,
                          const char* fname, S32* bytesNeeded, S32* availOnDisk, S32* needFile)
{
    return iSGTgtHaveRoom(isgdata, tidx, fsize, dpath, fname, bytesNeeded, availOnDisk, needFile);
}

static S32 iSG_get_finfo(st_ISG_MEMCARD_DATA* mcdata, const char* fpath)
{
    if (!SDL_GetStoragePathInfo(user_storage, fpath, &mcdata->stat))
    {
        return FALSE;
    }

    return TRUE;
}

// Combine save directory and file name
static const char* iSGFullSavePath(const st_ISGSESSION* isgdata, const char* fname)
{
    static char path[4096] = { 0 };

    S32 slot = isgdata->slot;
    snprintf(path, sizeof(path), "SaveSlot%d/%s", slot, fname);
    return path;
}

S32 iSGFileSize(st_ISGSESSION* isgdata, const char* fname)
{
    if (isgdata->slot < 0)
    {
        return -1;
    }

    st_ISG_MEMCARD_DATA* data = &isgdata->mcdata[isgdata->slot];
    const char* path = iSGFullSavePath(isgdata, fname);
    if (iSG_get_finfo(data, path))
    {
        assert(data->stat.size <= INT32_MAX);
        return data->stat.size;
    }
    return -1;
}

char* iSGFileModDate(st_ISGSESSION* isgdata, const char* fname)
{
    return iSGFileModDate(isgdata, fname, NULL, NULL, NULL, NULL, NULL, NULL);
}

static S32 iSG_get_fmoddate(st_ISGSESSION* isgdata, const char* fname, int* sec, int* min, int* hr,
                            int* mon, int* day, int* yr)
{
    S32 rc = 1;
    SDL_Time timeSinceEpoch;
    SDL_GetCurrentTime(&timeSinceEpoch);
    SDL_DateTime calendar_time;
    SDL_TimeToDateTime(timeSinceEpoch, &calendar_time, true);

    st_ISG_MEMCARD_DATA* mcdata = &isgdata->mcdata[isgdata->slot];
    const char* path = iSGFullSavePath(isgdata, fname);
    if (iSG_get_finfo(mcdata, path) == 0)
    {
        rc = 0;
    }
    else
    {
        SDL_DateTime time;
        SDL_TimeToDateTime(mcdata->stat.modify_time, &time, true);

        if (sec)
        {
            *sec = time.second;
        }
        if (min)
        {
            *min = time.minute;
        }
        if (hr)
        {
            *hr = time.hour;
        }
        if (mon)
        {
            *mon = time.month + 1;
        }
        if (day)
        {
            *day = time.day;
        }
        if (yr)
        {
            *yr = time.year;
        }
    }

    return rc;
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
    if (iSG_get_fmoddate(isgdata, fname, &sec_str, &min_str, &hr_str, &mon_str, &day_str,
                         &yr_str) != 0)
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
    SDL_Time timeSinceEpoch;
    SDL_GetCurrentTime(&timeSinceEpoch);
    SDL_DateTime calendar_time;
    SDL_TimeToDateTime(timeSinceEpoch, &calendar_time, true);
    sprintf(str, "%02d/%02d/%04d %02d:%02d:%02d", calendar_time.month + 1, calendar_time.day,
            calendar_time.year, calendar_time.hour, calendar_time.minute, calendar_time.second);
}

S32 iSGSelectGameDir(st_ISGSESSION* isgdata, const char* dname)
{
    if (isgdata->slot < 0)
    {
        return 0;
    }
    st_ISG_MEMCARD_DATA* data = &isgdata->mcdata[isgdata->slot];

    S32 count = 0;
    for (S32 idx = 0; idx < ISG_NUM_FILES; ++idx)
    {
        const char* n = iSGMakeName(ISG_NGTYP_GAMEFILE, NULL, idx);
        const char* path = iSGFullSavePath(isgdata, n);
        if (iSG_get_finfo(data, path) != 0)
        {
            count++;
        }
    }

    return count != 0;
}

S32 iSGSetupGameDir(st_ISGSESSION* isgdata, const char* dname, S32 force_iconfix)
{
    const char* path = iSGFullSavePath(isgdata, "");
    SDL_CreateStorageDirectory(user_storage, path);
    return TRUE;
}

S32 iSGSaveFile(st_ISGSESSION* isgdata, const char* fname, char* data, S32 n, S32 async, char* arg5)
{
    const char* path = iSGFullSavePath(isgdata, fname);
    if (!SDL_WriteStorageFile(user_storage, path, data, n))
    {
        isgdata->io_err = ISG_OPERR_SVWRITE;
        isgdata->io_status = ISG_OPSTAT_FAILURE;
        SDL_Log("Failed to save file \"%s\": %s", path, SDL_GetError());
        return FALSE;
    }
    isgdata->io_err = ISG_OPERR_NONE;
    isgdata->io_status = ISG_OPSTAT_SUCCESS;
    return TRUE;
}

S32 iSGLoadFile(st_ISGSESSION* isgdata, const char* fname, char* databuf, S32 async)
{
    S32 numBytes = iSGFileSize(isgdata, fname);
    return iSGReadLeader(isgdata, fname, databuf, numBytes, async);
}

// The GC implementation uses this function to read a specified number of bytes starting from the end of the
// GC icondata. We don't have any of that so this just reads the file directly
S32 iSGReadLeader(st_ISGSESSION* isgdata, const char* fname, char* databuf, S32 numbytes, S32 async)
{
    st_ISG_MEMCARD_DATA* data;

    if (isgdata->slot < 0)
    {
        isgdata->io_status = ISG_OPSTAT_FAILURE;
        isgdata->io_err = ISG_OPERR_NOCARD;
        return FALSE;
    }

    const char* path = iSGFullSavePath(isgdata, fname);
    if (!SDL_ReadStorageFile(user_storage, path, databuf, numbytes))
    {
        isgdata->io_status = ISG_OPSTAT_FAILURE;
        isgdata->io_err = ISG_OPERR_LDREAD;
        SDL_Log("Failed to read save file \"%s\": %s", path, SDL_GetError());
        return FALSE;
    }

    isgdata->io_err = ISG_OPERR_NONE;
    isgdata->io_status = ISG_OPSTAT_SUCCESS;
    return TRUE;
}

en_ASYNC_OPSTAT iSGPollStatus(st_ISGSESSION* isgdata, en_ASYNC_OPCODE* curop, S32 block)
{
    return isgdata->io_status;
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
        return isgdata->io_err;
    }

    if (isgdata->io_err < ISG_OPERR_NOMORE)
    {
        strncpy(errmsg, errmsgs[isgdata->io_err], 0x80);
    }
    else
    {
        strncpy(errmsg, errmsgs[ISG_OPERR_UNKNOWN], 0x80);
    }
    errmsg[0x7f] = NULL;
    return isgdata->io_err;
}

// Looks equivalent. Can't get variable initializtions to match.
S32 iSG_mcidx2slot(S32 tidx, S32* out_slot, S32* cardsReady)
{
    *out_slot = tidx;
    return TRUE;
}

S32 iSGCheckForWrongDevice()
{
    return -1;
}

S32 iSGCheckForCorruptFiles(st_ISGSESSION* isgdata, char files[][64])
{
    return 0;
}

U8 iSGCheckMemoryCard(st_ISGSESSION* isgdata, S32 index)
{
    return TRUE;
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
