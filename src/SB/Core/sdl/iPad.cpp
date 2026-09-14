#include <cstdio>
#include <types.h>

#include "xTRC.h"
#include "zGlobals.h"

#include <immintrin.h>
#include <SDL3/SDL_gamepad.h>

extern xGlobals* xglobals;
extern zGlobals globals;

static SDL_Gamepad* sActivePad = NULL;

S32 iPadInit()
{
    int count;
    SDL_JoystickID* gamepads = SDL_GetGamepads(&count);

    if(count <= 0) 
    {
        printf("iPad: no gamepads available\n");
        return 1;
    }

    // TODO: Pick best gamepad based on capabilities?
    SDL_JoystickID useJoystick = gamepads[0];

    sActivePad = SDL_OpenGamepad(useJoystick);
    if(sActivePad == NULL)
    {
        printf("iPad: Failed to open gamepad device: %s", SDL_GetError());
        return 1;
    }

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
    SDL_UpdateGamepads();
    if(sActivePad == NULL)
    {
        return 1;
    }

    *on = 0;
    *on |= SDL_GetGamepadButton(sActivePad, SDL_GAMEPAD_BUTTON_START) ? XPAD_BUTTON_START : 0;
    *on |= SDL_GetGamepadButton(sActivePad, SDL_GAMEPAD_BUTTON_BACK) ? XPAD_BUTTON_SELECT : 0;
    *on |= SDL_GetGamepadButton(sActivePad, SDL_GAMEPAD_BUTTON_DPAD_UP) ? XPAD_BUTTON_UP : 0;
    *on |= SDL_GetGamepadButton(sActivePad, SDL_GAMEPAD_BUTTON_DPAD_RIGHT) ? XPAD_BUTTON_RIGHT : 0;
    *on |= SDL_GetGamepadButton(sActivePad, SDL_GAMEPAD_BUTTON_DPAD_DOWN) ? XPAD_BUTTON_DOWN : 0;
    *on |= SDL_GetGamepadButton(sActivePad, SDL_GAMEPAD_BUTTON_DPAD_LEFT) ? XPAD_BUTTON_LEFT : 0;
    // *on |= SDL_GetGamepadButton(sActivePad, SDL_GAMEPAD_BUTTON_LEFT_SHOULDER) ? XPAD_BUTTON_L1 : 0;
    *on |= SDL_GetGamepadAxis(sActivePad, SDL_GAMEPAD_AXIS_LEFT_TRIGGER) > 30000 ? XPAD_BUTTON_L1 : 0;
    *on |= SDL_GetGamepadButton(sActivePad, SDL_GAMEPAD_BUTTON_RIGHT_SHOULDER) ? XPAD_BUTTON_Z : 0;
    *on |= SDL_GetGamepadAxis(sActivePad, SDL_GAMEPAD_AXIS_RIGHT_TRIGGER) > 30000 ? XPAD_BUTTON_R1 : 0;
    *on |= SDL_GetGamepadButton(sActivePad, SDL_GAMEPAD_BUTTON_SOUTH) ? XPAD_BUTTON_X: 0;
    *on |= SDL_GetGamepadButton(sActivePad, SDL_GAMEPAD_BUTTON_EAST) ? XPAD_BUTTON_O: 0;
    *on |= SDL_GetGamepadButton(sActivePad, SDL_GAMEPAD_BUTTON_WEST) ? XPAD_BUTTON_TRIANGLE: 0;
    *on |= SDL_GetGamepadButton(sActivePad, SDL_GAMEPAD_BUTTON_NORTH) ? XPAD_BUTTON_SQUARE: 0;

    pad->analog1.x = SDL_GetGamepadAxis(sActivePad, SDL_GAMEPAD_AXIS_LEFTX) / 256;
    pad->analog1.y = SDL_GetGamepadAxis(sActivePad, SDL_GAMEPAD_AXIS_LEFTY) / 256;
    pad->analog2.x = SDL_GetGamepadAxis(sActivePad, SDL_GAMEPAD_AXIS_RIGHTX) / 256;
    pad->analog2.y = SDL_GetGamepadAxis(sActivePad, SDL_GAMEPAD_AXIS_RIGHTY) / 256;
    return 1;
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
