#ifndef ISND_H
#define ISND_H

#include <types.h>

#include "xFile.h"

struct xSndVoiceInfo;
struct tag_xFile;
struct _AXVPB;

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

struct sDSPADPCM
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

// iSndLookup() on GameCube hands back a pointer to iSnd.cpp's file-scope
// `snd` object: a 0x64-byte DSP-ADPCM header followed by the internal sound
// id. src/SB/Core/gc/iSnd.h still describes iSndFileInfo with the PS2 layout
// (sample_rate is a U16 at 0x8 there, and there is nothing at 0x64), so the
// two fields this function needs are reached through the real layout instead.
struct iSndFileInfo
{
    sDSPADPCM hdr; // 0x000
    U32 id; // 0x064
    tag_xFile file; // 0x068
    U32 pad; // 0x17c
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
void iSndDIEDIEDIE();
void iSndSetExternalCallback(iSndExternalCallback callback);

void iSndSuspend();
void iSndResume();

F32 iSndGetVol(U32 snd);

#endif
