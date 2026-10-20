#ifndef XPAD_H
#define XPAD_H

#include "xRumble.h"
#include "xMath2.h"
#include "iPad.h"

enum _tagPadState
{
    ePad_Disabled,
    ePad_DisabledError,
    ePad_Enabled,
    ePad_Missing,
    ePad_Total
};

struct _tagPadAnalog
{
    S8 x;
    S8 y;
};

struct _tagxPad
{
    struct analog_data
    {
        xVec2 offset;
        xVec2 dir;
        F32 mag;
        F32 ang;
    };

    S8 value[22];

    // Offset: 0x16
    S8 last_value[22];

    // Offset: 0x2C
    U32 on;

    // Offset: 0x30
    U32 pressed;
    U32 released;

    // Offset: 0x38
    _tagPadAnalog analog1;
    _tagPadAnalog analog2;
    _tagPadState state;
    U32 flags;
    _tagxRumble rumble_head;
    S16 port;
    S16 slot;
    _tagiPad context;
    F32 al2d_timer;
    F32 ar2d_timer;
    F32 d_timer;
    F32 up_tmr[22];
    F32 down_tmr[22];
    analog_data analog[2];
};

// Named after PS2 buttons to match the "PadPress*" events
#define XPAD_BUTTON_START 0x1
#define XPAD_BUTTON_SELECT 0x2

// Needs to be cross referenced with PS2/xbox builds
#define XPAD_BUTTON_LSTICK 0x4
#define XPAD_BUTTON_RSTICK 0x8

#define XPAD_BUTTON_UP 0x10
#define XPAD_BUTTON_RIGHT 0x20
#define XPAD_BUTTON_DOWN 0x40
#define XPAD_BUTTON_LEFT 0x80
#define XPAD_BUTTON_LTRIGGER 0x100 // L on gamecube
#define XPAD_BUTTON_LBUMPER 0x200
#define XPAD_BUTTON_RTRIGGER 0x1000 // R on gamecube
#define XPAD_BUTTON_RBUMPER 0x2000
#define XPAD_BUTTON_SOUTH 0x10000 // A on gamecube
#define XPAD_BUTTON_EAST 0x20000 // X on gamecube
#define XPAD_BUTTON_NORTH 0x40000 // Y on gamecube
#define XPAD_BUTTON_WEST 0x80000 // B on gamecube

#ifdef GAMECUBE
// GameCube
#define XPAD_BUTTON_Z 0x100000
#endif

#define XPAD_ACTION_JUMP XPAD_BUTTON_SOUTH
#define XPAD_ACTION_SPIN XPAD_BUTTON_WEST
#define XPAD_ACTION_BASH XPAD_BUTTON_NORTH
#define XPAD_ACTION_BOWL XPAD_BUTTON_EAST
#define XPAD_ACTION_BOUNCE XPAD_BUTTON_EAST
#define XPAD_ACTION_CRUISE_BUBBLE XPAD_BUTTON_LTRIGGER

#define XPAD_ACTION_PICKUP XPAD_BUTTON_EAST

#define XPAD_ACTION_BALL_CANCEL                                                                    \
    (XPAD_BUTTON_SOUTH | XPAD_BUTTON_EAST | XPAD_BUTTON_NORTH | XPAD_BUTTON_WEST)

#define XPAD_ACTION_INTERACT XPAD_BUTTON_RTRIGGER

#define XPAD_ACTION_SKIP (XPAD_BUTTON_SOUTH | XPAD_BUTTON_EAST)

#ifdef GAMECUBE
#define XPAD_ACTION_OPTIONS XPAD_BUTTON_EAST
#define XPAD_ACTION_BACK XPAD_BUTTON_WEST
#else
#define XPAD_ACTION_OPTIONS XPAD_BUTTON_WEST
#define XPAD_ACTION_BACK XPAD_BUTTON_EAST
#endif

#ifdef GAMECUBE
#define XPAD_ACTION_ZOOM XPAD_BUTTON_Z
#define XPAD_ACTION_HUD XPAD_BUTTON_Z
#else
#define XPAD_ACTION_ZOOM XPAD_BUTTON_RSTICK
#define XPAD_ACTION_HUD (XPAD_BUTTON_LBUMPER | XPAD_BUTTON_RBUMPER)
#endif

extern _tagxPad mPad[4];
extern _tagxPad* gDebugPad;
extern _tagxPad* gPlayerPad;

S32 xPadInit();
_tagxPad* xPadEnable(S32 idx);
void xPadRumbleEnable(S32 idx, S32 enable);
S32 xPadUpdate(S32 idx, F32 time_passed);
void xPadNormalizeAnalog(_tagxPad& pad, S32 inner_zone, S32 outer_zone);
void xPadKill();
_tagxRumble* xPadGetRumbleSlot();
void xPadDestroyRumbleChain(_tagxPad* pad);
void xPadDestroyRumbleChain(S32 idx);
S32 xPadAddRumble(S32 idx, _tagRumbleType type, F32 time, S32 replace, U32 fxflags);

void xPadAnalogIsDigital(S32 idx, S32 enable);

inline F32 normalize_analog(S32 v, S32 v_min, S32 v_max, S32 dead_center, S32 dead_min,
                            S32 dead_max);

#endif
