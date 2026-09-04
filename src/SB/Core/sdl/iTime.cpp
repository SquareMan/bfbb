#include "iTime.h"
#include "iSystem.h"

#include <cassert>
#include <types.h>

static iTime sStartupTime;
static F32 sGameTime;

void iTimeInit()
{
    assert(false && "TODO");
}

void iTimeExit()
{
}

iTime iTimeGet()
{
    assert(false && "TODO");
}

F32 iTimeDiffSec(iTime time)
{
    assert(false && "TODO");
}

F32 iTimeDiffSec(iTime t0, iTime t1)
{
    return iTimeDiffSec(t1 - t0);
}

void iTimeGameAdvance(F32 elapsed)
{
    sGameTime += elapsed;
}

void iTimeSetGame(F32 time)
{
    sGameTime = time;
}

void iProfileClear(U32 sceneID)
{
}

void iFuncProfileDump()
{
}

void iFuncProfileParse(const char* elfPath, S32 profile)
{
}
