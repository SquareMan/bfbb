#ifndef __FASTMATH_H__
#define __FASTMATH_H__

#include <types.h>

#define RET_REG fp1
#define V1_XY fp2
#define V1_Z fp3
#define V2_XY fp4
#define V2_Z fp5
#define D1_XY fp6
#define D1_Z fp7
#define D2_XY fp8
#define D2_Z fp9
#define W1_XY fp10
#define W1_Z fp11
#define W2_XY fp12
#define W2_Z fp13

// All this essentially does is do "*dst = *src;"
#define PSVECCopy(dst, src)

// I can't figure out how to get this as a C-style inline function, so use this in an ASM function or block.
#define PSVECDotProduct(vec1, vec2)
#endif
