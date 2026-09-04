#include <types.h>

#include "xTRC.h"
#include "zGlobals.h"

extern xGlobals* xglobals;
extern zGlobals globals;

S32 iPadInit()
{
    return 1;
}

_tagxPad* iPadEnable(_tagxPad* pad, S16 port)
{
    pad->port = port;
    pad->slot = 0;
    pad->state = ePad_Enabled;
    gTrcPad[pad->port].state = TRC_PadInserted;
    pad->flags |= 3;
    pad->flags |= 4;
    return pad;
}

S32 iPadConvStick(F32 value)
{
    F32 clampedValue;
    if (value > 40.0f)
    {
        clampedValue = 40.0f;
    }
    else if (value < -40.0f)
    {
        clampedValue = -40.0f;
    }
    else
    {
        clampedValue = value;
    }

    F32 convertedValue = 3.2f * clampedValue;

    if (convertedValue > 127.0f)
    {
        convertedValue = 127.0f;
    }
    else if (convertedValue < -127.0f)
    {
        convertedValue = -127.0f;
    }

    return convertedValue;
}

S32 iPadUpdate(_tagxPad* pad, U32* on)
{
    return 1;
}

// Maps one GameCube pad button onto one xPad button: gcnMask selects the bit in
// the PADStatus button word, xpadButton is the bit to report when it is held.
S32 iPadConvFromGCN(U32 gcnButtons, U32 gcnMask, U32 xpadButton)
{
    return (gcnButtons & gcnMask) ? xpadButton : 0;
}

void iPadRumbleFx(_tagxPad* p, _tagxRumble* r, F32 time_passed)
{
}

void iPadStopRumble(_tagxPad* pad)
{
}

void iPadStopRumble()
{
}

void iPadStartRumble(_tagxPad* pad, _tagxRumble* rumble)
{
}

void iPadKill()
{
}
