#ifndef LIBRWC_RPCOLLIS
#define LIBRWC_RPCOLLIS

#include "rpworld.h"

#include <cassert>

typedef union RpIntersectData RpIntersectData;
typedef struct RpIntersection RpIntersection;
typedef struct RpCollisionTriangle RpCollisionTriangle;

/* RpCollisionTriangle is typedef'd above */
union RpIntersectData
{
    RwLine line;
    RwV3d point;
    RwSphere sphere;
    RwBBox box;
    void* object;
};

enum RpIntersectType
{
    rpINTERSECTNONE = 0,
    rpINTERSECTLINE,
    rpINTERSECTPOINT,
    rpINTERSECTSPHERE,
    rpINTERSECTBOX,
    rpINTERSECTATOMIC,
    rpINTERSECTTYPEFORCEENUMSIZEINT = 2147483647,
};
typedef enum RpIntersectType RpIntersectType;

struct RpIntersection
{
    RpIntersectData t;
    RpIntersectType type;
};

struct RpCollisionTriangle
{
    RwV3d normal;
    RwV3d point;
    RwInt32 index;
    RwV3d* vertices[3];
};

typedef RpCollisionTriangle* (*RpIntersectionCallBackGeometryTriangle)(
    RpIntersection* intersection, RpCollisionTriangle* collTriangle, RwReal distance, void* data);

typedef RpCollisionTriangle* (*RpIntersectionCallBackWorldTriangle)(
    RpIntersection* intersection, RpWorldSector* sector, RpCollisionTriangle* collTriangle,
    RwReal distance, void* data);

typedef RpAtomic* (*RpIntersectionCallBackAtomic)(RpIntersection* intersection,
                                                  RpWorldSector* sector, RpAtomic* atomic,
                                                  RwReal distance, void* data);

typedef RpWorldSector* (*RpIntersectionCallBackWorldSector)(RpIntersection* intersection,
                                                            RpWorldSector* worldSector, void* data);

inline RpAtomic* RpAtomicForAllIntersections(RpAtomic* atomic, RpIntersection* intersection,
                                             RpIntersectionCallBackGeometryTriangle callBack,
                                             void* data)
{
    assert(false && "TODO");
    return NULL;
}

inline RpWorld* RpCollisionWorldForAllIntersections(RpWorld* world, RpIntersection* intersection,
                                                    RpIntersectionCallBackWorldTriangle callBack,
                                                    void* data)
{
    assert(false && "TODO");
    return NULL;
}

inline RwBool RpCollisionPluginAttach(void)
{
    assert(false && "TODO");
    return 0;
}

#endif
