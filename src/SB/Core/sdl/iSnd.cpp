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

static SDL_AudioStream* iSndInitVoice(S32 idx)
{
    SDL_AudioSpec spec{ .format = SDL_AUDIO_S16LE,
                        .channels = snd.hdr.nChannels,
                        .freq = static_cast<int>(snd.hdr.sample_rate) };
    assert(voices[idx] == NULL && "Attempted to reinitialize existing voice");
    voices[idx] = SDL_CreateAudioStream(&spec, NULL);
    if (voices[idx] == NULL)
    {
        SDL_Log("Failed to create audio stream: %s", SDL_GetError());
        SDL_DestroyAudioStream(voices[idx]);
        voices[idx] = NULL;
        return NULL;
    }
    if (!SDL_BindAudioStream(output_device, voices[idx]))
    {
        SDL_Log("Failed to bind audio stream: %s", SDL_GetError());
        SDL_DestroyAudioStream(voices[idx]);
        voices[idx] = NULL;
        return NULL;
    }
    return voices[idx];
}

static void iSndDeinitVoice(S32 idx)
{
    if (voices[idx] == NULL)
    {
        return;
    }

    SDL_DestroyAudioStream(voices[idx]);
    voices[idx] = NULL;
    gSnd.voice[idx].flags &= ~XSND_VOICE_ACTIVE;
}

// Lookup the index of a given sound ID in the voices array
// Return -1 if sound ID is invalid
static S32 iSndIdToIdx(S32 sndID)
{
    if (sndID == 0)
    {
        return -1;
    }

    for (S32 i = 0; i < ISND_TOTAL_VOICES; i++)
    {
        if (gSnd.voice[i].sndID == sndID)
        {
            return i;
        }
    }
    return -1;
}

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

    S32 i = iSndIdToIdx(snd);
    if (i < 0)
    {
        return;
    }

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

void iSndStop(U32 snd)
{
    S32 i = iSndIdToIdx(snd);
    if (i < 0)
    {
        return;
    }

    iSndDeinitVoice(i);
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
        SDL_AudioStream* stream = voices[i];
        if (stream == NULL)
        {
            continue;
        }

        if (SDL_GetAudioStreamQueued(stream) == 0)
        {
            iSndDeinitVoice(i);
            continue;
        }

        if (vp->flags & XSND_VOICE_POSITIONAL)
        {
            // iSndCalcVol3d(vp, stream);
        }
    }
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

                if (iSndInitVoice(i) == NULL)
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
            if (iSndInitVoice(i) == NULL)
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
            if (iSndInitVoice(i + NUM_STREAMS) == NULL)
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
    iSndSetPitch(vp->sndID, vp->pitch);

    SDL_PutAudioStreamData(stream, snd.hdr.mem, snd.hdr.Datasize);
    SDL_FlushAudioStream(stream);

    return TRUE;
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
    S32 i = iSndIdToIdx(snd);
    if (i < 0)
    {
        return;
    }

    SDL_AudioStream* stream = voices[i];
    xSndVoiceInfo* vp = &gSnd.voice[i];
    if (stream == NULL)
    {
        return;
    }

    vp->vol = vol;
    if ((vp->flags & XSND_VOICE_POSITIONAL) != 0)
    {
        iSndCalcVol3d(vp, stream);
    }
    else
    {
        iSndCalcVol(vp, stream);
    }
}

void iSndSetPitch(U32 snd, F32 pitch)
{
    S32 i = iSndIdToIdx(snd);
    if (i < 0)
    {
        return;
    }

    SDL_AudioStream* stream = voices[i];
    if (stream == NULL)
    {
        return;
    }

    // Note: GC iSndSetPitch does not update the xSndVoiceInfo pitch field.
    // Game code never reads/writes it after creating the sound intially so
    // it doesn't actually matter. I will air on the side of matching the
    // original implementation here, but maybe it would be a good idea later
    // to update the value so mods can interact with it?
    // gSnd.voice[i].pitch = pitch;

    F32 ratio = std::powf(2.0f, pitch / 12.0f);
    SDL_SetAudioStreamFrequencyRatio(stream, ratio);
}

void iSndStartStereo(U32 id1, U32 id2, F32 pitch)
{
    SDL_Log(
        "iSndStartStereo called. This function is not reachable on GC and not implemented on PC.");
}

void iSndStereo(U32 i)
{
    gSnd.stereo = i != 0;
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
    sinfo* si = &sinfo_array[sinfo_array_max++];
    if (toc->num_sfx == 0 && toc->num_streams == 0 && toc->num_cutscene == 0)
    {
        si->toc = NULL;
        return 0;
    }
    si->toc = toc;

    XboxSndEntry* entries = toc->entry;
    XboxSndEntry* entries_end = entries + toc->num_sfx + toc->num_streams;
    assert(entries != entries_end && "Sound header entries missing for SNDI asset");

    if (sinfo_array_max >= 12)
    {
        SDL_Log("iSnd: Too many scenes loaded.");
        exit(-1);
    }

    char* path = xST_xAssetID_HIPFullPath(entries[0].assetID);
    U32 hash = xStrHash(path);

    iFileOpen(path, IFILE_OPEN_READ, &si->file);

    U32 total = 0;
    for (XboxSndEntry* e = entries; e != entries_end; e++)
    {
        st_PKR_ASSET_TOCINFO xinfo;
        xSTGetAssetInfoInHxP(e->assetID, &xinfo, hash);

        U32 off = xinfo.plus_offset + (xinfo.sector << 5);

        switch (e->wFormatTag)
        {
        case SND_FORMAT_XBOX_ADPCM:
        {
            U32 decoded_size = 0;
            if (!Xbox_ADPCM_Decode(e, NULL, NULL, &decoded_size))
            {
                SDL_Log("iSnd: Failed to calculate decoded size of Xbox ADPCM sound asset 0x%08x",
                        e->assetID);
                exit(-1);
            }
            total += decoded_size;
            break;
        }
        case SND_FORMAT_PCM:
        default:
            total += xinfo.size;
            break;
        }

        e->mem = (void*)off;
    }

    void* mem = RwMalloc(total);
    si->snd_mem = mem;

    for (XboxSndEntry* e = entries; e != entries_end; e++)
    {
        iFileSeek(&si->file, (U32)e->mem, IFILE_SEEK_SET);
        e->mem = mem;
        assert((UPTR)e->mem == ALIGN_NEXT((UPTR)e->mem, 0x2));
        switch (e->wFormatTag)
        {
        case SND_FORMAT_XBOX_ADPCM:
        {
            void* src_buf = RwMalloc(e->Datasize);
            iFileRead(&si->file, src_buf, e->Datasize);

            U32 decoded_size = 0;
            if (!Xbox_ADPCM_Decode(e, src_buf, (Sint16*)e->mem, &decoded_size) || decoded_size == 0)
            {
                SDL_Log("Failed to decode Xbox ADPCM data for sound asset 0x%08x", e->assetID);
            }
            RwFree(src_buf);
            e->Datasize = decoded_size;
            mem = (void*)((U32)mem + decoded_size);
            break;
        }
        case SND_FORMAT_PCM:
        default:
            iFileRead(&si->file, e->mem, e->Datasize);
            mem = (void*)((U32)mem + e->Datasize);
            break;
        }
    }

    return 1;
}

void iSndSetExternalCallback(iSndExternalCallback callback)
{
    // Not implemented on GC or PC
}

F32 iSndGetVol(U32 snd)
{
    S32 i = iSndIdToIdx(snd);
    if (i < 0)
    {
        return 0.0f;
    }
    xSndVoiceInfo* vp = &gSnd.voice[i];

    if (vp->flags & XSND_VOICE_ACTIVE)
    {
        if (gSnd.categoryVolFader[vp->category] <= 0.0f)
        {
            return 0.0f;
        }
        return (vp->vol / gSnd.categoryVolFader[vp->category]);
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
