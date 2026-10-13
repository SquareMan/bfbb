#ifndef IADPCM_H
#define IADPCM_H

#include "iSnd.h"

// When `dst_buf` is NULL: returns required buffer length in `dst_len`
// without decoding
bool Xbox_ADPCM_Decode(XboxSndEntry* file, void* src_buf, S16* dst_buf, U32* dst_len);

#endif
