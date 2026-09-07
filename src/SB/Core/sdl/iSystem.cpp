#include "iSystem.h"


#include <rwcore.h>


#include "xDebug.h"
#include "xPad.h"
#include "xSnd.h"

#include "iFile.h"
#include "iSystem.h"

void iVSync()
{
}

void iSystemInit(U32 options)
{
    xDebugInit();
    xMemInit();
    iFileInit();
    iTimeInit();
    xPadInit();
    xSndInit();
    // RenderWareInit();
    xMathInit();
    xMath3Init();
}

void iSystemExit()
{
    xDebugExit();
    xMathExit();
    // RenderWareExit();
    xSndExit();
    xPadKill();
    iFileExit();
    iTimeExit();
    xMemExit();
}
