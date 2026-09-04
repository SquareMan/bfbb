#ifndef ITIME_H
#define ITIME_H

#include <types.h>

#define JANUARY 1
#define FEBRUARY 2
#define MARCH 3
#define APRIL 4
#define MAY 5
#define JUNE 6
#define JULY 7
#define AUGUST 8
#define SEPTEMBER 9
#define OCTOBER 10
#define NOVEMBER 11
#define DECEMBER 12

typedef S64 iTime;

// FIXME: Make this use SDL_Time
typedef S64 iTime;
#define ITIME_FROM_SECS(s) ((s) * (1'000'000'000))

S32 iGetMinute();
S32 iGetHour();
S32 iGetDay();
S32 iGetMonth();
U32 iGetCurrFormattedDate(char* input);
U32 iGetCurrFormattedTime(char* input);
void iTimeInit();
void iTimeExit();
iTime iTimeGet();
F32 iTimeDiffSec(iTime t0, iTime t1);
F32 iTimeDiffSec(iTime time);
void iTimeGameAdvance(F32 elapsed);
void iTimeSetGame(F32 time);
void iProfileClear(U32 sceneID);
void iFuncProfileDump();
void iFuncProfileParse(const char* elfPath, S32 profile);

#endif
