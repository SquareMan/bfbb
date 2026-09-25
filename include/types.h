#ifndef BFBB_TYPES_H
#define BFBB_TYPES_H

#include "macros.h"

// Note: only include this header inside BFBB-related headers/source code files.
// Don't include this in any RenderWare, system, bink, etc. files

typedef signed char S8;
typedef signed short S16;
typedef signed int S32;
typedef signed long long S64;

typedef unsigned char U8;
typedef unsigned short U16;
typedef unsigned int U32;
typedef unsigned long long U64;

typedef float F32;
typedef double F64;

// Use this wrapper type for function arguments that should accept string literals
//
// The gamecube version compiles with string literals as non-const `char*`
// This is evidenced by most function signatures accepting `char*` instead of `const char*`.
//
// This creates a problem for working with modern platforms where we want string literals to be const
// - const string literals can't be passed to functions accepting just char*
// - changing the argument type to be const changes the symbol mangling which affects the gamecube build
#ifdef GAMECUBE
typedef char CChar;
#else
typedef const char CChar;
#endif


#ifdef NULL
#undef NULL
#endif
#define NULL 0

#ifdef TRUE
#undef TRUE
#endif
#define TRUE 1

#ifdef FALSE
#undef FALSE
#endif
#define FALSE 0

// Stub __declspec out for compilers that cannot parse it. CodeWarrior is the
// one compiler where it is meaningful -- it carries `weak` and the `section`
// placements for .init/.ctors/.dtors -- so it must NOT be stubbed there.
#ifndef __MWERKS__
#define __declspec(x)
// #define asm
#endif

#define WEAK __declspec(weak)

#ifndef __cplusplus
typedef unsigned short wchar_t;
typedef wchar_t wint_t;
#endif

// stupid hack
#include "../src/dolphin/include/dolphin/types.h"

// Basic defines to allow newer-like C++ code to be written
#define TRUE 1
#define FALSE 0

#ifndef NULL
#define NULL 0
#endif

#define UINT32_MAX 0xffffffff

#endif // !TYPES_H
