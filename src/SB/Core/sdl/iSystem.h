#ifndef ISYSTEM_H
#define ISYSTEM_H

#include "rwplcore.h"
#include <types.h>

struct BackendConfig
{
    const char* assetPath;
    S32 skipPrelaunch;
    S32 fullscreen;
    S32 windowWidth;
    S32 windowHeight;
    S32 shadowRes;
};

extern BackendConfig gBackendConfig;

#define iSystemPaceFrame() iVSync()
S32 iSystemScreenWidth();
S32 iSystemScreenHeight();
#define iSystemScreenWidthF() ((F32)iSystemScreenWidth())
#define iSystemScreenHeightF() ((F32)iSystemScreenHeight())

struct RwMemoryFunctions* psGetMemoryFunctions();

void iVSync();
void iSystemInit(U32 options);
void iSystemExit();
U32 iGetCurrFormattedDate(char* input);
U32 iGetCurrFormattedTime(char* input);

void imguiNewFrame();
void imguiRender();

#endif
