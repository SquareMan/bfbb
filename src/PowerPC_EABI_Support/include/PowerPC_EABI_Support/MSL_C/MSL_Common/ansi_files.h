#ifndef _MSL_COMMON_ANSI_FILES_H
#define _MSL_COMMON_ANSI_FILES_H

#include "stdint.h"
#include "stddef.h"

typedef unsigned long __file_handle;
typedef unsigned long fpos_t;
typedef struct _IO_FILE _IO_FILE, *P_IO_FILE;

#define __ungetc_buffer_size 2

enum __file_kinds { __closed_file, __disk_file, __console_file, __unavailable_file };

enum __file_orientation { __unoriented, __char_oriented, __wide_oriented };

typedef struct __file_modes {
	uint32_t open_mode : 2;
	uint32_t io_mode : 3;
	uint32_t buffer_mode : 2;
	uint32_t file_kind : 3;

#ifdef _MSL_WIDE_CHAR
	uint32_t file_orientation : 2;
#endif /* _MSL_WIDE_CHAR */

	uint32_t binary_io : 1;
} file_modes;

enum __io_states { __neutral, __writing, __reading, __rereading };

typedef struct __file_states {
	uint32_t io_state : 3;
	uint32_t free_buffer : 1;

	uint8_t eof;
	uint8_t error;
} file_states;

typedef void* __ref_con;
typedef void (*__idle_proc)(void);
typedef int (*__pos_proc)(__file_handle file, fpos_t* position, int mode, __ref_con ref_con);
typedef int (*__io_proc)(__file_handle file, char* buff, size_t* count, __ref_con ref_con);
typedef int (*__close_proc)(__file_handle file);

struct _IO_FILE {
	__file_handle mHandle;                           // _00
	file_modes mMode;                                // _04
	file_states mState;                              // _08
	uint8_t mIsDynamicallyAllocated;                 // _0C
	uint8_t mCharBuffer;                             // _0D
	uint8_t mCharBufferOverflow;                     // _0E
	uint8_t mUngetcBuffer[__ungetc_buffer_size];     // _0F
	wchar_t mUngetcWideBuffer[__ungetc_buffer_size]; // _12
	uint32_t mPosition;                              // _18
	char* mBuffer;                                   // _1C
	uint32_t mBufferSize;                            // _20
	char* mBufferPtr;                                // _24
	uint32_t mBufferLength;                          // _28
	uint32_t mBufferAlignment;                       // _2C
	uint32_t mBufferLength2;                         // _30
	uint32_t mBufferPosition;                        // _34
	__pos_proc positionFunc;                         // _38
	__io_proc readFunc;                              // _3C
	__io_proc writeFunc;                             // _40
	__close_proc closeFunc;                          // _44
	__ref_con ref_con;                               // _48
	_IO_FILE* mNextFile;                             // _4C
};

typedef struct _IO_FILE FILE;

extern FILE __files[4];

#ifdef __cplusplus
extern "C" {
#endif // ifdef __cplusplus

void __convert_from_newlines(char *buffer, size_t *length);

int fflush(FILE* __stream);
void free(void*);
int __flush_buffer(FILE* file, size_t* length);
void __prep_buffer(FILE* file);
uint32_t __flush_all();

#ifdef __cplusplus
};
#endif // ifdef __cplusplus

#endif
