/*
  Simple DirectMedia Layer
  Copyright (C) 1997-2026 Sam Lantinga <slouken@libsdl.org>

  This software is provided 'as-is', without any express or implied
  warranty.  In no event will the authors be held liable for any damages
  arising from the use of this software.

  Permission is granted to anyone to use this software for any purpose,
  including commercial applications, and to alter it and redistribute it
  freely, subject to the following restrictions:

  1. The origin of this software must not be misrepresented; you must not
     claim that you wrote the original software. If you use this software
     in a product, an acknowledgment in the product documentation would be
     appreciated but is not required.
  2. Altered source versions must be plainly marked as such, and must not be
     misrepresented as being the original software.
  3. This notice may not be removed or altered from any source distribution.
*/

/*
    The following is a lightly modified version of the IMA ADPCM decoder from SDL3.
    It has been edited to account for Xbox ADPCM differences, to allow decoding
    raw data that has been stripped of it's WAV container, and to source it's format
    information from a BfBB SNDI entry.

    The main difference to IMA ADPCM mentioned above is how we treat the predictor at
    the beginning of each block: We use it when decoding the following sample nibble, but
    it is not treated as an output sample. As such, we have one fewer sample per block.
*/

#include "iADPCM.h"

#include <immintrin.h>
#include <SDL3/SDL_audio.h>

typedef struct ADPCM_DecoderState
{
    Uint32 channels; // Number of channels.
    size_t blocksize; // Size of an ADPCM block in bytes.
    size_t blockheadersize; // Size of an ADPCM block header in bytes.
    size_t samplesperblock; // Number of samples per channel in an ADPCM block.
    size_t framesize; // Size of a sample frame (16-bit PCM) in bytes.
    Sint64 framestotal; // Total number of sample frames.
    Sint64 framesleft; // Number of sample frames still to be decoded.
    void* ddata; // Decoder data from initialization.
    void* cstate; // Decoding state for each channel.

    // ADPCM data.
    struct
    {
        Uint8* data;
        size_t size;
        size_t pos;
    } input;

    // Current ADPCM block in the ADPCM data above.
    struct
    {
        Uint8* data;
        size_t size;
        size_t pos;
        Sint16 pred;
    } block;

    // Decoded 16-bit PCM data.
    struct
    {
        Sint16* data;
        size_t size;
        size_t pos;
    } output;
} ADPCM_DecoderState;

/* Reads the value stored at the location of the f1 pointer, multiplies it
 * with the second argument and then stores the result to f1.
 * Returns 0 on success, or -1 if the multiplication overflows, in which case f1
 * does not get modified.
 */
static int SafeMult(size_t* f1, size_t f2)
{
    if (*f1 > 0 && SIZE_MAX / *f1 <= f2)
    {
        return -1;
    }
    *f1 *= f2;
    return 0;
}

// Identical to IMA_ADPCM
static Sint16 Xbox_ADPCM_ProcessNibble(Sint8* cindex, Sint16 lastsample, Uint8 nybble)
{
    const Sint32 max_audioval = 32767;
    const Sint32 min_audioval = -32768;
    const Sint8 index_table_4b[16] = { -1, -1, -1, -1, 2, 4, 6, 8, -1, -1, -1, -1, 2, 4, 6, 8 };
    const Uint16 step_table[89] = {
        7,     8,     9,     10,    11,    12,    13,    14,    16,    17,    19,   21,    23,
        25,    28,    31,    34,    37,    41,    45,    50,    55,    60,    66,   73,    80,
        88,    97,    107,   118,   130,   143,   157,   173,   190,   209,   230,  253,   279,
        307,   337,   371,   408,   449,   494,   544,   598,   658,   724,   796,  876,   963,
        1060,  1166,  1282,  1411,  1552,  1707,  1878,  2066,  2272,  2499,  2749, 3024,  3327,
        3660,  4026,  4428,  4871,  5358,  5894,  6484,  7132,  7845,  8630,  9493, 10442, 11487,
        12635, 13899, 15289, 16818, 18500, 20350, 22385, 24623, 27086, 29794, 32767
    };
    Uint32 step;
    Sint32 sample, delta;
    Sint8 index = *cindex;

    // Clamp index into valid range.
    if (index > 88)
    {
        index = 88;
    }
    else if (index < 0)
    {
        index = 0;
    }

    // explicit cast to avoid gcc warning about using 'char' as array index
    step = step_table[(size_t)index];

    // Update index value
    *cindex = index + index_table_4b[nybble];

    /* This calculation uses shifts and additions because multiplications were
     * much slower back then. Sadly, this can't just be replaced with an actual
     * multiplication now as the old algorithm drops some bits. The closest
     * approximation I could find is something like this:
     * (nybble & 0x8 ? -1 : 1) * ((nybble & 0x7) * step / 4 + step / 8)
     */
    delta = step >> 3;
    if (nybble & 0x04)
    {
        delta += step;
    }
    if (nybble & 0x02)
    {
        delta += step >> 1;
    }
    if (nybble & 0x01)
    {
        delta += step >> 2;
    }
    if (nybble & 0x08)
    {
        delta = -delta;
    }

    sample = lastsample + delta;

    // Clamp output sample
    if (sample > max_audioval)
    {
        sample = max_audioval;
    }
    else if (sample < min_audioval)
    {
        sample = min_audioval;
    }

    return (Sint16)sample;
}

static bool Xbox_ADPCM_DecodeBlockHeader(ADPCM_DecoderState* state)
{
    Sint16 step;
    Uint32 c;
    Uint8* cstate = (Uint8*)state->cstate;

    for (c = 0; c < state->channels; c++)
    {
        size_t o = state->block.pos + c * 4;

        // Extract the sample from the header.
        Sint32 sample = state->block.data[o] | ((Sint32)state->block.data[o + 1] << 8);
        if (sample >= 0x8000)
        {
            sample -= 0x10000;
        }
        // Difference to IMA ADPCM: The predictor is written as a sample
        state->block.pred = (Sint16)sample;

        // Channel step index.
        step = (Sint16)state->block.data[o + 2];
        cstate[c] = (Sint8)(step > 0x80 ? step - 0x100 : step);

        // Reserved byte in block header, should be 0.
        if (state->block.data[o + 3] != 0)
        {
            /* Uh oh, corrupt data?  Buggy code? */;
        }
    }

    state->block.pos += state->blockheadersize;

    return true;
}

/* Decodes the data of the IMA ADPCM block. Decoding will stop if a block is too
 * short, returning with none or partially decoded data. The partial data always
 * contains full sample frames (same sample count for each channel).
 * Incomplete sample frames are discarded.
 */
static bool Xbox_ADPCM_DecodeBlockData(ADPCM_DecoderState* state)
{
    size_t i;
    const Uint32 channels = state->channels;
    const size_t subblockframesize = (size_t)channels * 4;
    Uint64 bytesrequired;
    Uint32 c;
    bool result = true;

    size_t blockpos = state->block.pos;
    size_t blocksize = state->block.size;
    size_t blockleft = blocksize - blockpos;

    size_t outpos = state->output.pos;

    // Difference to IMA ADPCM: No need to account for the predictor here
    Sint64 blockframesleft = state->samplesperblock;
    if (blockframesleft > state->framesleft)
    {
        blockframesleft = state->framesleft;
    }

    bytesrequired = (blockframesleft + 7) / 8 * subblockframesize;
    if (blockleft < bytesrequired)
    {
        // Data truncated. Calculate how many samples we can get out if it.
        const size_t guaranteedframes = blockleft / subblockframesize;
        const size_t remainingbytes = blockleft % subblockframesize;
        blockframesleft = guaranteedframes;
        if (remainingbytes > subblockframesize - 4)
        {
            blockframesleft += (Sint64)(remainingbytes % 4) * 2;
        }
        // Signal the truncation.
        result = false;
    }

    /* Each channel has their nibbles packed into 32-bit blocks. These blocks
     * are interleaved and make up the data part of the ADPCM block. This loop
     * decodes the samples as they come from the input data and puts them at
     * the appropriate places in the output data.
     */

    // Keep previous sample which may come from the block header.
    // Difference to IMA ADPCM: The predictor is not written to the output but always used
    // by the first sample nibble of each block
    Sint16 prev_sample = state->block.pred;
    while (blockframesleft > 0)
    {
        const size_t subblocksamples = blockframesleft < 8 ? (size_t)blockframesleft : 8;

        for (c = 0; c < channels; c++)
        {
            Uint8 nybble = 0;

            for (i = 0; i < subblocksamples; i++)
            {
                if (i & 1)
                {
                    nybble >>= 4;
                }
                else
                {
                    nybble = state->block.data[blockpos++];
                }

                Sint16 sample =
                    Xbox_ADPCM_ProcessNibble((Sint8*)state->cstate + c, prev_sample, nybble & 0x0f);
                state->output.data[outpos + c + i * channels] = sample;
                prev_sample = sample;
            }
        }

        outpos += channels * subblocksamples;
        state->framesleft -= subblocksamples;
        blockframesleft -= subblocksamples;
    }

    state->block.pos = blockpos;
    state->output.pos = outpos;

    return result;
}

bool Xbox_ADPCM_Decode(XboxSndEntry* file, Uint8** audio_buf, Uint32* audio_len)
{
    bool result;
    size_t bytesleft, outputsize;
    ADPCM_DecoderState state;
    Sint8* cstate;

    // Nothing to decode, nothing to return.
    if (file->Datasize == 0)
    {
        *audio_buf = NULL;
        *audio_len = 0;
        return true;
    }

    SDL_zero(state);
    state.channels = file->nChannels;
    state.blocksize = file->nBlockAlign;
    state.blockheadersize = (size_t)state.channels * 4;

    const size_t blockdatasize = (size_t)state.blocksize - state.blockheadersize;
    const size_t blockframebitsize = (size_t)file->wBitsPerSample * state.channels;
    // Difference to IMA ADPCM: Predictors are not treated as samples
    state.samplesperblock = file->NibblesPerBlock;

    state.framesize = state.channels * sizeof(Sint16);
    state.framestotal = state.samplesperblock * (file->Datasize / state.blocksize);
    state.framesleft = state.framestotal;

    state.input.data = (Uint8*)file->mem;
    state.input.size = file->Datasize;
    state.input.pos = 0;

    // The output size in bytes. May get modified if data is truncated.
    outputsize = (size_t)state.framestotal;
    if (SafeMult(&outputsize, state.framesize))
    {
        return SDL_SetError("WAVE file too big");
    }
    else if (outputsize > SDL_MAX_UINT32 || state.framestotal > SIZE_MAX)
    {
        return SDL_SetError("WAVE file too big");
    }

    state.output.pos = 0;
    state.output.size = outputsize / sizeof(Sint16);
    state.output.data = (Sint16*)SDL_malloc(outputsize);
    if (!state.output.data)
    {
        return false;
    }

    cstate = (Sint8*)SDL_calloc(state.channels, sizeof(Sint8));
    if (!cstate)
    {
        SDL_free(state.output.data);
        return false;
    }
    state.cstate = cstate;

    // Decode block by block. A truncated block will stop the decoding.
    bytesleft = state.input.size - state.input.pos;
    while (state.framesleft > 0 && bytesleft >= state.blockheadersize)
    {
        state.block.data = state.input.data + state.input.pos;
        state.block.size = bytesleft < state.blocksize ? bytesleft : state.blocksize;
        state.block.pos = 0;
        state.block.pred = 0;

        if (state.output.size - state.output.pos < (Uint64)state.framesleft * state.channels)
        {
            // Somehow didn't allocate enough space for the output.
            SDL_free(state.output.data);
            SDL_free(cstate);
            return SDL_SetError("Unexpected overflow in IMA ADPCM decoder");
        }

        // Initialize decoder with the values from the block header.
        result = Xbox_ADPCM_DecodeBlockHeader(&state);
        if (result)
        {
            // Decode the block data. It stores the samples directly in the output.
            result = Xbox_ADPCM_DecodeBlockData(&state);
        }

        if (!result)
        {
            outputsize = state.output.pos * sizeof(Sint16); // Can't overflow, is always smaller.
            break;
        }

        state.input.pos += state.block.size;
        bytesleft = state.input.size - state.input.pos;
    }

    *audio_buf = (Uint8*)state.output.data;
    *audio_len = (Uint32)outputsize;

    SDL_free(cstate);

    return true;
}
