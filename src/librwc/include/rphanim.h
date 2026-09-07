#ifndef LIBRWC_RPHANIM
#define LIBRWC_RPHANIM

#include "rwcore.h"

typedef rw::HAnimNodeInfo RpHAnimNodeInfo;
typedef rw::HAnimHierarchy RpHAnimHierarchy;
typedef rw::Animation RpHAnimAnimation;

typedef rw::HAnimHierarchy::Flags RpHAnimHierarchyFlag;

constexpr RpHAnimHierarchyFlag rpHANIMHIERARCHYSUBHIERARCHY = rw::HAnimHierarchy::SUBHIERARCHY;
constexpr RpHAnimHierarchyFlag rpHANIMHIERARCHYNOMATRICES = rw::HAnimHierarchy::NOMATRICES;
constexpr RpHAnimHierarchyFlag rpHANIMHIERARCHYUPDATEMODELLINGMATRICES =
    rw::HAnimHierarchy::UPDATEMODELLINGMATRICES;
constexpr RpHAnimHierarchyFlag rpHANIMHIERARCHYUPDATELTMS = rw::HAnimHierarchy::UPDATELTMS;
constexpr RpHAnimHierarchyFlag rpHANIMHIERARCHYLOCALSPACEMATRICES =
    rw::HAnimHierarchy::LOCALSPACEMATRICES;

inline RpHAnimHierarchy* RpHAnimHierarchyCreate(RwInt32 numNodes, RwUInt32* nodeFlags,
                                                RwInt32* nodeIDs, RpHAnimHierarchyFlag flags,
                                                RwInt32 maxInterpKeyFrameSize)
{
    return rw::HAnimHierarchy::create(numNodes, reinterpret_cast<RwInt32*>(nodeFlags), nodeIDs, flags,
                               maxInterpKeyFrameSize);
}

inline RwBool RpHAnimFrameSetHierarchy(RwFrame* frame, RpHAnimHierarchy* hierarchy)
{
    rw::HAnimData::get(frame)->hierarchy = hierarchy;
    return 1;
}

inline RpHAnimHierarchy* RpHAnimFrameGetHierarchy(RwFrame* frame)
{
    return rw::HAnimHierarchy::get(frame);
}

#endif
