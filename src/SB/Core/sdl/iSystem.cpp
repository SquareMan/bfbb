#include <Windows.h>
#include <macros.h>
#include <rwcore.h>
#include <rpcollbsptree.h>
#include <rpptank.h>

#include "iSystem.h"

#include "xDebug.h"
#include "xFX.h"
#include "xIni.h"
#include "xPad.h"
#include "xSnd.h"
#include "xShadow.h"
#include "xstransvc.h"

#include "iFile.h"
#include "iSystem.h"

#include <cmath>
#include <cstdio>
#include <cstdlib>
#include <cstring>

// Seems that <wchar.h> uses sse2 intrinsics which aren't included by default?
#include <immintrin.h>
#include <semaphore>
#include <synchapi.h>
#include <SDL3/SDL.h>

#include <imgui.h>
#include <imgui_internal.h>
#include <imgui_impl_sdl3.h>
#include <imgui_impl_rw.h>

static SDL_Window* sWindow = NULL;

static iTime sLastFrameStartTime = 0;
static iTime targetFrameTime = SDL_NS_PER_SECOND / 60;

BackendConfig gBackendConfig = { NULL, FALSE, FALSE, 640, 480 };

static void backendConfigPersist()
{
    auto storage = SDL_OpenUserStorage("bfbbdecomp", "Battle For Bikini Bottom", 0);
    if (storage != NULL)
    {
        static char buf[1024] = { 0 };
        const char* fileTemplate = &R"(
[backend]
assetPath = %s
skipPrelaunch = %d
fullscreen = %d
windowWidth = %d
windowHeight = %d
shadowRes = %d)"[1];

        int n = snprintf(buf, sizeof(buf), fileTemplate, gBackendConfig.assetPath,
                         gBackendConfig.skipPrelaunch, gBackendConfig.fullscreen,
                         gBackendConfig.windowWidth, gBackendConfig.windowHeight,
                         gBackendConfig.shadowRes);
        n = MIN(n, sizeof(buf));
        SDL_WriteStorageFile(storage, "settings.ini", buf, n);
        SDL_CloseStorage(storage);
    }
}

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
            break;
        case SDL_EVENT_WINDOW_RESIZED:
            if (SDL_GetWindowFlags(sWindow) & SDL_WINDOW_FULLSCREEN)
                break;
            gBackendConfig.windowWidth = event.window.data1;
            gBackendConfig.windowHeight = event.window.data2;
            backendConfigPersist();
            break;
        case SDL_EVENT_GAMEPAD_ADDED:
        case SDL_EVENT_GAMEPAD_REMOVED:
            // TODO: Respond to inputs from inactive gamepads and switching the active gamepad to that one.
            iPadInit();
            break;
        }
    }
}

static void sdlInit()
{
    SDL_SetAppMetadata("SpongeBob SquarePants: Battle for Bikini Bottom", "PC Port", "");
    SDL_Init(SDL_INIT_GAMEPAD | SDL_INIT_AUDIO);

    SDL_WindowFlags windowFlags = SDL_WINDOW_RESIZABLE;
    if (gBackendConfig.fullscreen)
    {
        windowFlags |= SDL_WINDOW_FULLSCREEN;
    }
    sWindow = SDL_CreateWindow("Battle for Bikini Bottom", gBackendConfig.windowWidth,
                               gBackendConfig.windowHeight, windowFlags);
    if (sWindow == NULL)
    {
        SDL_Log("Failed to create window: %s", SDL_GetError());
        exit(1);
    }
}

static void sdlExit()
{
    SDL_DestroyWindow(sWindow);
    sWindow = NULL;
    SDL_Quit();
}

static void backendConfigInit()
{
    auto storage = SDL_OpenUserStorage("bfbbdecomp", "Battle For Bikini Bottom", 0);
    if (storage != NULL)
    {
        static char buf[1024] = { 0 };
        Uint64 len;
        if (SDL_GetStorageFileSize(storage, "settings.ini", &len) && len <= sizeof(buf) &&
            SDL_ReadStorageFile(storage, "settings.ini", buf, len))
        {
            xIniFile* ini = xIniParse(buf, len);
            gBackendConfig.assetPath = SDL_strdup(xIniGetString(ini, "assetPath", ""));
            gBackendConfig.skipPrelaunch = xIniGetInt(ini, "skipPrelaunch", FALSE);
            gBackendConfig.fullscreen = xIniGetInt(ini, "fullscreen", FALSE);
            gBackendConfig.windowWidth = xIniGetInt(ini, "windowWidth", 640);
            gBackendConfig.windowHeight = xIniGetInt(ini, "windowHeight", 480);
            gBackendConfig.shadowRes = xIniGetInt(ini, "shadowRes", 1);
            xIniDestroy(ini);
        }
        SDL_CloseStorage(storage);
    }
}

static void backendConfigDeinit()
{
    if (gBackendConfig.assetPath != NULL)
    {
        SDL_free((void*)gBackendConfig.assetPath);
        gBackendConfig.assetPath = NULL;
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

static void RenderWareInitEngine()
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
}

static void RenderWareInit()
{
    SDL_PropertiesID props = SDL_GetWindowProperties(sWindow);
    HWND hWnd = (HWND)SDL_GetPointerProperty(props, SDL_PROP_WINDOW_WIN32_HWND_POINTER, NULL);

    rw::EngineOpenParams params;
    params.window = hWnd;
    rw::Engine::open(&params);

    rw::Engine::start();

    rw::Texture::readCB = TextureRead;
    rw::Texture::setMipmapping(true);
    rw::Texture::setAutoMipmapping(true);
}

static void RenderWareExit()
{
    rw::Engine::stop();
    rw::Engine::close();
    rw::Engine::term();
}

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
    sImguiCamera->frameBuffer =
        RwRasterCreate(iSystemScreenWidth(), iSystemScreenHeight(), 1, rwRASTERTYPECAMERA);
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
    ImGui::DestroyContext();
}

static std::binary_semaphore semWaitForAssetPath{ 0 };
static void AssetPathSelectedCallback(void* userdata, const char* const* filelist, int filter)
{
    if (filelist == NULL)
    {
        SDL_Log("Could not open folder picker: %s\n", SDL_GetError());
        return;
    }

    const char* dir = filelist[0];
    if (dir != NULL)
    {
        // We can safely directly update this here in this callback as long as we are using the semaphore for sync
        if (gBackendConfig.assetPath != NULL)
        {
            SDL_free((void*)gBackendConfig.assetPath);
        }
        gBackendConfig.assetPath = SDL_strdup(dir);
        SDL_Log("Assets Folder Selected: %s\n", gBackendConfig.assetPath);
    }
    semWaitForAssetPath.release();
}

static void promptForNewAssetDirectory()
{
    SDL_ShowOpenFolderDialog(AssetPathSelectedCallback, NULL, NULL, NULL, false);
    semWaitForAssetPath.acquire();
    backendConfigPersist();
}

static void imguiMarqueeText(const char* text)
{
    float remainingWidth = ImGui::GetContentRegionAvail().x;
    ImVec2 size = ImGui::CalcTextSize(text);

    if (remainingWidth < size.x)
    {
        ImGuiID id = ImGui::GetID(text);
        ImGui::PushID(id);

        // Poor man's marquee text effect. Bounce between beginning and end of text. The easing function could be nicer
        ImGuiWindow* window = ImGui::GetCurrentWindow();
        ImGui::SetCursorPosY(window->DC.CursorPos.y + window->DC.CurrLineTextBaseOffset);
        ImVec2 cursor = ImGui::GetCursorScreenPos();
        ImGui::Dummy({ remainingWidth, size.y });

        // Note: This never gets cleaned up. Our UI is dead simple so it probably doesn't matter much now.
        ImGuiStorage* storage = ImGui::GetStateStorage();
        float time = storage->GetFloat(id, 0.0f);
        float maxOffset = remainingWidth - size.x;
        float offset = std::lerp(maxOffset, 0, (cos(time * 0.47f) + 1) / 2.0f);
        time += ImGui::GetIO().DeltaTime;
        storage->SetFloat(id, time);

        ImGui::PushClipRect(cursor, { cursor.x + remainingWidth, cursor.y + size.y }, true);
        ImGui::GetWindowDrawList()->AddText({ cursor.x + offset, cursor.y },
                                            ImGui::GetColorU32(ImGuiCol_Text), text);
        ImGui::PopClipRect();

        ImGui::PopID();
    }
    else
    {
        ImGui::Text("%s", text);
    }
}

struct WindowSize
{
    const char* disp;
    S32 width;
    S32 height;
};

#define WINDOWSIZE(_w, _h) { #_w "x" #_h, _w, _h }

static WindowSize sWindowSizes[] = {
    // 4:3
    WINDOWSIZE(640, 480),
    WINDOWSIZE(1280, 960),
    WINDOWSIZE(1920, 1440),
    // 16:9
    WINDOWSIZE(1280, 720),
    WINDOWSIZE(1920, 1080),
    WINDOWSIZE(2560, 1440),
    WINDOWSIZE(3840, 2160),
};

struct ShadowRes
{
    const char* disp;
    S32 res;
};

#define SHADOWRES(_res) { "x" #_res, _res }

static ShadowRes sShadowReses[] = {
    SHADOWRES(1),
    SHADOWRES(2),
    SHADOWRES(4),
    SHADOWRES(8),
};

static void windowSizeSelector()
{
    SDL_Rect r;
    SDL_GetDisplayUsableBounds(SDL_GetDisplayForWindow(sWindow), &r);

    S32 selectedIdx = -1;
    for (S32 i = 0; i < ARRAY_SIZE(sWindowSizes); i++)
    {
        if (sWindowSizes[i].width == gBackendConfig.windowWidth &&
            sWindowSizes[i].height == gBackendConfig.windowHeight)
        {
            selectedIdx = i;
            break;
        }
    }

    ImGui::BeginDisabled(SDL_GetWindowFlags(sWindow) & SDL_WINDOW_FULLSCREEN);
    if (ImGui::BeginCombo("Window Size", selectedIdx >= 0 ? sWindowSizes[selectedIdx].disp : ""))
    {
        for (S32 i = 0; i < ARRAY_SIZE(sWindowSizes); i++)
        {
            if (sWindowSizes[i].width > r.w || sWindowSizes[i].height > r.h)
            {
                continue;
            }
            const bool isSelected = (i == selectedIdx);
            if (ImGui::Selectable(sWindowSizes[i].disp, isSelected))
            {
                //  config size is set and persisted by SDL event loop
                SDL_SetWindowSize(sWindow, sWindowSizes[i].width, sWindowSizes[i].height);
            }
            if (isSelected)
            {
                ImGui::SetItemDefaultFocus();
            }
        }

        ImGui::EndCombo();
    }
    ImGui::SetItemTooltip("Only for non-fullscreen windows");
    ImGui::EndDisabled();
}

static void shadowResSelector()
{
    S32 selectedIdx = -1;
    for (S32 i = 0; i < ARRAY_SIZE(sShadowReses); i++)
    {
        if (gBackendConfig.shadowRes == sShadowReses[i].res)
        {
            selectedIdx = i;
            break;
        }
    }

    if (ImGui::BeginCombo("Shadow Resolution",
                          selectedIdx >= 0 ? sShadowReses[selectedIdx].disp : ""))
    {
        for (S32 i = 0; i < ARRAY_SIZE(sShadowReses); i++)
        {
            const bool isSelected = (selectedIdx == i);
            if (ImGui::Selectable(sShadowReses[i].disp, isSelected))
            {
                gBackendConfig.shadowRes = sShadowReses[i].res;
                backendConfigPersist();
            }
            ImGui::SetItemTooltip("%dx%d", 256 * sShadowReses[i].res, 256 * sShadowReses[i].res);

            // Set the initial focus when opening the combo (scrolling + keyboard navigation focus)
            if (isSelected)
            {
                ImGui::SetItemDefaultFocus();
            }
        }
        ImGui::EndCombo();
    }
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

        const ImGuiViewport* viewport = ImGui::GetMainViewport();
        ImGui::SetNextWindowSize(viewport->Size);
        ImGui::SetNextWindowPos(ImVec2{ viewport->Pos.x, viewport->Pos.y });
        ImGui::PushStyleVar(ImGuiStyleVar_WindowBorderSize, 0);
        ImGui::Begin("Prelaunch", NULL,
                     ImGuiWindowFlags_NoDecoration | ImGuiWindowFlags_NoMove |
                         ImGuiWindowFlags_NoSavedSettings | ImGuiWindowFlags_NoBringToFrontOnFocus);
        ImGui::PopStyleVar();

        if (gBackendConfig.assetPath == NULL || gBackendConfig.assetPath[0] == 0)
        {
            ImGui::BeginDisabled();
            ImGui::Button("Play");
            ImGui::SetItemTooltip("You must provide a path to an extracted Xbox iso to play.");
            ImGui::EndDisabled();

            if (ImGui::SameLine(); ImGui::Button("Select Asset Path"))
            {
                promptForNewAssetDirectory();
            }
        }
        else
        {
            {
                ImGui::Text("Disk Ready:");
                ImGui::SameLine();
                imguiMarqueeText(gBackendConfig.assetPath);

                if (ImGui::Button("Play"))
                    break;
                if (ImGui::SameLine(); ImGui::Button("Change Asset Path"))
                {
                    promptForNewAssetDirectory();
                }
            }

            {
                ImGui::Spacing();
                ImGui::Spacing();
                ImGui::Text("Video Settings - EXPERIMENTAL");
                ImGui::SetItemTooltip(
                    "Using resolutions other than 640x480 is currently experimental.");
                ImGui::Separator();

                if (ImGui::Button("Toggle Fullscreen"))
                {
                    gBackendConfig.fullscreen = !gBackendConfig.fullscreen;
                    SDL_SetWindowFullscreen(sWindow, gBackendConfig.fullscreen);
                    backendConfigPersist();
                }
                ImGui::SetItemTooltip("Fullscreen always renders at screen resolution");

                F32 spacing = ImGui::GetStyle().ItemInnerSpacing.x;
                ImGui::PushItemWidth(ImGui::CalcItemWidth() - ImGui::GetItemRectSize().x - spacing);
                ImGui::SameLine(0, spacing);
                windowSizeSelector();
                ImGui::PopItemWidth();

                shadowResSelector();
            }

            {
                ImGui::SetCursorPosY(ImGui::GetContentRegionMax().y - ImGui::GetTextLineHeight());
                bool skipPrelaunch = gBackendConfig.skipPrelaunch;
                ImGui::Checkbox("Skip Prelaunch", &skipPrelaunch);
                ImGui::SetItemTooltip(
                    "WARNING: Currently not possible to revert this without editing settings.ini manually.\nSkip this menu when starting the game in the future and use saved options.");
                if (skipPrelaunch != (bool)gBackendConfig.skipPrelaunch)
                {
                    gBackendConfig.skipPrelaunch = skipPrelaunch;
                    backendConfigPersist();
                }
            }
        }

        ImGui::End();
        ImGui::Render();

        if (sImguiCamera->frameBuffer->width != iSystemScreenWidth() ||
            sImguiCamera->frameBuffer->height != iSystemScreenHeight())
        {
            RwRasterDestroy(sImguiCamera->frameBuffer);
            sImguiCamera->frameBuffer =
                RwRasterCreate(iSystemScreenWidth(), iSystemScreenHeight(), 1, rwRASTERTYPECAMERA);
        }

        RwCameraClear(sImguiCamera, &clear, rwCAMERACLEARIMAGE);
        RwCameraBeginUpdate(sImguiCamera);

        ImGui_ImplRW_RenderDrawLists(ImGui::GetDrawData());
        RwCameraEndUpdate(sImguiCamera);
        RwCameraShowRaster(sImguiCamera, NULL, rwRASTERFLIPWAITVSYNC);
    }
}

void iSystemInit(U32 options)
{
    xMemInit();
    iTimeInit();
    RenderWareInitEngine();
    backendConfigInit();
    sdlInit();
    RenderWareInit();
    imguiInit();
    if (gBackendConfig.assetPath == NULL || !gBackendConfig.skipPrelaunch)
    {
        prelaunchLoop();
    }

    iFileInit();
    xShadowInit();
    xFXInit();
    xDebugInit();
    xPadInit();
    xSndInit();
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

    imguiExit();
    backendConfigDeinit();
    sdlExit();
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

S32 iSystemScreenWidth()
{
    S32 w, h;
    SDL_GetWindowSize(sWindow, &w, &h);
    return w;
}

S32 iSystemScreenHeight()
{
    S32 w, h;
    SDL_GetWindowSize(sWindow, &w, &h);
    return h;
}
