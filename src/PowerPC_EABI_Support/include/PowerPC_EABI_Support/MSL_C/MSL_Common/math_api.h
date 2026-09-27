#ifndef _MSL_MATH_API_H
#define _MSL_MATH_API_H

#include "fdlibm.h"

#ifdef __cplusplus
extern "C" {
#endif // ifdef __cplusplus

int __signbitd(double);

float powf(float __x, float __y);
float sinf(float __x);
float cosf(float __x);
float atanf(float __x);

inline int __fpclassifyf(float x)
{
    switch ((*(s32*)&x) & 0x7f800000)
    {
    case 0x7f800000:
    {
        if ((*(s32*)&x) & 0x007fffff)
            return 1;
        else
            return 2;
        break;
    }
    case 0:
    {
        if ((*(s32*)&x) & 0x007fffff)
            return 5;
        else
            return 3;
        break;
    }
    }
    return 4;
}

inline int __fpclassifyd(double x)
{
    switch (__HI(x) & 0x7ff00000)
    {
    case 0x7ff00000:
    {
        if ((__HI(x) & 0x000fffff) || (__LO(x) & 0xffffffff))
            return 1;
        else
            return 2;
        break;
    }
    case 0:
    {
        if ((__HI(x) & 0x000fffff) || (__LO(x) & 0xffffffff))
            return 5;
        else
            return 3;
        break;
    }
    }
    return 4;
}


#define fpclassify(x)                                                                              \
    ((sizeof(x) == sizeof(float)) ? __fpclassifyf((float)(x)) : __fpclassifyd((double)(x)))

#define isinf(x) ((fpclassify(x) == 2))
#define isnan(x) ((fpclassify(x) == 1))
#define isfinite(x) ((fpclassify(x) > 2))

#ifdef __cplusplus
};
#endif // ifdef __cplusplus

#endif
