#ifndef LIBRWC_RPSKIN
#define LIBRWC_RPSKIN

#include "rpworld.h"
#include "rwplcore.h"
#include "rphanim.h"

typedef rw::Skin RpSkin;

struct RwMatrixWeights
{
    RwReal w0;
    RwReal w1;
    RwReal w2;
    RwReal w3;
};

inline RpSkin* RpSkinGeometryGetSkin(RpGeometry* geometry)
{
    return rw::Skin::get(geometry);
}

inline RwUInt32 RpSkinGetNumBones(RpSkin* skin)
{
    return skin->numBones;
}

inline const RwMatrixWeights* RpSkinGetVertexBoneWeights(RpSkin* skin)
{
    return reinterpret_cast<RwMatrixWeights*>(skin->weights);
}
inline const RwUInt32* RpSkinGetVertexBoneIndices(RpSkin* skin)
{
    return reinterpret_cast<RwUInt32*>(skin->indices);
}
inline const RwMatrix* RpSkinGetSkinToBoneMatrices(RpSkin* skin)
{
    return reinterpret_cast<RwMatrix*>(skin->inverseMatrices);
}

enum RpSkinType
{
    rpNASKINTYPE = 0,
    rpSKINTYPEGENERIC = 1,
    rpSKINTYPEMATFX = 2,
    rpSKINTYPETOON = 3,
    rpSKINTYPEFORCEENUMSIZEINT = RWFORCEENUMSIZEINT
};
inline RpAtomic* RpSkinAtomicSetType(RpAtomic* atomic, RpSkinType type)
{
    // Note: type is ignored by librw right now
    rw::Skin::setPipeline(atomic, type);
    return atomic;
}

inline RpAtomic* RpSkinAtomicSetHAnimHierarchy(RpAtomic* atomic, RpHAnimHierarchy* hierarchy)
{
    rw::Skin::setHierarchy(atomic, hierarchy);
    return atomic;
}

#endif
