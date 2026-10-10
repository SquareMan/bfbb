#ifndef IADPCM_H
#define IADPCM_H

#include "iSnd.h"

bool IMA_ADPCM_Decode(XboxSndEntry* file, U8** audio_buf, U32* audio_len);

#endif
