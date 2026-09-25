#ifndef IFMV_H
#define IFMV_H

#include <types.h>
#include <cstdlib>

struct iFMV
{
    static void* mXFBs[2];
    static void* mCurrentFrameBuffer;
    static U8 mFirstFrame;

    static void InitDisplay(void*);
    static void Suspend();
    static void Resume();
};

void* iFMVmalloc(size_t size);
void iFMVfree(void* mem);
U32 iFMVPlay(char* filename, U32 buttons, F32 time, bool skippable, bool lockController);

#endif
