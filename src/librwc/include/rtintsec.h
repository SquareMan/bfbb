#ifndef LIBRWC_RTINTSEC
#define LIBRWC_RTINTSEC

#include "rwcore.h"

#include <cassert>

RwBool RtIntersectionSphereTriangle(RwSphere* sphere, RwV3d* a, RwV3d* b, RwV3d* c,
                                           RwV3d* normal, RwReal* distance);
RwBool RtIntersectionBBoxTriangle(RwBBox* bbox, RwV3d* v0, RwV3d* v1, RwV3d* v2);

#endif
