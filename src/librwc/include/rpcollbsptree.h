#ifndef LIBRWC_RPCOLLBSPTREE
#define LIBRWC_RPCOLLBSPTREE

#include "rpcollis.h"
#include "rw.h"
#include "rwplcore.h"
#include <cstring>

struct RpV3dGradient
{
    RwReal dydx;
    RwReal dzdx;
    RwReal dxdy;
    RwReal dzdy;
    RwReal dxdz;
    RwReal dydz;
};

struct RpCollBSPBranchNode
{
    RwUInt16 type;
    RwUInt8 leftType;
    RwUInt8 rightType;
    RwUInt16 leftNode;
    RwUInt16 rightNode;
    RwReal leftValue;
    RwReal rightValue;
};

struct RpCollBSPLeafNode
{
    RwUInt16 numPolygons;
    RwUInt16 firstPolygon;
};

struct RpCollBSPTriangle
{
    RwUInt16 vertIndex[3];
    RwInt16 index;
};

struct RpCollBSPTree
{
    RwUInt32 numLeafNodes;
    RpCollBSPBranchNode* branchNodes;
    RpCollBSPLeafNode* leafNodes;
    RwUInt8 pad[4];
};

struct RpCollisionData
{
    RwInt32 flags;
    RpCollBSPTree* tree;
    RwInt32 numTriangles;
    RwUInt16* triangleMap;
};

#define RpCollisionGeometryGetData(_geometry) \
    (PLUGINOFFSET(RpCollisionData*, _geometry, _rpCollisionGeometryDataOffset) ? \
        *PLUGINOFFSET(RpCollisionData*, _geometry, _rpCollisionGeometryDataOffset) : \
        NULL)


// FIXME: This is in the wrong header
inline RwInt32 _rpCollisionGeometryDataOffset = 0;
// inline RwInt32 _rpCollisionWorldSectorDataOffset = 0;
inline void* RpCollisionCtor(void* object, RwInt32 offset, RwInt32 size)
{
    *PLUGINOFFSET(RpCollisionData*, object, offset) = NULL;
    return object;
}

inline void* RpCollisionDtor(void* object, RwInt32 offset, RwInt32 size)
{
    // nothing to do
    return object;
}

inline void* RpCollisionCopy(void* dstObject, void* srcObject, RwInt32 offset, RwInt32 size)
{
    RpCollisionCtor(dstObject, offset, size);
    return dstObject;
}
inline RwBool RpCollisionPluginAttach(void)
{
    const rw::uint32 pluginID = 0x0253;
    _rpCollisionGeometryDataOffset = rw::Geometry::registerPlugin(sizeof(RpCollisionData*), pluginID, RpCollisionCtor, RpCollisionDtor, RpCollisionCopy);
    return 1;
}


#endif
