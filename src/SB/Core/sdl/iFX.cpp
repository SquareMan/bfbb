#include "iFX.h"

#include <types.h>

#include <rpworld.h>

extern F32 xFXanimUVRotMat0[2];
extern F32 xFXanimUVRotMat1[2];
extern F32 xFXanimUVTrans[2];
extern F32 xFXanimUVScale[2];

static void* _iGCUVRenderCallback(void* object, void* gcPipeData)
{
    return NULL;
}

RxPipeline* iFXanimUVCreatePipe()
{
    RxPipeline* newPipe = RxPipelineCreate();

    // TODO: PC Version

    return newPipe;
}
