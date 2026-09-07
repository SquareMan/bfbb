#ifndef LIBRWC_RTSLERP
#define LIBRWC_RTSLERP

#include "rtquat.h"

struct RtQuatSlerpCache
{
    RtQuat raFrom;
    RtQuat raTo;
    RwReal omega;
    RwBool nearlyZeroOm;
};

inline void RtQuatSetupSlerpCache(RtQuat* qpFrom, RtQuat* qpTo, RtQuatSlerpCache* sCache)
{
    // I will not be using the cache. I think that's fine...
    memset(sCache, 0, sizeof(RtQuatSlerpCache));
}

inline void RtQuatSlerp(RtQuat* result, RtQuat* from, RtQuat* to, RwReal t, RtQuatSlerpCache* cache)
{
    *reinterpret_cast<rw::Quat*>(result) =
        rw::slerp(*reinterpret_cast<rw::Quat*>(from), *reinterpret_cast<rw::Quat*>(to), t);
}

#endif
