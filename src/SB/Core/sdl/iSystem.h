#ifndef ISYSTEM_H
#define ISYSTEM_H

#include "rwplcore.h"
#include <types.h>

struct BackendConfig
{
    const char* assetPath;
    S32 skipPrelaunch;
};

extern BackendConfig gBackendConfig;

#define iSystemPaceFrame() iVSync()

struct RwMemoryFunctions* psGetMemoryFunctions();

void iVSync();
void iSystemInit(U32 options);
void iSystemExit();
U32 iGetCurrFormattedDate(char* input);
U32 iGetCurrFormattedTime(char* input);

#endif
