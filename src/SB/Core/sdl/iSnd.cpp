#include "iSnd.h"

#include "xFile.h"
#include "xSnd.h"
#include "xString.h"
#include "xstransvc.h"
#include "xMath.h"

#include "iADPCM.h"

#include <cassert>
#include <macros.h>
#include <rwplcore.h>

#include <cmath>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <types.h>

#include <immintrin.h>
#include <SDL3/SDL_audio.h>
#include "SDL3/SDL_error.h"
#include <SDL3/SDL_log.h>

// The header of a loaded SNDI asset.
struct XboxSNDI
{
    U32 num_sfx; // 0x00
    U32 num_streams; // 0x04
    U32 num_cutscene; // 0x08

    // one entry for sum of previous fields
    XboxSndEntry entry[]; // 0xc
};

// Size: 0x11c
struct sinfo
{
    tag_xFile file;
    void* snd_mem;
    XboxSNDI* toc;
};

static char soundInited = 0;
static SDL_AudioDeviceID output_device = 0;
static S32 sinfo_array_max = 0;
static sinfo sinfo_array[12];
// Stores result of most recent iSndLookup
static iSndFileInfo snd;

#define NUM_STREAMS 6
#define NUM_EFFECTS (ISND_TOTAL_VOICES - NUM_STREAMS)
static SDL_AudioStream* voices[ISND_TOTAL_VOICES] = { 0 };

void iSndInit()
{
    soundInited = 1;
    output_device = SDL_OpenAudioDevice(SDL_AUDIO_DEVICE_DEFAULT_PLAYBACK, NULL);
}

void iSndExit()
{
    soundInited = 0;
    SDL_CloseAudioDevice(output_device);
    output_device = 0;
}

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

    for (S32 i = 0; i < ISND_TOTAL_VOICES; i++)
    {
        if (gSnd.voice[i].assetID == assetID)
        {
            SDL_AudioStream* stream = voices[i];
            if (SDL_AudioStreamDevicePaused(stream))
            {
                return TRUE;
            }
            if (SDL_GetAudioStreamQueued(stream))
            {
                return TRUE;
            }
            return FALSE;
        }
    }
    return true;
}

bool iSndIsPlaying(U32 assetID, U32 parid)
{
    for (U32 i = 0; i < ISND_TOTAL_VOICES; i++)
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

    for (S32 i = 0; i < ISND_TOTAL_VOICES; i++)
    {
        if (gSnd.voice[i].sndID == handle)
        {
            SDL_AudioStream* stream = voices[i];
            if (SDL_AudioStreamDevicePaused(stream))
            {
                return TRUE;
            }
            if (SDL_GetAudioStreamQueued(stream))
            {
                return TRUE;
            }
            return FALSE;
        }
    }
    return false;
}

iSndFileInfo* iSndLookup(U32 aid)
{
    static S32 strm_id = 1;
    static S32 snd_id = 0x1000;

    if (aid == 0)
    {
        return NULL;
    }

    for (S32 i = sinfo_array_max - 1; i >= 0; i--)
    {
        XboxSNDI* info = sinfo_array[i].toc;
        if (info == NULL)
        {
            continue;
        }

        XboxSndEntry* entry = info->entry;
        U32 n = info->num_sfx;
        U32 j = 0;

        for (; j < n; j++)
        {
            if (aid == entry[j].assetID)
            {
                memcpy(&snd, &entry[j], sizeof(XboxSndEntry));
                snd.id = snd_id++;
                if (snd_id >= 0x7ffa)
                {
                    snd_id = 0x1000;
                }
                return &snd;
            }
        }

        n = info->num_streams + n;
        for (; j < n; j++)
        {
            if (aid == entry[j].assetID)
            {
                memcpy(&snd, &entry[j], sizeof(XboxSndEntry));
                snd.id = strm_id++;
                if (strm_id >= 0xffe)
                {
                    strm_id = 1;
                }
                return &snd;
            }
        }

        n = info->num_cutscene + n;
        for (; j < n; j++)
        {
            if (aid == entry[j].assetID)
            {
                memcpy(&snd, &entry[j], sizeof(XboxSndEntry));
                snd.id = strm_id++;
                if (strm_id >= 0xffe)
                {
                    strm_id = 1;
                }
                return &snd;
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

    S32 i;
    for (i = 0; i < ISND_TOTAL_VOICES; i++)
    {
        if (gSnd.voice[i].sndID == snd)
            break;
    }

    if (i < ISND_TOTAL_VOICES)
    {
        SDL_AudioStream* stream = voices[i];
        if (stream == NULL)
        {
            return;
        }
        if (pause)
        {
            SDL_UnbindAudioStream(stream);
        }
        else if (SDL_GetAudioStreamDevice(stream) == NULL)
        {
            SDL_BindAudioStream(output_device, stream);
        }
    }
}

void iSndStop(U32 snd)
{
    if (snd == 0)
    {
        return;
    }

    xSndVoiceInfo* vp = NULL;
    SDL_AudioStream** stream = NULL;
    for (S32 i = 0; i < ISND_TOTAL_VOICES; i++)
    {
        if (gSnd.voice[i].sndID == snd)
        {
            vp = &gSnd.voice[i];
            stream = &voices[i];
        }
    }

    if (stream == NULL || *stream == NULL)
    {
        return;
    }
    assert(vp);

    SDL_DestroyAudioStream(*stream);
    vp->flags &= ~XSND_VOICE_ACTIVE;
    *stream = NULL;
}

void iSndUpdate()
{
    if (!soundInited)
    {
        return;
    }

    for (S32 i = 0; i < ISND_TOTAL_VOICES; i++)
    {
        xSndVoiceInfo* vp = &gSnd.voice[i];
        SDL_AudioStream** stream = &voices[i];
        if (stream != NULL && SDL_GetAudioStreamQueued(*stream) == 0)
        {
            SDL_DestroyAudioStream(*stream);
            *stream = NULL;
            vp->flags &= ~XSND_VOICE_ACTIVE;
        }
    }
}

static SDL_AudioStream* InitVoice(S32 idx)
{
    SDL_AudioSpec spec{ .format = SDL_AUDIO_S16LE,
                        .channels = snd.hdr.nChannels,
                        .freq = static_cast<int>(snd.hdr.sample_rate) };
    SDL_AudioStream** stream = &voices[idx];
    assert(*stream == NULL && "Attempted to reinitialize existing voice");
    *stream = SDL_CreateAudioStream(&spec, NULL);
    if (*stream == NULL)
    {
        SDL_Log("Failed to create audio stream: %s", SDL_GetError());
        SDL_DestroyAudioStream(*stream);
        *stream = NULL;
        return NULL;
    }
    if (!SDL_BindAudioStream(output_device, *stream))
    {
        SDL_Log("Failed to bind audio stream: %s", SDL_GetError());
        SDL_DestroyAudioStream(*stream);
        *stream = NULL;
        return NULL;
    }
    return *stream;
}

S32 iSndFindFreeVoice(U32 priority, U32 flags, U32 owner)
{
    if (priority > 0xff)
    {
        priority = 0xff;
    }

    if (flags & XSND_VOICE_TYPE_STREAM)
    {
        if (owner != 0)
        {
            xSndVoiceInfo* begin = gSnd.voice;
            xSndVoiceInfo* end = &begin[NUM_STREAMS];

            for (xSndVoiceInfo* vp = begin; vp != end; vp++)
            {
                S32 i = vp - begin;

                if (vp->lock_owner == 0)
                {
                    continue;
                }
                if (vp->lock_owner != owner)
                {
                    continue;
                }

                if ((vp->flags & (XSND_VOICE_LOCKABLE | XSND_VOICE_ACTIVE)) == 1)
                {
                    iSndStop(vp->sndID);
                }

                if (InitVoice(i) == NULL)
                {
                    return -1;
                }
                return i;
            }
        }

        for (S32 i = 0; i < NUM_STREAMS; i++)
        {
            if (gSnd.voice[i].lock_owner != 0)
            {
                continue;
            }

            if (voices[i] != NULL)
            {
                continue;
            }
            if (InitVoice(i) == NULL)
            {
                return -1;
            }
            return i;
        }
    }
    else
    {
        for (S32 i = 0; i < NUM_EFFECTS; i++)
        {
            if (voices[i + NUM_STREAMS] != NULL)
            {
                continue;
            }
            if (InitVoice(i + NUM_STREAMS) == NULL)
            {
                return -1;
            }
            return i + NUM_STREAMS;
        }
    }

    return -1;
}

S32 iSndPlay(xSndVoiceInfo* vp)
{
    assert(snd.hdr.assetID == vp->assetID &&
           "Snd Asset should have already been looked up before the xSndVoiceInfo was made.");
    S32 voice = vp - gSnd.voice;

    if ((voice < 0) || (voice >= ISND_TOTAL_VOICES))
    {
        return FALSE;
    }

    SDL_AudioStream* stream = voices[voice];

    iSndSetVol(vp->sndID, vp->vol);

    if (voice < NUM_STREAMS)
    {
        if (snd.hdr.wFormatTag == XBOX_SND_FORMAT_XBOX_ADPCM)
        {
            // TODO: Decode this audio when loading the sound data initially.
            Uint8* out_buf;
            Uint32 out_len;
            if (Xbox_ADPCM_Decode(&snd.hdr, &out_buf, &out_len))
            {
                SDL_PutAudioStreamData(stream, out_buf, out_len);
                SDL_FlushAudioStream(stream);
                SDL_free(out_buf);
            }
            else
            {
                SDL_Log("Failed to load WAV: %s", SDL_GetError());
                return 0;
            }
        }
        else
        {
            SDL_PutAudioStreamData(stream, snd.hdr.mem, snd.hdr.Datasize);
            SDL_FlushAudioStream(stream);
        }
        return TRUE;
    }
    else
    {
        SDL_PutAudioStreamData(stream, snd.hdr.mem, snd.hdr.Datasize);
        SDL_FlushAudioStream(stream);
        return TRUE;
    }
}

static void iSndCalcVol(xSndVoiceInfo* vp, SDL_AudioStream* stream)
{
    SDL_SetAudioStreamGain(stream, vp->vol * gSnd.categoryVolFader[vp->category]);
}

static void iSndCalcVol3d(xSndVoiceInfo* vp, SDL_AudioStream* stream)
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
    F32 vol = volscale * (vp->vol * gSnd.categoryVolFader[vp->category]);

    if (ipan < 0)
    {
        ipan = 0;
    }
    else if (ipan > 0x7f)
    {
        ipan = 0x7f;
    }

    SDL_SetAudioStreamGain(stream, vol);
    // TODO: panning
}

void iSndSetVol(U32 snd, F32 vol)
{
    if (snd == 0)
    {
        return;
    }

    SDL_AudioStream* stream = NULL;
    xSndVoiceInfo* info = NULL;
    for (S32 i = 0; i < ISND_TOTAL_VOICES; i++)
    {
        if (gSnd.voice[i].sndID == snd)
        {
            stream = voices[i];
            info = &gSnd.voice[i];
        }
    }
    assert(info);

    if (stream == NULL)
    {
        return;
    }
    if ((info->flags & XSND_VOICE_POSITIONAL) != 0)
    {
        iSndCalcVol3d(info, stream);
    }
    else
    {
        iSndCalcVol(info, stream);
    }
}

void iSndSetPitch(U32 snd, F32 pitch)
{
    // PC_TODO
}

void iSndStartStereo(U32 id1, U32 id2, F32 pitch)
{
    SDL_Log(
        "iSndStartStereo called. This function is not reachable on GC and not implemented on PC.");
}

void iSndStereo(U32 i)
{
    if (i == 0)
    {
        gSnd.stereo = FALSE;
    }
    else
    {
        gSnd.stereo = TRUE;
    }
}

void iSndSceneExit()
{
    S32 done = 0;

    for (S32 i = 0; i < ISND_TOTAL_VOICES; i++)
    {
        if (gSnd.voice[i].sndID != 0)
        {
            iSndStop(gSnd.voice[i].sndID);
        }
    }

    for (S32 i = 0; i < ISND_TOTAL_VOICES; i++)
    {
        if (gSnd.voice[i].sndID != 0)
        {
            iSndStop(gSnd.voice[i].sndID);
        }
    }

    sinfo_array_max--;
    if (sinfo_array[sinfo_array_max].toc != NULL)
    {
        RwFree(sinfo_array[sinfo_array_max].snd_mem);
        RwFree(sinfo_array[sinfo_array_max].toc);
    }
}

S32 iSndLoadSounds(void* data)
{
    XboxSNDI* toc = (XboxSNDI*)data;

    if (toc->num_sfx == 0 && toc->num_streams == 0 && toc->num_cutscene == 0)
    {
        sinfo_array[sinfo_array_max++].toc = NULL;
        return 0;
    }

    if (sinfo_array_max >= 12)
    {
        exit(-1);
    }

    XboxSndEntry* entries = toc->entry;
    sinfo_array[sinfo_array_max].toc = toc;

    char* path = xST_xAssetID_HIPFullPath(entries[0].assetID);
    U32 hash = xStrHash(path);
    sinfo* si = &sinfo_array[sinfo_array_max];

    iFileOpen(path, IFILE_OPEN_READ, &si->file);

    U32 max = 0;
    U32 min = -1;
    XboxSndEntry* e = entries;
    for (S32 i = 0; i < toc->num_sfx; i++)
    {
        st_PKR_ASSET_TOCINFO xinfo;
        xSTGetAssetInfoInHxP(e->assetID, &xinfo, hash);

        U32 off = xinfo.plus_offset + (xinfo.sector << 5);
        U32 end = off + xinfo.size;
        if (min > off)
        {
            min = off;
        }
        if (max < end)
        {
            max = end;
        }

        e->mem = (void*)off;
        e++;
    }

    for (S32 i = 0; i < toc->num_streams; i++)
    {
        st_PKR_ASSET_TOCINFO xinfo;

        xSTGetAssetInfo(entries[i + toc->num_sfx].assetID, &xinfo);
        xinfo.size = ALIGN_NEXT(xinfo.size, 0x20);

        U32 off = xinfo.plus_offset + (xinfo.sector << 5);
        U32 end = off + xinfo.size;
        if (min > off)
        {
            min = off;
        }
        if (max < end)
        {
            max = end;
        }

        entries[i + toc->num_sfx].mem = (void*)off;
    }

    if (toc->num_sfx != 0 || toc->num_streams != 0)
    {
        U32 total = max - min;

        void* mem = RwMalloc(total);
        sinfo_array[sinfo_array_max].snd_mem = mem;
        SPTR delta = (-min + (UPTR)mem);

        XboxSndEntry* e2 = entries;
        for (S32 i = 0; i < toc->num_sfx; i++)
        {
            e2->mem = (void*)((UPTR)e2->mem + delta);
            e2++;
        }

        for (S32 i = 0; i < toc->num_streams; i++)
        {
            entries[i + toc->num_sfx].mem = (void*)((UPTR)entries[i + toc->num_sfx].mem + delta);
        }

        iFileSeek(&si->file, min, IFILE_SEEK_SET);
        iFileRead(&si->file, mem, total);
    }

    sinfo_array_max++;

    return 1;
}

void iSndSetExternalCallback(iSndExternalCallback callback)
{
    // Not implemented on GC or PC
}

F32 iSndGetVol(U32 snd)
{
    xSndVoiceInfo* vp = &gSnd.voice[0];

    for (int i = 0; i < 0x40; i++)
    {
        if (vp->flags & XSND_VOICE_ACTIVE)
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

// Required functions that are N/A to PC

void iSndWaitForDeadSounds()
{
}

void iSndSuspendCD(U32)
{
}
