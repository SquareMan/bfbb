#include "iSystem.h"

#include <stdio.h>

#include <rwcore.h>

#include "rpmatfx.h"
#include "rpptank.h"
#include "rpskin.h"
#include "rpusrdat.h"

#include "xDebug.h"
#include "xPad.h"
#include "xSnd.h"
#include "xFX.h"
#include "xShadow.h"
#include "xstransvc.h"

#include "iMemMgr.h"
#include "iSystem.h"
#include "iFMV.h"
#include "iTRC.h"

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
