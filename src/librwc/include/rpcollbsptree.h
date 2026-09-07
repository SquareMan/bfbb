#ifndef LIBRWC_RPCOLLBSPTREE
#define LIBRWC_RPCOLLBSPTREE

#include "rwplcore.h"

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


inline static RwInt32 _rpCollisionGeometryDataOffset = 0;
inline static RwInt32 _rpCollisionWorldSectorDataOffset = 0;

#endif
