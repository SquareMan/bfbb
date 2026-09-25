
#ifndef LIBRWC_COLLISION_SUPPORT
#define LIBRWC_COLLISION_SUPPORT

#include "rwcore.h"

bool PointInTriangle(const RwV3d& test, const RwV3d& a, const RwV3d& b, const RwV3d& c);
RwBool IntersectionLineTriangle(const RwLine& line, const RwV3d& a, const RwV3d& b, const RwV3d& c, RwReal& outT);

#endif
