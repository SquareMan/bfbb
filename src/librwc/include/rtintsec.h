#ifndef LIBRWC_RTINTSEC
#define LIBRWC_RTINTSEC

#include "rwcore.h"

#include <cassert>

inline RwBool RtIntersectionSphereTriangle(RwSphere* sphere, RwV3d* v0, RwV3d* v1, RwV3d* v2,
                                           RwV3d* normal, RwReal* distance)
{
    assert(false && "TODO");
    return 0;
}
inline RwBool RtIntersectionBBoxTriangle(RwBBox* bbox, RwV3d* v0, RwV3d* v1, RwV3d* v2)
{
    assert(false && "TODO");
    return 0;
}

#endif
