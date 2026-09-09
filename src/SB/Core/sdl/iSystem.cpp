#include <Windows.h>

#include "iSystem.h"

#include <cstdio>
#include <cstdlib>
#include <rwcore.h>
#include <rpcollbsptree.h>
#include <rpptank.h>

#include "xDebug.h"
#include "xFX.h"
#include "xPad.h"
#include "xSnd.h"
#include "xShadow.h"
#include "xstransvc.h"

#include "iFile.h"
#include "iSystem.h"

// Seems that <wchar.h> uses sse2 intrinsics which aren't included by default?
#include <immintrin.h>
#include <SDL3/SDL_error.h>
#include <synchapi.h>
#define SDL_MAIN_HANDLED 1
#include "SDL3/SDL_events.h"
#include <SDL3/SDL_main.h>
#include <SDL3/SDL_time.h>
#include <SDL3/SDL_timer.h>
#include <SDL3/SDL_video.h>

static SDL_Window* sWindow = NULL;

void iVSync()
{
    // FIXME: Proper frame pacing. This function is only called in certain places though...
    SDL_Event event;
    while(SDL_PollEvent(&event))
    {}
    SDL_DelayNS(SDL_NS_PER_SECOND / 60);
}

static RwTexture* TextureRead(const RwChar* name, const RwChar* maskName)
{
    char buf[0x100];
    sprintf(buf, "%s.rw3", name);

    U32 assetSize;
    RwTexture* asset = (RwTexture*)xSTFindAsset(xStrHash(buf), &assetSize);
    if (asset != NULL)
    {
        strcpy(asset->name, name);
        strcpy(asset->mask, maskName);
    }
    return asset;
}

static void RenderWareInit()
{
    // TODO: setup memfuncs
    rw::Engine::init(NULL);

    rw::registerMeshPlugin();
    RpCollisionPluginAttach();
    RpWorldPluginAttach();
    RpCollisionPluginAttach();
    rw::registerSkinPlugin();
    rw::registerHAnimPlugin();
    rw::registerMatFXPlugin();
    rw::registerUserDataPlugin();
    RpPTankPluginAttach();

    SDL_PropertiesID props = SDL_GetWindowProperties(sWindow);
    HWND hWnd = (HWND)SDL_GetPointerProperty(props, SDL_PROP_WINDOW_WIN32_HWND_POINTER, NULL);

    rw::EngineOpenParams params;
    params.window = hWnd;
    rw::Engine::open(&params);

    rw::Engine::start();

    rw::Texture::readCB = TextureRead;

    xShadowInit();
    xFXInit();
    rw::Texture::setMipmapping(true);
    rw::Texture::setAutoMipmapping(true);
}

static void RenderWareExit()
{
    rw::Engine::stop();
    rw::Engine::close();
    rw::Engine::term();
}
void iSystemInit(U32 options)
{
    //FIXME: This absolutely can NOT be hardcoded!!!!
    SetCurrentDirectory(
        R"(E:\Games\Xbox\Nickelodeon SpongeBob SquarePants - Battle for Bikini Bottom (USA).xiso\)");

    // Note: SDL_RunApp seems to do some necessary setup on some platforms
    // It doesn't seem like win32 is one of those platforms, but not calling it here
    // might give us issues int the future.
    // I'm not sure if it's valid to call SDL_RunApp with a callback that immediately returns or not
    SDL_SetMainReady();
    sWindow = SDL_CreateWindow("Battle for Bikini Bottom", 640, 480, 0);
    if (sWindow == NULL)
    {
        printf("Failed to create window: %s", SDL_GetError());
        exit(1);
    }

    xDebugInit();
    xMemInit();
    iFileInit();
    iTimeInit();
    xPadInit();
    xSndInit();
    RenderWareInit();
    xMathInit();
    xMath3Init();
}

void iSystemExit()
{
    xDebugExit();
    xMathExit();
    RenderWareExit();
    xSndExit();
    xPadKill();
    iFileExit();
    iTimeExit();
    xMemExit();
}

const char* months[] = {
    "January ", "February ", "March ",     "April ",   "May ",      "June ",
    "July ",    "August ",   "September ", "October ", "November ", "December "
};

const char* dotw[] = { "Sunday ",   "Monday ", "Tuesday ", "Wednesday ",
                       "Thursday ", "Friday ", "Saturday " };

U32 iGetCurrFormattedDate(char* input)
{
    char* start = input;
    SDL_Time timeSinceEpoch;
    SDL_GetCurrentTime(&timeSinceEpoch);
    SDL_DateTime date;
    SDL_TimeToDateTime(timeSinceEpoch, &date, true);

    strcpy(input, dotw[date.day_of_week]);
    strcat(input, months[date.month]);
    input += strlen(input);

    if (date.day >= 10)
    {
        *input++ = (date.day / 10) + '0';
    }

    *input++ = (date.day % 10) + '0';
    *input++ = ',';
    *input++ = ' ';
    *input++ = (date.year / 1000) + '0';
    *input++ = ((date.year / 100) % 10) + '0';
    *input++ = ((date.year / 10) % 100) + '0';
    *input++ = (date.year % 10) + '0';
    *input++ = '\0';

    return input - start;
}

U32 iGetCurrFormattedTime(char* input)
{
    char* start = input;
    S32 am = 0;

    SDL_Time timeSinceEpoch;
    SDL_GetCurrentTime(&timeSinceEpoch);
    SDL_DateTime date;
    SDL_TimeToDateTime(timeSinceEpoch, &date, true);

    if (date.hour < 12)
    {
        am = 1;
    }
    else
    {
        date.hour -= 12;
    }

    if (date.hour == 0)
        date.hour = 12;

    if (date.hour >= 10)
    {
        *input++ = (date.hour / 10) + '0';
    }

    *input++ = (date.hour % 10) + '0';
    *input++ = ':';
    *input++ = (date.minute / 10) + '0';
    *input++ = (date.minute % 10) + '0';
    *input++ = ':';
    *input++ = (date.second / 10) + '0';
    *input++ = (date.second % 10) + '0';
    *input++ = ' ';

    if (am)
    {
        *input++ = 'A';
        *input++ = '.';
        *input++ = 'M';
        *input++ = '.';
    }
    else
    {
        *input++ = 'P';
        *input++ = '.';
        *input++ = 'M';
        *input++ = '.';
    }

    *input++ = '\0';

    return input - start;
}
