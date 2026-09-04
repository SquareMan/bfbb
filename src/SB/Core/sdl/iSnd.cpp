#include "iSnd.h"

#include "iCutscene.h"
#include "iTRC.h"
#include "xFile.h"
#include "xSnd.h"
#include "xString.h"
#include "xstransvc.h"
#include "xMath.h"

#include <rwplcore.h>

#include <cmath>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <types.h>

// FIXME: declared in zGame.h, which Core must not include
void zGameScreenTransitionUpdate(F32 percentComplete, char* msg, U8* rgba);

u32 aram_array[40];

// Private to this translation unit; iSndMessWithEA calls it before the
// definition, so it needs the forward declaration.
U32 SampleToNybbleAddress(U32 sample);

// Size: 0x20
// This was not in dwarf data
struct vinfo
{
    U32 flags;
    U32 aid;
    F32 xc;
    S32 x10;
    S32 x14;
    S32 x18;
    S32 x1c;
};

// The GC DSPADPCM header, with the asset ID appended. This is what iSnd.h calls
// sDSPADPCM (see iSndMessWithEA, which writes buffer[5] == loop_end).
// Size: 0x64
struct sndhdr
{
    U32 num_samples; // 0x00
    U32 num_nibbles; // 0x04
    U32 sample_rate; // 0x08
    U16 loop_flag; // 0x0C
    U16 format; // 0x0E
    U32 loop_start; // 0x10
    U32 loop_end; // 0x14
    U32 cur_addr; // 0x18
    S16 coef[16]; // 0x1C
    U16 gain; // 0x3C
    U16 pred_scale; // 0x3E
    U16 yn1; // 0x40
    U16 yn2; // 0x42
    U16 loop_pred_scale; // 0x44
    U16 loop_yn1; // 0x46
    U16 loop_yn2; // 0x48
    U16 pad[11]; // 0x4A -- pad[0] is tagged 0x63 for memory streams
    U32 assetID; // 0x60
};

// The header of a loaded SNDI asset.
struct sndinfo
{
    U32 num_sfx; // 0x00
    U32 total_size; // 0x04
    U32 num_streams; // 0x08
    U32 num_cutscene; // 0x0C
    sndhdr entry[1]; // 0x10
};

// Size: 0x11c
struct sinfo
{
    tag_xFile file; // 0x000
    U32 base; // 0x114
    sndinfo* info; // 0x118
};

// Size: 0x180
struct sndlookup
{
    sndhdr hdr; // 0x000
    U32 id; // 0x064
    tag_xFile file; // 0x068
    U32 pad; // 0x17c
};

// Size: 0x10c
// Looks like this might be a vinfo struct at the beginning here.
struct UNK_STREAM
{
    vinfo vinf;
    sndhdr hdr;
    U32 x84;
    U32 offset;
    U32 x8c;
    U32 x90;
    U32 x94;
    U32 source_a;
    u32 dest_a;
    u32 dest_b;
    U32 source_b;
    U32 xe4;
    U32 x108;
};

UNK_STREAM streams[6];

vinfo voices[58];

sinfo sinfo_array[12];

sndlookup snd;

U32* ua_stream_buffer = NULL; //unaligned stream buffer
U32* stream_buffer = 0;
u32 silence_buffer = 0;
volatile u32 zero_point = 0;
volatile u32 zero_end = 0;
S32 sinfo_array_max = 0;
volatile U32 SoundFlags = 0;
volatile S32 fc = 0;
static char soundInited = 0;
U32 houston_we_have_a_problem = 0;

static const char* dump_flags(U32 flags)
{
    static char str[0x40];

    memset(str, 0, sizeof(str));

    char* p = str;
    char cvt[5] = "-01X";
    *p++ = 'L';
    *p++ = cvt[(flags & 0x200) ? 1 : (flags & 0x400) ? 2 : 0];
    *p++ = 'D';
    *p++ = cvt[(flags & 0x1000) ? 1 : (flags & 0x2000) ? 2 : 0];
    *p++ = 'P';
    *p++ = cvt[(flags & 0x4000) ? 1 : (flags & 0x8000) ? 2 : 0];
    *p++ = (flags & 0x400000) ? 'F' : '-';
    *p++ = 'R';
    *p++ = (flags & 0x100) ? 'X' : '-';
    *p++ = 'D';
    *p++ = (flags & 0x800) ? 'X' : '-';

    return str;
}

void iSndInit()
{
    soundInited = 1;
}

void iSndExit()
{
    soundInited = 0;
}

//not sure where this type is from.
void iSndSetEnvironmentalEffect(isound_effect)
{
    return;
}

void iSndInitSceneLoaded()
{
}

bool iSndIsPlaying(U32 assetID)
{
    if (assetID == 0)
    {
        return false;
    }

    for (S32 i = 0; i < 6; i++)
    {
        if (gSnd.voice[i].assetID == assetID)
        {
            if (streams[i].vinf.flags & 0xC000 && (streams[i].vinf.flags & 0x82) == 0)
            {
                return true;
            }
            return false;
        }
    }

    for (S32 i = 0; i < 0x3a; i++)
    {
        if (gSnd.voice[i + 6].assetID == assetID)
        {
            if (voices[i].flags & 0x4 && (voices[i].flags & 0x8) == 0)
            {
                return true;
            }
            return false;
        }
    }
    return true;
}

bool iSndIsPlaying(U32 assetID, U32 parid)
{
    for (U32 i = 0; i < 0x40; i++)
    {
        if ((assetID == 0 || gSnd.voice[i].assetID == assetID) && gSnd.voice[i].parentID == parid)
        {
            if (iSndIsPlaying(gSnd.voice[i].assetID))
            {
                return true;
            };
        }
    }
    return false;
}

bool iSndIsPlayingByHandle(U32 handle)
{
    if (handle == 0)
    {
        return false;
    }

    for (S32 i = 0; i < 6; i++)
    {
        if (gSnd.voice[i].sndID == handle)
        {
            return (streams[i].vinf.flags & 0xC000 && (streams[i].vinf.flags & 0x82) == 0);
        }
    }

    for (S32 i = 0; i < 0x3a; i++)
    {
        if (gSnd.voice[i + 6].sndID == handle)
        {
            return (voices[i].flags & 0x4 && (voices[i].flags & 0x8) == 0);
        }
    }
    return false;
}

static S32 sound_stream;

iSndFileInfo* iSndLookup(U32 id)
{
    static S32 strm_id = 1;
    static S32 snd_id = 0x1000;

    sound_stream = 0;

    if (id == 0)
    {
        return NULL;
    }

    for (S32 i = sinfo_array_max - 1; i >= 0; i--)
    {
        sndinfo* info = sinfo_array[i].info;
        if (info == NULL)
        {
            continue;
        }

        sndhdr* entry = info->entry;
        U32 n = info->num_sfx;
        U32 j = 0;

        for (; j < n; j++)
        {
            if (id == entry[j].assetID)
            {
                memcpy(&snd, &entry[j], sizeof(sndhdr));
                memcpy(&snd.file, &sinfo_array[i], sizeof(tag_xFile));
                snd.id = snd_id++;
                if (snd_id >= 0x7ffa)
                {
                    snd_id = 0x1000;
                }
                return (iSndFileInfo*)&snd;
            }
        }

        n = info->num_streams + n;
        for (; j < n; j++)
        {
            if (id == entry[j].assetID)
            {
                memcpy(&snd, &entry[j], sizeof(sndhdr));
                memcpy(&snd.file, &sinfo_array[i], sizeof(tag_xFile));
                snd.id = strm_id++;
                if (strm_id >= 0xffe)
                {
                    strm_id = 1;
                }
                if (entry[j].pad[0] == 0x63)
                {
                    snd.id = 0x1000;
                    sound_stream = 0;
                }
                else
                {
                    sound_stream = 1;
                }
                return (iSndFileInfo*)&snd;
            }
        }

        n = info->num_cutscene + n;
        for (; j < n; j++)
        {
            if (id == entry[j].assetID)
            {
                memcpy(&snd, &entry[j], sizeof(sndhdr));
                memcpy(&snd.file, &sinfo_array[i], sizeof(tag_xFile));
                snd.id = strm_id++;
                if (strm_id >= 0xffe)
                {
                    strm_id = 1;
                }
                sound_stream = 2;
                return (iSndFileInfo*)&snd;
            }
        }
    }

    return NULL;
}

void iSndPause(U32 snd, U32 pause)
{
    if (!soundInited)
    {
        return;
    }
}

void iSndStop(U32 snd)
{
    if (snd == 0)
    {
        return;
    }
}

U32 iVolFromX(F32 param1)
{
    float f = MAX(param1, 1e-20f);

    S32 i = 43.43f * xlog(f);
    S32 comp = MIN(i, 0);

    if (comp < -0x388)
    {
        return -0x388;
    }
    else
    {
        return MIN(i, 0);
    }
}

void iSndCalcVol(xSndVoiceInfo* vp, vinfo* info)
{
    S32 vol = iVolFromX(vp->vol * gSnd.categoryVolFader[vp->category]);
}

void iSndCalcVol3d(xSndVoiceInfo* vp, vinfo* info)
{
    xVec3 to;

    xVec3Sub(&to, &vp->playPos, &gSnd.pos);
    F32 dist2 = xVec3Length2(&to);
    xVec3Normalize(&to, &to);
    F32 pan = xVec3Dot(&to, &gSnd.right);

    F32 volscale;
    if (dist2 > vp->outerRadius2)
    {
        volscale = 0.0f;
    }
    else if (dist2 <= vp->innerRadius2)
    {
        volscale = 1.0f;
    }
    else
    {
        F32 fadeRange = vp->outerRadius2 - vp->innerRadius2;
        volscale = std::sqrtf((fadeRange - (dist2 - vp->innerRadius2)) / fadeRange);
    }

    S32 ipan = (S32)(64.0f * pan) + 0x40;
    S32 vol = iVolFromX(volscale * (vp->vol * gSnd.categoryVolFader[vp->category]));

    if (ipan < 0)
    {
        ipan = 0;
    }
    else if (ipan > 0x7f)
    {
        ipan = 0x7f;
    }
}

void iSndVolUpdate(xSndVoiceInfo* info, vinfo* vinfo)
{
}

U32 staticibuf;

void iSndUpdateSounds()
{
    if (!soundInited)
    {
        return;
    }
}

void iSndUpdate()
{
    if (!soundInited)
    {
        return;
    }
}

S32 iSndFindFreeVoice(U32 priority, U32 flags, U32 owner)
{
    return -1;
}

S32 iSndPrepStream(xSndVoiceInfo* vp)
{
    S32 i = vp - gSnd.voice;
    return i;
}

S32 iSndPlayMemStream(xSndVoiceInfo* vp)
{
    return 0;
}

S32 iSndPlayStream(xSndVoiceInfo* vp)
{
    return 0;
}

S32 iSndPlaySound(xSndVoiceInfo* vp)
{
    return 0;
}

S32 iSndPlay(xSndVoiceInfo* vp)
{
    S32 offset = (S32)vp - (S32)gSnd.voice;
    S32 div = offset / 100;

    xSTAssetName(vp->assetID);

    if ((div < 0) || (div >= 64))
    {
        return 0;
    }
    else if (div < 6)
    {
        U32 ret = iSndPrepStream(vp);
        if (ret < 0x3a)
        {
            if (vp->flags & 0x200)
            {
                return iSndPlayMemStream(vp);
            }
            else
            {
                return iSndPlayStream(vp);
            }
        }
        return ret;
    }
    else
    {
        return iSndPlaySound(vp);
    }
}

void iSndSetVol(U32 snd, F32 vol)
{
}

void iSndSetPitch(U32 snd, F32 pitch)
{
}

void iSndStartStereo(U32 id1, U32 id2, F32 pitch)
{
}

void iSndStereo(U32 i)
{}

void iSndWaitForDeadSounds()
{
    fc = 0;
    for (int i = 0x8c; fc < i;)
    {
        // `i` is weird, it's stored in a saved register but never mutated. However it needs to be mutated to put it in a saved register
        i = fc;
        while (fc < i + 0xe)
            ;
        // This adds the nonmatching instruction, but get's us back to the state `i`'s register should be in.
        i = 0x8c;
        iSndUpdate();
    }
}

void iSndSuspendCD(U32)
{
}

void iSndSceneExit()
{}

void iSndMessWithEA(sDSPADPCM* param1)
{
    if (param1 != NULL)
    {
        param1->buffer[5] = SampleToNybbleAddress(param1->buffer[0] - 1);
    }
}

U32 SampleToNybbleAddress(U32 sample)
{
    U32 a = __mulhwu(0x24924925, sample);
    U32 b = (sample - a) >> 1;

    a = b + a;
    b = (a >> 3);
    a = (a << 1) & 0xfffffff0;
    a = a + (sample - (b * 0xe)) + 2;

    return a;
}

void sndloadcb(tag_xFile* tag)
{
    SoundFlags = 0;
}
S32 iSndLoadSounds(void* data)
{
    return 1;
}

void iSndDIEDIEDIE()
{

}

void iSndSetExternalCallback(iSndExternalCallback callback)
{
}

void iSndSuspend()
{
}

void iSndResume()
{
}

F32 iSndGetVol(U32 snd)
{
    xSndVoiceInfo* vp = &gSnd.voice[0];

    for (int i = 0; i < 0x40; i++)
    {
        if (vp->flags & 1)
        {
            if (vp->sndID == snd)
            {
                if (gSnd.categoryVolFader[vp->category] <= 0.0f)
                {
                    return 0.0f;
                }
                return (vp->vol / gSnd.categoryVolFader[vp->category]);
            }
        }
        vp++;
    }

    return 0.0f;
}
