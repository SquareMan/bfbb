#include "imgui_internal.h"
#include <Windows.h>

#include "iSystem.h"

#include <cstdio>
#include <cstdlib>
#include <cstring>
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
#include <semaphore>
#include <synchapi.h>
#define SDL_MAIN_HANDLED 1
#include "SDL3/SDL_dialog.h"
#include <SDL3/SDL_error.h>
#include "SDL3/SDL_events.h"
#include "SDL3/SDL_init.h"
#include <SDL3/SDL_log.h>
#include <SDL3/SDL_main.h>
#include <SDL3/SDL_storage.h>
#include <SDL3/SDL_time.h>
#include <SDL3/SDL_timer.h>
#include <SDL3/SDL_video.h>

#include <imgui.h>
#include <imgui_impl_sdl3.h>
#include <imgui_impl_rw.h>

static SDL_Window* sWindow = NULL;

static iTime sLastFrameStartTime = 0;
static iTime targetFrameTime = SDL_NS_PER_SECOND / 60;

void iVSync()
{
    iTime elapsedTime = iTimeGet() - sLastFrameStartTime;
    iTime remainingTime = targetFrameTime - elapsedTime;
    if (remainingTime > 0)
    {
        SDL_DelayPrecise(remainingTime);
    }
    sLastFrameStartTime = iTimeGet();

    // Pump the event queue. Maybe we this should be done somewhere else but this seems to be our only
    // entry point from the game code
    SDL_Event event;
    while (SDL_PollEvent(&event))
    {
        ImGui_ImplSDL3_ProcessEvent(&event);
        switch (event.type)
        {
        case SDL_EVENT_WINDOW_CLOSE_REQUESTED:
            // TODO: Graceful shutdown
            iSystemExit();
            exit(0);
        case SDL_EVENT_GAMEPAD_ADDED:
        case SDL_EVENT_GAMEPAD_REMOVED:
            // TODO: Respond to inputs from inactive gamepads and switching the active gamepad to that one.
            iPadInit();
        }
    }
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

static std::binary_semaphore semWaitForAssetPath{ 0 };
static char sAssetsFolder[1024] = { 0 };

static void imguiStyle()
{
    ImGuiIO& io = ImGui::GetIO();
    io.ConfigFlags |= ImGuiConfigFlags_NavEnableKeyboard;
    io.ConfigFlags |= ImGuiConfigFlags_NavEnableGamepad;

    ImGui::GetStyle().FrameRounding = 6.0f;
}

static RwCamera* sImguiCamera = NULL;
static void imguiInit()
{
    assert(sImguiCamera == NULL);

    IMGUI_CHECKVERSION();
    ImGui::CreateContext();
    ImGui_ImplSDL3_InitForOther(sWindow);
    ImGui_ImplRW_Init();

    // TODO: Set this to the SDL pref directory
    ImGui::GetIO().IniFilename = NULL;

    imguiStyle();

    sImguiCamera = RwCameraCreate();
    RwCameraSetFrame(sImguiCamera, RwFrameCreate());
    sImguiCamera->frameBuffer = RwRasterCreate(640, 480, 1, rwRASTERTYPECAMERA);
}

static void imguiExit()
{
    assert(sImguiCamera != NULL);

    RwRasterDestroy(sImguiCamera->frameBuffer);
    sImguiCamera->frameBuffer = NULL;
    RwFrameDestroy(sImguiCamera->getFrame());
    sImguiCamera->setFrame(NULL);
    RwCameraDestroy(sImguiCamera);
    sImguiCamera = NULL;

    ImGui_ImplRW_Shutdown();
    ImGui_ImplSDL3_Shutdown();
    ImGui::Shutdown();
}

static void AssetPathSelectedCallback(void* userdata, const char* const* filelist, int filter)
{
    if (filelist == NULL)
    {
        printf("Could not open folder picker: %s\n", SDL_GetError());
        return;
    }

    const char* dir = filelist[0];
    if (dir != NULL)
    {
        strncpy(sAssetsFolder, dir, 1024);
        sAssetsFolder[1023] = NULL;
        printf("Assets Folder: %s\n", sAssetsFolder);
        // TODO: Cross platformify this
        SetCurrentDirectory(sAssetsFolder);
    }
    semWaitForAssetPath.release();
}

static void prelaunchLoop()
{
    RwRGBA clear = { 0, 0, 0, 255 };
    while (true)
    {
        iVSync();
        ImGui_ImplSDL3_NewFrame();
        ImGui_ImplRW_NewFrame();
        ImGui::NewFrame();

        RwCameraClear(sImguiCamera, &clear, rwCAMERACLEARIMAGE);
        RwCameraBeginUpdate(sImguiCamera);

        const ImGuiViewport* viewport = ImGui::GetMainViewport();
        ImGui::SetNextWindowSize(viewport->Size);
        ImGui::SetNextWindowPos(ImVec2{ viewport->Pos.x, viewport->Pos.y });
        ImGui::PushStyleVar(ImGuiStyleVar_WindowBorderSize, 0);
        ImGui::Begin("Prelaunch", NULL,
                     ImGuiWindowFlags_NoDecoration | ImGuiWindowFlags_NoMove |
                         ImGuiWindowFlags_NoSavedSettings | ImGuiWindowFlags_NoBringToFrontOnFocus);
        ImGui::PopStyleVar();

        if (sAssetsFolder[0] == NULL)
        {
            if (ImGui::Button("Select Asset Path"))
            {
                // TODO: Cache this to avoid alerting every time we start the game
                SDL_ShowOpenFolderDialog(AssetPathSelectedCallback, NULL, NULL, NULL, false);
                semWaitForAssetPath.acquire();
            }
            ImGui::SetItemTooltip("You must provide a path to an extracted Xbox iso to play.");
        }
        else
        {
            if (ImGui::Button("Play"))
                break;
        }
        ImGui::SameLine();
        ImGui::Text("%s", sAssetsFolder);

        ImGui::End();

        ImGui::Render();
        ImGui_ImplRW_RenderDrawLists(ImGui::GetDrawData());
        RwCameraEndUpdate(sImguiCamera);
        RwCameraShowRaster(sImguiCamera, NULL, rwRASTERFLIPWAITVSYNC);
    }
}

void iSystemInit(U32 options)
{
    SDL_SetAppMetadata("SpongeBob SquarePants: Battle for Bikini Bottom", "PC Port", "");
    SDL_Init(SDL_INIT_GAMEPAD | SDL_INIT_AUDIO);
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

    imguiInit();
    prelaunchLoop();
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

    imguiExit();
    SDL_Quit();
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
