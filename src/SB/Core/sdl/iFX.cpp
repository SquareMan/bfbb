#include "iFX.h"

#include <types.h>

#include <rpworld.h>
#include <rwsdk/driver/gcn/dlrendst.h>

extern F32 xFXanimUVRotMat0[2];
extern F32 xFXanimUVRotMat1[2];
extern F32 xFXanimUVTrans[2];
extern F32 xFXanimUVScale[2];

static void* _iGCUVRenderCallback(void* object, void* gcPipeData)
{}

RxPipeline* iFXanimUVCreatePipe()
{
    RxPipeline* newPipe = RxPipelineCreate();

    if (newPipe != NULL)
    {
        RxLockedPipe* lPipe = RxPipelineLock(newPipe);

        if (lPipe != NULL)
        {
            RxNodeDefinition* gcAll = RxNodeDefinitionGetGameCubeAtomicAllInOne();
            RxPipelineNode* plNode;

            lPipe = RxLockedPipeAddFragment(lPipe, NULL, gcAll, NULL);
            RxLockedPipeUnlock(lPipe);

            plNode = RxPipelineFindNodeByName(newPipe, gcAll->name, NULL, NULL);
            // RxGameCubeAllInOneSetRenderCallBack(plNode, _iGCUVRenderCallback);

            return newPipe;
        }

        _rxPipelineDestroy(newPipe);
        newPipe = NULL;
    }

    return newPipe;
}
