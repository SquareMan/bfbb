#ifndef ZENT_H
#define ZENT_H

#include "xEnt.h"
#include "xAnim.h"

#include "zScene.h"
#include "zEvent.h"


struct zScene;

struct _ShadowParams
{
    U32 type;
    F32 at;
    F32 rad;
};

struct zEnt : xEnt
{
    xAnimTable* atbl;
};

void checkpoint_collision_hack(zEnt* ent);
char* zParamGetString(xModelAssetParam* param, U32 size, char* tok, char* def);
S32 zParamGetFloatList(xModelAssetParam* param, U32 size, const char* tok, S32 count, F32* def,
                       F32* result);
void zEntGetShadowParams(xEnt* ent, xVec3* center, F32* radius, xEntShadow::radius_enum rtype);
S32 zParamGetVector(xModelAssetParam* param, U32 size, const char* tok, xVec3 result, xVec3*);
S32 zParamGetVector(xModelAssetParam* param, U32 size, char* tok, xVec3 result, xVec3*);
S32 zParamGetFloatList(xModelAssetParam* param, U32 size, char* tok, S32 count, F32* def,
                       F32* result);
S32 zParamGetFloatList(xModelAssetParam* param, U32 size, char* tok, S32 count, F32* def,
                       F32* result);
F32 zParamGetFloat(xModelAssetParam* param, U32 size, const char* tok, F32 def);
F32 zParamGetFloat(xModelAssetParam* param, U32 size, char* tok, F32 def);
S32 zParamGetInt(xModelAssetParam* param, U32 size, const char* tok, S32 def);
S32 zParamGetInt(xModelAssetParam* param, U32 size, char* tok, S32 def);
xModelAssetParam* zEntGetModelParams(U32 assetID, U32* size);
void zEntAnimEvent_AutoAnim(zEnt* ent, U32 animEvent, const F32* animParam);
xAnimTable* xEnt_AnimTable_AutoEventSmall();
void zEntAnimEvent(zEnt* ent, U32 animEvent, const F32* animParam);
void zEntParseModelInfo(xEnt* ent, U32 assetID);
xModelInstance* zEntRecurseModelInfo(void* info, xEnt* ent);
void zEntEventAllOfType(U32 toEvent, U32 type);
void zEntEventAll(xBase* from, U32 fromEvent, U32 toEvent, F32* toParam);
void zEntUpdate(zEnt* ent, zScene* scene, F32 elapsedSec);
void zEntReset(zEnt* ent);
void zEntLoad(zEnt* ent, xSerial* s);
void zEntSave(zEnt* ent, xSerial* s);
void zEntSetup(zEnt* ent);
void zEntInit(zEnt* ent, xEntAsset* asset, U32 type);

// Weak functions retail emitted into zEnt.o. The name says x-layer, but the
// body is in zEnt.cpp, so this header is where the declaration belongs.
// (xEntGetFrame used to be re-declared here as well; xEnt.h already had it.)
WEAK void xModelAnimCollStop(xModelInstance& m);

#endif
