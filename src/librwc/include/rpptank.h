#ifndef LIBRWC_RPPTANK
#define LIBRWC_RPPTANK

#include "rpworld.h"

#include <cassert>

struct RpPTankLockStruct
{
    RwUInt8* data;
    RwInt32 stride;
};

struct RpPTankFormatDescriptor
{
    RwInt32 numClusters;
    RwInt32 stride;
    RwInt32 dataFlags;
};

struct RpPTankData
{
    void* data;
    RpPTankLockStruct clusters[9];
    void* userData;
    RpPTankFormatDescriptor format;
    RwUInt32 srcBlend;
    RwUInt32 dstBlend;
    RwBool vertexAlphaBlend;
    RwV2d cCenter;
    RwV2d cSize;
    RwReal cRotate;
    RwRGBA cColor;
    RwRGBA cVtxColor[4];
    RwTexCoords cUV[4];
    RwMatrix cMatrix;
};

typedef struct RpPTankCallBacks RpPTankCallBacks;
typedef void* (*RpPTankAllocCallBack)(RpPTankData* ptankGlobal, RwInt32 maxPCount,
                                      RwUInt32 dataFlags, RwUInt32 platFlags);
typedef RwBool (*RpPTankCreateCallBack)(RpAtomic* atomic, RpPTankData* ptankGlobal,
                                        RwInt32 maxPCount, RwUInt32 dataFlags, RwUInt32 platFlags);
typedef RwBool (*RpPTankInstanceCallBack)(RpAtomic* atomic, RpPTankData* ptankGlobal,
                                          RwInt32 actPCount, RwUInt32 instFlags);
typedef RwBool (*RpPTankRenderCallBack)(RpAtomic* atomic, RpPTankData* ptankGlobal,
                                        RwInt32 actPCount);

struct RpPTankCallBacks
{
    RpPTankAllocCallBack alloc;
    RpPTankCreateCallBack create;
    RpPTankInstanceCallBack instance;
    RpPTankRenderCallBack render;
};

struct RpPTANKInstanceSetupData
{
    RwBool instancePositions;
    RwBool instanceUVs;
    RwBool instanceColors;
    RwBool instanceNormals;

    RpPTankLockStruct positionOut;
    RpPTankLockStruct UVOut;
    RpPTankLockStruct colorsOut;
    RpPTankLockStruct normalsOut;

    RwV3d right;
    RwV3d up;
};

typedef void (*RpPTankGENInstancePosCallback)(RpPTankLockStruct* dstCluster, RwV3d* right,
                                              RwV3d* up, RwInt32 pCount, RpPTankData* ptankGlobal);

typedef void (*RpPTankGENInstanceCallback)(RpPTankLockStruct* dstCluster, RwInt32 pCount,
                                           RpPTankData* ptankGlobal);

typedef void (*RpPTankGENInstanceSetupCallback)(RpPTANKInstanceSetupData* data, RpAtomic* atomic,
                                                RpPTankData* ptankGlobal, RwInt32 actPCount,
                                                RwUInt32 instFlags);

typedef void (*RpPTankGENInstanceEndingCallback)(RpPTANKInstanceSetupData* data, RpAtomic* atomic,
                                                 RpPTankData* ptankGlobal, RwInt32 actPCount,
                                                 RwUInt32 instFlags);

struct RpPTankAtomicExtPrv
{
    RwInt32 maxPCount;
    RwInt32 actPCount;

    RwBool isAStructure;
    void* rawdata;

    RpAtomicCallBackRender defaultRenderCB;
    RpPTankCallBacks ptankCallBacks;
    RpPTankGENInstanceSetupCallback insSetupCB;
    RpPTankGENInstancePosCallback insPosCB;
    RpPTankGENInstanceCallback insUVCB;
    RpPTankGENInstanceCallback insColorsCB;
    RpPTankGENInstanceCallback insNormalsCB;
    RpPTankGENInstanceEndingCallback insEndingCB;

    RwUInt32 lockFlags;
    RwUInt32 instFlags;
    RwUInt32 platFlags;

    RpPTankData publicData;
};

enum RpPTankLockFlags
{
    rpPTANKLOCKWRITE = ((int)0x40000000),
    rpPTANKLOCKREAD = ((int)0x80000000)
};

enum RpPTankInstanceFlags
{
    rpPTANKIFLAGNONE = ((int)0x00000000),
    rpPTANKIFLAGPOSITION = ((int)0x00000001),
    rpPTANKIFLAGCOLOR = ((int)0x00000002),
    rpPTANKIFLAGSIZE = ((int)0x00000004),
    rpPTANKIFLAGMATRIX = ((int)0x00000008),
    rpPTANKIFLAGNORMAL = ((int)0x00000010),
    rpPTANKIFLAG2DROTATE = ((int)0x00000020),
    rpPTANKIFLAGVTXCOLOR = ((int)0x00000040),
    rpPTANKIFLAGVTX2TEXCOORDS = ((int)0x00000080),
    rpPTANKIFLAGVTX4TEXCOORDS = ((int)0x00000100),
    rpPTANKIFLAGCNSCOLOR = ((int)0x00002000),
    rpPTANKIFLAGCNSSIZE = ((int)0x00004000),
    rpPTANKIFLAGCNSMATRIX = ((int)0x00008000),
    rpPTANKIFLAGCNSNORMAL = ((int)0x00010000),
    rpPTANKIFLAGCNS2DROTATE = ((int)0x00020000),
    rpPTANKIFLAGCNSVTXCOLOR = ((int)0x00040000),
    rpPTANKIFLAGCNSVTX2TEXCOORDS = ((int)0x00080000),
    rpPTANKIFLAGCNSVTX4TEXCOORDS = ((int)0x00100000),
    rpPTANKIFLAGACTNUMCHG = ((int)0x00800000),
    rpPTANKIFLAGCENTER = ((int)0x01000000),
    rpPTANKIFLAGALPHABLENDING = ((int)0x10000000),
    rpPTANKIFLAGALL = ((int)0xFFFFFFFF),

    RPPTANKINSTANCEFLAGSFORCEENUMSIZEINT = RWFORCEENUMSIZEINT
};

enum RpPTankDataFlags
{
    rpPTANKDFLAGNONE = ((int)0x00000000),
    rpPTANKDFLAGPOSITION = ((int)0x00000001),
    rpPTANKDFLAGCOLOR = ((int)0x00000002),
    rpPTANKDFLAGSIZE = ((int)0x00000004),
    rpPTANKDFLAGMATRIX = ((int)0x00000008),
    rpPTANKDFLAGNORMAL = ((int)0x00000010),
    rpPTANKDFLAG2DROTATE = ((int)0x00000020),
    rpPTANKDFLAGVTXCOLOR = ((int)0x00000040),
    rpPTANKDFLAGVTX2TEXCOORDS = ((int)0x00000080),
    rpPTANKDFLAGVTX4TEXCOORDS = ((int)0x00000100),
    rpPTANKDFLAGCNSMATRIX = ((int)0x00008000),
    rpPTANKDFLAGCNSNORMAL = ((int)0x00010000),
    rpPTANKDFLAGCNS2DROTATE = ((int)0x00020000),
    rpPTANKDFLAGCNSVTXCOLOR = ((int)0x00040000),
    rpPTANKDFLAGCNSVTX2TEXCOORDS = ((int)0x00080000),
    rpPTANKDFLAGCNSVTX4TEXCOORDS = ((int)0x00100000),
    rpPTANKDFLAGUSECENTER = ((int)0x01000000),
    rpPTANKDFLAGARRAY = ((int)0x10000000),
    rpPTANKDFLAGSTRUCTURE = ((int)0x20000000),

    RPPTANKDATAFLAGSFORCEENUMSIZEINT = RWFORCEENUMSIZEINT
};

enum RpPTankDataLockFlags
{
    rpPTANKLFLAGNONE = ((int)0x00000000),
    rpPTANKLFLAGPOSITION = ((int)0x00000001),
    rpPTANKLFLAGCOLOR = ((int)0x00000002),
    rpPTANKLFLAGSIZE = ((int)0x00000004),
    rpPTANKLFLAGMATRIX = ((int)0x00000008),
    rpPTANKLFLAGNORMAL = ((int)0x00000010),
    rpPTANKLFLAG2DROTATE = ((int)0x00000020),
    rpPTANKLFLAGVTXCOLOR = ((int)0x00000040),
    rpPTANKLFLAGVTX2TEXCOORDS = ((int)0x00000080),
    rpPTANKLFLAGVTX4TEXCOORDS = ((int)0x00000100),

    RPPTANKLOCKFLAGSFORCEENUMSIZEINT = RWFORCEENUMSIZEINT
};

inline static RwInt32 _rpPTankAtomicDataOffset = 0;
#define RPATOMICPTANKPLUGINDATA(atomic)                                                            \
    (*PLUGINOFFSET(RpPTankAtomicExtPrv*, (atomic), _rpPTankAtomicDataOffset))

inline static RwInt32 _rpPTankGlobalsOffset = 0;
#define GLOBALPTANKPLUGINDATA() (*PLUGINOFFSET(void*, rw::engine, _rpPTankGlobalsOffset))

typedef enum RpPTankLockFlags RpPTankLockFlags;
inline RwBool RpPTankPluginAttach(void)
{
    assert(false && "TODO");
    return 0;
}
inline RpAtomic* RpPTankAtomicCreate(RwInt32 maxParticleNum, RwUInt32 dataFlags, RwUInt32 platFlags)
{
    assert(false && "TODO");
    return 0;
}
inline RpAtomic* _rpPTankAtomicCreateCustom(RwInt32 maxParticleNum, RwUInt32 dataFlags, RwUInt32 platFlags,
                                     RpPTankCallBacks* callbacks)
{
    assert(false && "TODO");
    return 0;
}
inline void RpPTankAtomicDestroy(RpAtomic* ptank)
{
    assert(false && "TODO");
}
inline RwBool RpPTankAtomicLock(RpAtomic* atomic, RpPTankLockStruct* dst, RwUInt32 dataFlags,
                                RpPTankLockFlags lockFlag)
{
    assert(false && "TODO");
    return 0;
}
inline RpAtomic* RpPTankAtomicUnlock(RpAtomic* atomic)
{
    assert(false && "TODO");
    return 0;
}

#endif
