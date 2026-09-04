#include "iFMV.h"

#include "iSystem.h"

#include "zGlobals.h"

static S32 frame_num;
U32 fuckingSurfaceType;
S32 ip;
s32 oof;
void* iFMV::mXFBs[2];
void* iFMV::mCurrentFrameBuffer;

// .sdata
static float Width_scale = 1.0f;
static float Height_scale = 1.0f;
U8 iFMV::mFirstFrame = 1;

void* iFMVmalloc(size_t size)
{
    return RwMalloc(size);
}

void iFMVfree(void* mem)
{
    RwFree(mem);
}

static void PlayFMV(char* filename, size_t buttons, F32 time);
U32 iFMVPlay(char* filename, U32 buttons, F32 time, bool skippable, bool lockController)
{
    if (filename == NULL)
    {
        return 1;
    }

    frame_num = 0;
    while (frame_num >= 0)
    {
        PlayFMV(filename, buttons, time);
    }
    return 0;
}

static void PlayFMV(char* fname, size_t buttons, F32 time)
{
    iVSync();
    xPadUpdate(globals.currentActivePad, 0.0f);
}

void iFMV::InitDisplay(void* InRenderMode)
{
}

void iFMV::Suspend()
{
}

void iFMV::Resume()
{
}
