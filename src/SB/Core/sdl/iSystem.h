#ifndef ISYSTEM_H
#define ISYSTEM_H

#include "rwplcore.h"
#include <types.h>

struct RwMemoryFunctions* psGetMemoryFunctions();

void iVSync();
void iSystemInit(U32 options);
void iSystemExit();

#endif
