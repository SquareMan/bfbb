#ifndef ISND_H
#define ISND_H

#include <types.h>

struct xSndVoiceInfo;

#define ISND_TOTAL_VOICES 64

struct iSndVol
{
    S16 volL;
    S16 volR;
};

struct iSndInfo
{
    U32 flags;
    iSndVol vol;
    U32 pitch;
    S32 lastStreamBuffer;
};

enum XboxSndFormat
{
    // Raw 16-bit samples
    XBOX_SND_FORMAT_PCM = 1,
    // Xbox specific ADPCM spec. Data frames are identical to IMA ADPCM
    XBOX_SND_FORMAT_XBOX_ADPCM = 0x69,
};

// Size: 0x2C
struct XboxSndEntry
{
    U16 wFormatTag;
    U16 nChannels;
    U32 sample_rate;
    U32 nAvgBytesPerSec;
    U16 nBlockAlign;
    U16 wBitsPerSample;
    U16 cbSize;
    U16 NibblesPerBlock;
    U32 Datasize;
    U32 assetID;
    U32 flags;
    U8 pad[8];
    void* mem;
};

struct iSndFileInfo
{
    XboxSndEntry hdr;
    U32 id;
};

// not in dwarf data,
enum isound_effect
{
    iSND_EFFECT_NONE,
    iSND_EFFECT_CAVE
};

typedef void (*iSndExternalCallback)(U32);

void iSndInit();
void iSndExit();

void iSndSetEnvironmentalEffect(isound_effect);
void iSndInitSceneLoaded();

bool iSndIsPlaying(U32 assetID);
bool iSndIsPlaying(U32 assetID, U32 parid);
bool iSndIsPlayingByHandle(U32 handle);
iSndFileInfo* iSndLookup(U32 id);

void iSndPause(U32 snd, U32 pause);
void iSndStop(U32 snd);
void iSndUpdate();

S32 iSndFindFreeVoice(U32 priority, U32 flags, U32 owner);

S32 iSndPlay(xSndVoiceInfo* vp);
void iSndSetVol(U32 snd, F32 vol);
void iSndSetPitch(U32 snd, F32 pitch);
void iSndStartStereo(U32 id1, U32 id2, F32 pitch);
void iSndStereo(U32 stereo);

void iSndWaitForDeadSounds();
void iSndSuspendCD(U32);

void iSndSceneExit();

S32 iSndLoadSounds(void*);
void iSndSetExternalCallback(iSndExternalCallback callback);

F32 iSndGetVol(U32 snd);

#endif
