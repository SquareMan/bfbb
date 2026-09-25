#ifndef __BINKH__
#define __BINKH__

#include <stddef.h>
#include <stdint.h>

#define BINKMAJORVERSION 1
#define BINKMINORVERSION 5
#define BINKSUBVERSION 21
#define BINKVERSION "1.5y"
#define BINKDATE "2003-09-23"

#ifndef __RADRES__

#ifndef __RADBASEH__
#include "radbase.h"
#endif

RADDEFSTART

typedef struct BINK PTR4* HBINK;

struct BINKIO;
typedef int32_t(RADLINK PTR4* BINKIOOPEN)(struct BINKIO PTR4* Bnkio, const char PTR4* name, uint32_t flags);
typedef uint32_t(RADLINK PTR4* BINKIOREADHEADER)(struct BINKIO PTR4* Bnkio, int32_t Offset, void PTR4* Dest,
                                            uint32_t Size);
typedef uint32_t(RADLINK PTR4* BINKIOREADFRAME)(struct BINKIO PTR4* Bnkio, uint32_t Framenum, int32_t origofs,
                                           void PTR4* dest, uint32_t size);
typedef uint32_t(RADLINK PTR4* BINKIOGETBUFFERSIZE)(struct BINKIO PTR4* Bnkio, uint32_t Size);
typedef void(RADLINK PTR4* BINKIOSETINFO)(struct BINKIO PTR4* Bnkio, void PTR4* Buf, uint32_t Size,
                                          uint32_t FileSize, uint32_t simulate);
typedef uint32_t(RADLINK PTR4* BINKIOIDLE)(struct BINKIO PTR4* Bnkio);
typedef void(RADLINK PTR4* BINKIOCLOSE)(struct BINKIO PTR4* Bnkio);

typedef void(RADLINK PTR4* BINKCBSUSPEND)(struct BINKIO PTR4* Bnkio);
typedef int32_t(RADLINK PTR4* BINKCBTRYSUSPEND)(struct BINKIO PTR4* Bnkio);
typedef void(RADLINK PTR4* BINKCBRESUME)(struct BINKIO PTR4* Bnkio);
typedef void(RADLINK PTR4* BINKCBIDLE)(struct BINKIO PTR4* Bnkio);

// Unsorted
// Pulled from previous bink.h to maintain the build
extern void RADSetAudioMemory(void* (*malloc)(size_t), void (*free)(void*));
extern void RADSetMemory(void* (*malloc)(size_t), void (*free)(void*));
//

typedef struct BINKIO
{
    BINKIOREADHEADER ReadHeader;
    BINKIOREADFRAME ReadFrame;
    BINKIOGETBUFFERSIZE GetBufferSize;
    BINKIOSETINFO SetInfo;
    BINKIOIDLE Idle;
    BINKIOCLOSE Close;
    HBINK bink;
    volatile uint32_t ReadError;
    volatile uint32_t DoingARead;
    volatile uint32_t BytesRead;
    volatile uint32_t Working;
    volatile uint32_t TotalTime;
    volatile uint32_t ForegroundTime;
    volatile uint32_t IdleTime;
    volatile uint32_t ThreadTime;
    volatile uint32_t BufSize;
    volatile uint32_t BufHighUsed;
    volatile uint32_t CurBufSize;
    volatile uint32_t CurBufUsed;
    volatile uint8_t iodata[128 + 32];

    // filled in by the caller
    BINKCBSUSPEND suspend_callback;
    BINKCBTRYSUSPEND try_suspend_callback;
    BINKCBRESUME resume_callback;
    BINKCBIDLE idle_on_callback;
    volatile uint32_t callback_control[16]; // buffer for background IO callback
} BINKIO;

struct BINKSND;
typedef int32_t(RADLINK PTR4* BINKSNDOPEN)(struct BINKSND PTR4* BnkSnd, uint32_t freq, int32_t bits, int32_t chans,
                                       uint32_t flags, HBINK bink);
typedef int32_t(RADLINK PTR4* BINKSNDREADY)(struct BINKSND PTR4* BnkSnd);
typedef int32_t(RADLINK PTR4* BINKSNDLOCK)(struct BINKSND PTR4* BnkSnd, uint8_t PTR4* PTR4* addr,
                                       uint32_t PTR4* len);
typedef int32_t(RADLINK PTR4* BINKSNDUNLOCK)(struct BINKSND PTR4* BnkSnd, uint32_t filled);
typedef void(RADLINK PTR4* BINKSNDVOLUME)(struct BINKSND PTR4* BnkSnd, int32_t volume);
typedef void(RADLINK PTR4* BINKSNDPAN)(struct BINKSND PTR4* BnkSnd, int32_t pan);
typedef void(RADLINK PTR4* BINKSNDMIXBINS)(struct BINKSND PTR4* BnkSnd, uint32_t PTR4* mix_bins,
                                           uint32_t total);
typedef void(RADLINK PTR4* BINKSNDMIXBINVOLS)(struct BINKSND PTR4* BnkSnd, uint32_t PTR4* vol_mix_bins,
                                              int32_t PTR4* volumes, uint32_t total);
typedef int32_t(RADLINK PTR4* BINKSNDONOFF)(struct BINKSND PTR4* BnkSnd, int32_t status);
typedef int32_t(RADLINK PTR4* BINKSNDPAUSE)(struct BINKSND PTR4* BnkSnd, int32_t status);
typedef void(RADLINK PTR4* BINKSNDCLOSE)(struct BINKSND PTR4* BnkSnd);

typedef BINKSNDOPEN(RADLINK PTR4* BINKSNDSYSOPEN)(uint32_t param);

typedef struct BINKSND
{
    BINKSNDREADY Ready;
    BINKSNDLOCK Lock;
    BINKSNDUNLOCK Unlock;
    BINKSNDVOLUME Volume;
    BINKSNDPAN Pan;
    BINKSNDPAUSE Pause;
    BINKSNDONOFF SetOnOff;
    BINKSNDCLOSE Close;
    BINKSNDMIXBINS MixBins;
    BINKSNDMIXBINVOLS MixBinVols;

    uint32_t sndbufsize; // sound buffer size
    uint8_t PTR4* sndbuf; // sound buffer
    uint8_t PTR4* sndend; // end of the sound buffer
    uint8_t PTR4* sndwritepos; // current write position
    uint8_t PTR4* sndreadpos; // current read position
    uint32_t sndcomp; // sound compression handle
    uint32_t sndamt; // amount of sound currently in the buffer
    uint32_t sndconvert8; // convert back to 8-bit sound at runtime
    uint32_t sndendframe; // frame number that the sound ends on
    uint32_t sndprime; // amount of data to prime the playahead
    uint32_t sndpad; // padded this much audio

    uint32_t BestSizeIn16;
    uint32_t BestSizeMask;
    uint32_t SoundDroppedOut;
    int32_t NoThreadService;
    int32_t OnOff;
    uint32_t Latency;
    uint32_t VideoScale;
    uint32_t freq;
    int32_t bits, chans;
    uint8_t snddata[256];
} BINKSND;

typedef struct BINKRECT
{
    int32_t Left, Top, Width, Height;
} BINKRECT;

#define BINKMAXDIRTYRECTS 8

typedef struct BUNDLEPOINTERS
{
    void* typeptr;
    void* type16ptr;
    void* colorptr;
    void* bits2ptr;
    void* motionXptr;
    void* motionYptr;
    void* dctptr;
    void* mdctptr;
    void* patptr;
} BUNDLEPOINTERS;

typedef struct BINK
{
    uint32_t Width; // Width (1 based, 640 for example)
    uint32_t Height; // Height (1 based, 480 for example)
    uint32_t Frames; // Number of frames (1 based, 100 = 100 frames)
    uint32_t FrameNum; // Frame to *be* displayed (1 based)
    uint32_t LastFrameNum; // Last frame decompressed or skipped (1 based)

    uint32_t FrameRate; // Frame Rate Numerator
    uint32_t FrameRateDiv; // Frame Rate Divisor (frame rate=numerator/divisor)

    uint32_t ReadError; // Non-zero if a read error has ocurred
    uint32_t OpenFlags; // flags used on open
    uint32_t BinkType; // Bink flags

    uint32_t Size; // size of file
    uint32_t FrameSize; // The current frame's size in bytes
    uint32_t SndSize; // The current frame sound tracks' size in bytes

    BINKRECT FrameRects[BINKMAXDIRTYRECTS]; // Dirty rects from BinkGetRects
    int32_t NumRects;

    uint32_t PlaneNum; // which set of planes is current
    void PTR4* YPlane[2]; // pointer to the uncompressed Y (Cr and Cr follow)
    void PTR4* APlane[2]; // decompressed alpha plane (if present)
    uint32_t YWidth; // widths and heights of the video planes
    uint32_t YHeight;
    uint32_t UVWidth;
    uint32_t UVHeight;

    void PTR4* MaskPlane; // pointer to the mask plane (Ywidth/16*Yheight/16)
    uint32_t MaskPitch; // Mask Pitch
    uint32_t MaskLength; // total length of the mask plane

    uint32_t LargestFrameSize; // Largest frame size
    uint32_t InternalFrames; // how many frames were potentially compressed

    int32_t NumTracks; // how many tracks

    uint32_t Highest1SecRate; // Highest 1 sec data rate
    uint32_t Highest1SecFrame; // Highest 1 sec data rate starting frame

    int32_t Paused; // is the bink movie paused?

    uint32_t BackgroundThread; // handle to background thread

    // everything below is for internal Bink use

    void PTR4* compframe; // compressed frame data
    void PTR4* preloadptr; // preloaded compressed frame data
    uint32_t* frameoffsets; // offsets of each of the frames

    BINKIO bio; // IO structure
    int8_t PTR4* ioptr; // io buffer ptr
    uint32_t iosize; // io buffer size
    uint32_t decompwidth; // width not include scaling
    uint32_t decompheight; // height not include scaling

    int32_t PTR4* trackindexes; // track indexes
    uint32_t PTR4* tracksizes; // largest single frame of track
    uint32_t PTR4* tracktypes; // type of each sound track
    int32_t PTR4* trackIDs; // external track numbers

    uint32_t numrects; // number of rects from BinkGetRects

    uint32_t playedframes; // how many frames have we played
    uint32_t firstframetime; // very first frame start
    uint32_t startframetime; // start frame start
    uint32_t startblittime; // start of blit period
    uint32_t startsynctime; // start of synched time
    uint32_t startsyncframe; // frame of startsynctime
    uint32_t twoframestime; // two frames worth of time
    uint32_t entireframetime; // entire frame time

    uint32_t slowestframetime; // slowest frame in ms
    uint32_t slowestframe; // slowest frame number
    uint32_t slowest2frametime; // second slowest frame in ms
    uint32_t slowest2frame; // second slowest frame

    uint32_t soundon; // sound turned on?
    uint32_t videoon; // video turned on?

    uint32_t totalmem; // total memory used
    uint32_t timevdecomp; // total time decompressing video
    uint32_t timeadecomp; // total time decompressing audio
    uint32_t timeblit; // total time blitting
    uint32_t timeopen; // total open time

    uint32_t fileframerate; // frame rate originally in the file
    uint32_t fileframeratediv;

    uint32_t runtimeframes; // max frames for runtime analysis
    uint32_t runtimemoveamt; // bytes to move each frame
    uint32_t PTR4* rtframetimes; // start times for runtime frames
    uint32_t PTR4* rtadecomptimes; // decompress times for runtime frames
    uint32_t PTR4* rtvdecomptimes; // decompress times for runtime frames
    uint32_t PTR4* rtblittimes; // blit times for runtime frames
    uint32_t PTR4* rtreadtimes; // read times for runtime frames
    uint32_t PTR4* rtidlereadtimes; // idle read times for runtime frames
    uint32_t PTR4* rtthreadreadtimes; // thread read times for runtime frames

    uint32_t lastblitflags; // flags used on last blit
    uint32_t lastdecompframe; // last frame number decompressed

    uint32_t lastresynctime; // last loop point that we did a resync on
    uint32_t doresync; // should we do a resync in the next doframe?

    uint32_t playingtracks; // how many tracks are playing
    uint32_t soundskips; // number of sound stops
    BINKSND PTR4* bsnd; // SND structures
    uint32_t skippedlastblit; // skipped last frame?
    uint32_t skipped_this_frame; // skipped the current frame?
    uint32_t skippedblits; // how many blits were skipped

    BUNDLEPOINTERS bunp; // pointers to internal temporary memory
    uint32_t skipped_in_a_row; // how many frames have we skipped in a row
    uint32_t big_sound_skip_adj; // adjustment for large skips
    uint32_t big_sound_skip_reduce; // amount to reduce large skips by each frame
    uint32_t last_time_almost_empty; // time of last almost empty IO buffer
    uint32_t last_read_count; // counter to keep track of the last bink IO
    uint32_t last_sound_count; // counter to keep track of the last bink sound
    uint32_t snd_callback_buffer[16]; // buffer for background sound callback
} BINK;

typedef struct BINKSUMMARY
{
    uint32_t Width; // Width of frames
    uint32_t Height; // Height of frames
    uint32_t TotalTime; // total time (ms)
    uint32_t FileFrameRate; // frame rate
    uint32_t FileFrameRateDiv; // frame rate divisor
    uint32_t FrameRate; // frame rate
    uint32_t FrameRateDiv; // frame rate divisor
    uint32_t TotalOpenTime; // Time to open and prepare for decompression
    uint32_t TotalFrames; // Total Frames
    uint32_t TotalPlayedFrames; // Total Frames played
    uint32_t SkippedFrames; // Total number of skipped frames
    uint32_t SkippedBlits; // Total number of skipped blits
    uint32_t SoundSkips; // Total number of sound skips
    uint32_t TotalBlitTime; // Total time spent blitting
    uint32_t TotalReadTime; // Total time spent reading
    uint32_t TotalVideoDecompTime; // Total time spent decompressing video
    uint32_t TotalAudioDecompTime; // Total time spent decompressing audio
    uint32_t TotalIdleReadTime; // Total time spent reading while idle
    uint32_t TotalBackReadTime; // Total time spent reading in background
    uint32_t TotalReadSpeed; // Total io speed (bytes/second)
    uint32_t SlowestFrameTime; // Slowest single frame time (ms)
    uint32_t Slowest2FrameTime; // Second slowest single frame time (ms)
    uint32_t SlowestFrameNum; // Slowest single frame number
    uint32_t Slowest2FrameNum; // Second slowest single frame number
    uint32_t AverageDataRate; // Average data rate of the movie
    uint32_t AverageFrameSize; // Average size of the frame
    uint32_t HighestMemAmount; // Highest amount of memory allocated
    uint32_t TotalIOMemory; // Total extra memory allocated
    uint32_t HighestIOUsed; // Highest extra memory actually used
    uint32_t Highest1SecRate; // Highest 1 second rate
    uint32_t Highest1SecFrame; // Highest 1 second start frame
} BINKSUMMARY;

typedef struct BINKREALTIME
{
    // TODO: marked these as volatile to get matches in radcb

    uint32_t FrameNum; // Current frame number
    volatile uint32_t FrameRate; // frame rate
    uint32_t FrameRateDiv; // frame rate divisor
    uint32_t Frames; // frames in this sample period
    volatile uint32_t FramesTime; // time is ms for these frames
    uint32_t FramesVideoDecompTime; // time decompressing these frames
    uint32_t FramesAudioDecompTime; // time decompressing these frames
    uint32_t FramesReadTime; // time reading these frames
    uint32_t FramesIdleReadTime; // time reading these frames at idle
    uint32_t FramesThreadReadTime; // time reading these frames in background
    uint32_t FramesBlitTime; // time blitting these frames
    uint32_t ReadBufferSize; // size of read buffer
    uint32_t ReadBufferUsed; // amount of read buffer currently used
    uint32_t FramesDataRate; // data rate for these frames
    // last offset it 0x34
} BINKREALTIME;

#define BINKMARKER1 'fKIB'
#define BINKMARKER2 'gKIB' // new Bink files use this tag
#define BINKMARKER3 'hKIB' // newer Bink files use this tag
#define BINKMARKER4 'iKIB' // even newer Bink files use this tag

typedef struct BINKHDR
{
    uint32_t Marker; // Bink marker
    uint32_t Size; // size of the file-8
    uint32_t Frames; // Number of frames (1 based, 100 = 100 frames)
    uint32_t LargestFrameSize; // Size in bytes of largest frame
    uint32_t InternalFrames; // Number of internal frames

    uint32_t Width; // Width (1 based, 640 for example)
    uint32_t Height; // Height (1 based, 480 for example)
    uint32_t FrameRate; // frame rate
    uint32_t FrameRateDiv; // frame rate divisor (framerate/frameratediv=fps)

    uint32_t Flags; // height compression options
    uint32_t NumTracks; // number of tracks
} BINKHDR;

//=======================================================================
#define BINKYAINVERT 0x00000800L // Reverse Y and A planes when blitting (for debugging)
#define BINKFRAMERATE 0x00001000L // Override fr (call BinkFrameRate first)
#define BINKPRELOADALL 0x00002000L // Preload the entire animation
#define BINKSNDTRACK 0x00004000L // Set the track number to play
#define BINKOLDFRAMEFORMAT 0x00008000L // using the old Bink frame format (internal use only)
#define BINKRBINVERT 0x00010000L // use reversed R and B planes (internal use only)
#define BINKGRAYSCALE 0x00020000L // Force Bink to use grayscale
#define BINKNOMMX 0x00040000L // Don't use MMX
#define BINKNOSKIP 0x00080000L // Don't skip frames if falling behind
#define BINKALPHA 0x00100000L // Decompress alpha plane (if present)
#define BINKNOFILLIOBUF 0x00200000L // Fill the IO buffer in SmackOpen
#define BINKSIMULATE 0x00400000L // Simulate the speed (call BinkSim first)
#define BINKFILEHANDLE 0x00800000L // Use when passing in a file handle
#define BINKIOSIZE 0x01000000L // Set an io size (call BinkIOSize first)
#define BINKIOPROCESSOR 0x02000000L // Set an io processor (call BinkIO first)
#define BINKFROMMEMORY 0x04000000L // Use when passing in a pointer to the file
#define BINKNOTHREADEDIO 0x08000000L // Don't use a background thread for IO

#define BINKSURFACEFAST 0x00000000L
#define BINKSURFACESLOW 0x08000000L
#define BINKSURFACEDIRECT 0x04000000L

#define BINKCOPYALL 0x80000000L // copy all pixels (not just changed)
#define BINKCOPY2XH 0x10000000L // Force doubling height scaling
#define BINKCOPY2XHI 0x20000000L // Force interleaving height scaling
#define BINKCOPY2XW 0x30000000L // copy the width zoomed by two
#define BINKCOPY2XWH 0x40000000L // copy the width and height zoomed by two
#define BINKCOPY2XWHI 0x50000000L // copy the width and height zoomed by two
#define BINKCOPY1XI 0x60000000L // copy the width and height zoomed by two
#define BINKCOPYNOSCALING 0x70000000L // Force scaling off

//#define BINKALPHA           0x00100000L // Decompress alpha plane (if present)
//#define BINKNOSKIP          0x00080000L // don't skip the blit if behind in sound
//#define BINKNOMMX           0x00040000L // Don't skip frames if falling behind
//#define BINKGRAYSCALE       0x00020000L // force Bink to use grayscale
//#define BINKRBINVERT        0x00010000L // use reversed R and B planes

#define BINKSURFACE8P 0
#define BINKSURFACE24 1
#define BINKSURFACE24R 2
#define BINKSURFACE32 3
#define BINKSURFACE32R 4
#define BINKSURFACE32A 5
#define BINKSURFACE32RA 6
#define BINKSURFACE4444 7
#define BINKSURFACE5551 8
#define BINKSURFACE555 9
#define BINKSURFACE565 10
#define BINKSURFACE655 11
#define BINKSURFACE664 12
#define BINKSURFACEYUY2 13
#define BINKSURFACEUYVY 14
#define BINKSURFACEYV12 15
#define BINKSURFACEMASK 15

#ifdef __RADXBOX__

#define BINKSURFACESALL 32
#define BINKCONVERTERSMONO 64
#define BINKCONVERTERS2X 256

#define BINKCONVERTERSALL (BINKSURFACESALL | BINKCONVERTERSMONO | BINKCONVERTERS2X)

#define BinkLoad() BinkLoadUnload(1)
#define BinkUnload() BinkLoadUnload(0)

#define BinkLoadConverter(val) BinkLoadUnloadConverter(val, 1)
#define BinkUnloadConverter(val) BinkLoadUnloadConverter(val, 0)

RADEXPFUNC void RADEXPLINK BinkLoadUnload(int32_t inout);
RADEXPFUNC void RADEXPLINK BinkLoadUnloadConverter(uint32_t surfaces, int32_t inout);

#endif

#define BINKGOTOQUICK 1
#define BINKGOTOQUICKSOUND 2

#define BINKGETKEYPREVIOUS 0
#define BINKGETKEYNEXT 1
#define BINKGETKEYCLOSEST 2
#define BINKGETKEYNOTEQUAL 128

//=======================================================================

#ifdef __RADMAC__
#pragma export on

RADEXPFUNC HBINK RADEXPLINK BinkMacOpen(void /*FSSpec*/* fsp, uint32_t flags);
#endif

RADEXPFUNC void PTR4* RADEXPLINK BinkLogoAddress(void);

RADEXPFUNC void RADEXPLINK BinkSetError(const char PTR4* err);
RADEXPFUNC char PTR4* RADEXPLINK BinkGetError(void);

RADEXPFUNC HBINK RADEXPLINK BinkOpen(const char PTR4* name, uint32_t flags);

RADEXPFUNC int32_t RADEXPLINK BinkDoFrame(HBINK bnk);
RADEXPFUNC void RADEXPLINK BinkNextFrame(HBINK bnk);
RADEXPFUNC int32_t RADEXPLINK BinkWait(HBINK bnk);
RADEXPFUNC void RADEXPLINK BinkClose(HBINK bnk);
RADEXPFUNC int32_t RADEXPLINK BinkPause(HBINK bnk, int32_t pause);
RADEXPFUNC int32_t RADEXPLINK BinkCopyToBuffer(HBINK bnk, void* dest, int32_t destpitch, uint32_t destheight,
                                           uint32_t destx, uint32_t desty, uint32_t flags);
RADEXPFUNC int32_t RADEXPLINK BinkCopyToBufferRect(HBINK bnk, void* dest, int32_t destpitch, uint32_t destheight,
                                               uint32_t destx, uint32_t desty, uint32_t srcx, uint32_t srcy, uint32_t srcw,
                                               uint32_t srch, uint32_t flags);
RADEXPFUNC int32_t RADEXPLINK BinkGetRects(HBINK bnk, uint32_t flags);
RADEXPFUNC void RADEXPLINK BinkGoto(HBINK bnk, uint32_t frame, int32_t flags); // use 1 for the first frame
RADEXPFUNC uint32_t RADEXPLINK BinkGetKeyFrame(HBINK bnk, uint32_t frame, int32_t flags);

RADEXPFUNC int32_t RADEXPLINK BinkSetVideoOnOff(HBINK bnk, int32_t onoff);
RADEXPFUNC int32_t RADEXPLINK BinkSetSoundOnOff(HBINK bnk, int32_t onoff);
RADEXPFUNC void RADEXPLINK BinkFreeGlocalMemory(void);
RADEXPFUNC void RADEXPLINK BinkSetVolume(HBINK bnk, uint32_t trackid, int32_t volume);
RADEXPFUNC void RADEXPLINK BinkSetPan(HBINK bnk, uint32_t trackid, int32_t pan);
RADEXPFUNC void RADEXPLINK BinkSetMixBins(HBINK bnk, uint32_t trackid, uint32_t PTR4* mix_bins, uint32_t total);
RADEXPFUNC void RADEXPLINK BinkSetMixBinVolumes(HBINK bnk, uint32_t trackid, uint32_t PTR4* vol_mix_bins,
                                                int32_t PTR4* volumes, uint32_t total);
RADEXPFUNC void RADEXPLINK BinkService(HBINK bink);

typedef struct BINKTRACK PTR4* HBINKTRACK;

typedef struct BINKTRACK
{
    uint32_t Frequency;
    uint32_t Bits;
    uint32_t Channels;
    uint32_t MaxSize;

    HBINK bink;
    uint32_t sndcomp;
    int32_t trackindex;
} BINKTRACK;

RADEXPFUNC HBINKTRACK RADEXPLINK BinkOpenTrack(HBINK bnk, uint32_t trackindex);
RADEXPFUNC void RADEXPLINK BinkCloseTrack(HBINKTRACK bnkt);
RADEXPFUNC uint32_t RADEXPLINK BinkGetTrackData(HBINKTRACK bnkt, void PTR4* dest);

RADEXPFUNC uint32_t RADEXPLINK BinkGetTrackType(HBINK bnk, uint32_t trackindex);
RADEXPFUNC uint32_t RADEXPLINK BinkGetTrackMaxSize(HBINK bnk, uint32_t trackindex);
RADEXPFUNC uint32_t RADEXPLINK BinkGetTrackID(HBINK bnk, uint32_t trackindex);

RADEXPFUNC void RADEXPLINK BinkGetSummary(HBINK bnk, BINKSUMMARY PTR4* sum);
RADEXPFUNC void RADEXPLINK BinkGetRealtime(HBINK bink, BINKREALTIME PTR4* run, uint32_t frames);

RADEXPFUNC void RADEXPLINK BinkSetSoundTrack(uint32_t total_tracks, uint32_t PTR4* tracks);
RADEXPFUNC void RADEXPLINK BinkSetIO(BINKIOOPEN io);
RADEXPFUNC void RADEXPLINK BinkSetFrameRate(uint32_t forcerate, uint32_t forceratediv);
RADEXPFUNC void RADEXPLINK BinkSetSimulate(uint32_t sim);
RADEXPFUNC void RADEXPLINK BinkSetIOSize(uint32_t iosize);

RADEXPFUNC int32_t RADEXPLINK BinkSetSoundSystem(BINKSNDSYSOPEN open, uint32_t param);

#ifdef __RADWIN__

RADEXPFUNC BINKSNDOPEN RADEXPLINK BinkOpenDirectSound(uint32_t param); // don't call directly
#define BinkSoundUseDirectSound(lpDS) BinkSetSoundSystem(BinkOpenDirectSound, (uint32_t)lpDS)

RADEXPFUNC BINKSNDOPEN RADEXPLINK BinkOpenWaveOut(uint32_t param); // don't call directly
#define BinkSoundUseWaveOut() BinkSetSoundSystem(BinkOpenWaveOut, 0)

#endif

#ifndef __RADMAC__

RADEXPFUNC BINKSNDOPEN RADEXPLINK BinkOpenMiles(uint32_t param); // don't call directly
#define BinkSoundUseMiles(hdigdriver) BinkSetSoundSystem(BinkOpenMiles, (uint32_t)hdigdriver)

#endif

#ifdef __RADMAC__

RADEXPFUNC BINKSNDOPEN RADEXPLINK BinkOpenSoundManager(uint32_t param); // don't call directly
#define BinkSoundUseSoundManager() BinkSetSoundSystem(BinkOpenSoundManager, 0)

#endif

#ifdef __RADLINUX__

RADEXPFUNC BINKSNDOPEN RADEXPLINK BinkOpenSDLMixer(uint32_t param); // don't call directly
#define BinkSoundUseSDLMixer() BinkSetSoundSystem(BinkOpenSDLMixer, 0)

#endif

#ifdef __RADNGC__

typedef void PTR4*(RADLINK PTR4* RADARAMALLOC)(uint32_t num_bytes);
typedef void(RADLINK PTR4* RADARAMFREE)(void PTR4* ptr);

typedef struct RADARAMCALLBACKS
{
    RADARAMALLOC aram_malloc;
    RADARAMFREE aram_free;
} RADARAMCALLBACKS;

RADEXPFUNC BINKSNDOPEN RADEXPLINK BinkOpenAX(uint32_t param); // don't call directly
#define BinkSoundUseAX(functions)                                                                  \
    BinkSetSoundSystem(BinkOpenAX, (uint32_t)functions) // takes a pointer to RADARAMCALLBACKS

RADEXPFUNC BINKSNDOPEN RADEXPLINK BinkOpenMusyXSound(uint32_t param); // don't call directly
#define BinkSoundUseMusyX() BinkSetSoundSystem(BinkOpenMusyXSound, 0)

#endif

#if defined(__RADXBOX__) || defined(__RADWIN__)

RADEXPFUNC int32_t RADEXPLINK BinkDX8SurfaceType(void* lpD3Ds);

#endif

#if defined(__RADWIN__)

RADEXPFUNC int32_t RADEXPLINK BinkDX9SurfaceType(void* lpD3Ds);

#endif

// The BinkBuffer API isn't implemented on DOS, Xbox or GameCube
#if !defined(__RADDOS__) && !defined(__RADXBOX__) && !defined(__RADNGC__)

//=========================================================================
typedef struct BINKBUFFER* HBINKBUFFER;

#define BINKBUFFERSTRETCHXINT 0x80000000
#define BINKBUFFERSTRETCHX 0x40000000
#define BINKBUFFERSHRINKXINT 0x20000000
#define BINKBUFFERSHRINKX 0x10000000
#define BINKBUFFERSTRETCHYINT 0x08000000
#define BINKBUFFERSTRETCHY 0x04000000
#define BINKBUFFERSHRINKYINT 0x02000000
#define BINKBUFFERSHRINKY 0x01000000
#define BINKBUFFERSCALES 0xff000000
#define BINKBUFFERRESOLUTION 0x00800000

#ifdef __RADMAC__

//#include <windows.h>
//#include <palettes.h>
//#include <qdoffscreen.h>

typedef struct BINKBUFFER
{
    uint32_t Width;
    uint32_t Height;
    uint32_t WindowWidth;
    uint32_t WindowHeight;
    uint32_t SurfaceType;
    void* Buffer;
    int32_t BufferPitch;
    uint32_t ScreenWidth;
    uint32_t ScreenHeight;
    uint32_t ScreenDepth;
    uint32_t ScaleFlags;

    int32_t destx, desty;
    int32_t wndx, wndy;
    uint32_t wnd;

    int32_t noclipping;
    uint32_t type;
    int32_t issoftcur;
    uint32_t cursorcount;

} BINKBUFFER;

#define BINKBUFFERAUTO 0
#define BINKBUFFERDIRECT 1
#define BINKBUFFERGWORLD 2
#define BINKBUFFERTYPEMASK 31

RADEXPFUNC HBINKBUFFER RADEXPLINK BinkBufferOpen(void* /*WindowPtr*/ wnd, uint32_t width, uint32_t height,
                                                 uint32_t bufferflags);
RADEXPFUNC int32_t RADEXPLINK BinkGDSurfaceType(void* /*GDHandle*/ gd);
RADEXPFUNC int32_t RADEXPLINK BinkIsSoftwareCursor(void* /*GDHandle*/ gd);
RADEXPFUNC int32_t RADEXPLINK BinkCheckCursor(void* /*WindowPtr*/ wp, int32_t x, int32_t y, int32_t w, int32_t h);

#else

typedef struct BINKBUFFER
{
    uint32_t Width;
    uint32_t Height;
    uint32_t WindowWidth;
    uint32_t WindowHeight;
    uint32_t SurfaceType;
    void* Buffer;
    int32_t BufferPitch;
    int32_t ClientOffsetX;
    int32_t ClientOffsetY;
    uint32_t ScreenWidth;
    uint32_t ScreenHeight;
    uint32_t ScreenDepth;
    uint32_t ExtraWindowWidth;
    uint32_t ExtraWindowHeight;
    uint32_t ScaleFlags;
    uint32_t StretchWidth;
    uint32_t StretchHeight;

    int32_t surface;
    void* ddsurface;
    void* ddclipper;
    int32_t destx, desty;
    int32_t wndx, wndy;
    uint32_t wnd;
    int32_t minimized;
    int32_t ddoverlay;
    int32_t ddoffscreen;
    int32_t lastovershow;

    int32_t issoftcur;
    uint32_t cursorcount;
    void* buffertop;
    uint32_t type;
    int32_t noclipping;

    int32_t loadeddd;
    int32_t loadedwin;

    void* dibh;
    void* dibbuffer;
    int32_t dibpitch;
    void* dibinfo;
    uint32_t dibdc;
    uint32_t diboldbitmap;

} BINKBUFFER;

#define BINKBUFFERAUTO 0
#define BINKBUFFERPRIMARY 1
#define BINKBUFFERDIBSECTION 2
#define BINKBUFFERYV12OVERLAY 3
#define BINKBUFFERYUY2OVERLAY 4
#define BINKBUFFERUYVYOVERLAY 5
#define BINKBUFFERYV12OFFSCREEN 6
#define BINKBUFFERYUY2OFFSCREEN 7
#define BINKBUFFERUYVYOFFSCREEN 8
#define BINKBUFFERRGBOFFSCREENVIDEO 9
#define BINKBUFFERRGBOFFSCREENSYSTEM 10
#define BINKBUFFERLAST 10
#define BINKBUFFERTYPEMASK 31

RADEXPFUNC HBINKBUFFER RADEXPLINK BinkBufferOpen(void* /*HWND*/ wnd, uint32_t width, uint32_t height,
                                                 uint32_t bufferflags);
RADEXPFUNC int32_t RADEXPLINK BinkBufferSetHWND(HBINKBUFFER buf, void* /*HWND*/ newwnd);
RADEXPFUNC int32_t RADEXPLINK BinkDDSurfaceType(void PTR4* lpDDS);
RADEXPFUNC int32_t RADEXPLINK BinkIsSoftwareCursor(void PTR4* lpDDSP, void* /*HCURSOR*/ cur);
RADEXPFUNC int32_t RADEXPLINK BinkCheckCursor(void* /*HWND*/ wnd, int32_t x, int32_t y, int32_t w, int32_t h);
RADEXPFUNC int32_t RADEXPLINK BinkBufferSetDirectDraw(void PTR4* lpDirectDraw, void PTR4* lpPrimary);

#endif

RADEXPFUNC void RADEXPLINK BinkBufferClose(HBINKBUFFER buf);
RADEXPFUNC int32_t RADEXPLINK BinkBufferLock(HBINKBUFFER buf);
RADEXPFUNC int32_t RADEXPLINK BinkBufferUnlock(HBINKBUFFER buf);
RADEXPFUNC void RADEXPLINK BinkBufferSetResolution(int32_t w, int32_t h, int32_t bits);
RADEXPFUNC void RADEXPLINK BinkBufferCheckWinPos(HBINKBUFFER buf, int32_t PTR4* NewWindowX,
                                                 int32_t PTR4* NewWindowY);
RADEXPFUNC int32_t RADEXPLINK BinkBufferSetOffset(HBINKBUFFER buf, int32_t destx, int32_t desty);
RADEXPFUNC void RADEXPLINK BinkBufferBlit(HBINKBUFFER buf, BINKRECT PTR4* rects, uint32_t numrects);
RADEXPFUNC int32_t RADEXPLINK BinkBufferSetScale(HBINKBUFFER buf, uint32_t w, uint32_t h);
RADEXPFUNC char PTR4* RADEXPLINK BinkBufferGetDescription(HBINKBUFFER buf);
RADEXPFUNC char PTR4* RADEXPLINK BinkBufferGetError();
RADEXPFUNC void RADEXPLINK BinkRestoreCursor(int32_t checkcount);
RADEXPFUNC int32_t RADEXPLINK BinkBufferClear(HBINKBUFFER buf, uint32_t RGB);

#endif

typedef void PTR4*(RADLINK PTR4* BINKMEMALLOC)(uint32_t bytes);
typedef void(RADLINK PTR4* BINKMEMFREE)(void PTR4* ptr);

RADEXPFUNC void RADEXPLINK BinkSetMemory(BINKMEMALLOC a, BINKMEMFREE f);

#ifdef __RADMAC__

#pragma export off

#endif

RADDEFEND

#endif

// @cdep pre $set(INCs,$INCs -I$clipfilename($file)) $ignore(TakeCPP)

#endif
