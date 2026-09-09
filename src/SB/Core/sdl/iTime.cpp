#include "iTime.h"
#include "iSystem.h"

#include <cassert>
#include <types.h>

#include <immintrin.h>
#include <SDL3/SDL_time.h>
#include <SDL3/SDL_timer.h>

static iTime sStartupTime = 0;
static F32 sGameTime = 0;

void iTimeInit()
{
    SDL_GetCurrentTime(&sStartupTime);
}

void iTimeExit()
{
}

iTime iTimeGet()
{
    SDL_Time time;
    SDL_GetCurrentTime(&time);
    return time - sStartupTime;
}

F32 iTimeDiffSec(iTime time)
{
    return F32(time) / SDL_NS_PER_SECOND;
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

S32 iGetMinute()
{
    SDL_Time timeSinceEpoch;
    SDL_GetCurrentTime(&timeSinceEpoch);
    SDL_DateTime date;
    SDL_TimeToDateTime(timeSinceEpoch, &date, true);
    return date.minute;
}
S32 iGetHour()
{
    SDL_Time timeSinceEpoch;
    SDL_GetCurrentTime(&timeSinceEpoch);
    SDL_DateTime date;
    SDL_TimeToDateTime(timeSinceEpoch, &date, true);
    return date.hour;
}
S32 iGetDay()
{
    SDL_Time timeSinceEpoch;
    SDL_GetCurrentTime(&timeSinceEpoch);
    SDL_DateTime date;
    SDL_TimeToDateTime(timeSinceEpoch, &date, true);
    return date.day;
}
S32 iGetMonth()
{
    SDL_Time timeSinceEpoch;
    SDL_GetCurrentTime(&timeSinceEpoch);
    SDL_DateTime date;
    SDL_TimeToDateTime(timeSinceEpoch, &date, true);
    return date.month;
}
