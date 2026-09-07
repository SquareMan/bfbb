#ifndef LIBRWC_RWPLCORE
#define LIBRWC_RWPLCORE

#include <rw.h>

#include <new>
#include <cassert>

typedef rw::int8 RwInt8;
typedef rw::uint8 RwUInt8;
typedef rw::int16 RwInt16;
typedef rw::uint16 RwUInt16;
typedef rw::int32 RwInt32;
typedef rw::uint32 RwUInt32;
typedef rw::int64 RwInt64;
typedef rw::uint64 RwUInt64;
typedef rw::float32 RwReal;
typedef rw::bool32 RwBool;
typedef char RwChar;

typedef rw::RGBA RwRGBA;
typedef rw::RGBAf RwRGBAReal;

typedef rw::Error RwError;

typedef rw::Stream RwStream;
typedef rw::ChunkHeaderInfo RwChunkHeaderInfo;

typedef rw::V2d RwV2d;
typedef rw::V3d RwV3d;
typedef rw::Matrix RwMatrix;

typedef rw::RenderState RwRenderState;
typedef rw::VideoMode RwVideoMode;

typedef rw::LLLink RwLLLink;
typedef rw::LinkList RwLinkList;

inline RwLLLink* rwLinkListGetFirstLLLink(RwLinkList* list)
{
    return list->link.next;
}

inline RwLLLink* rwLinkListGetTerminator(RwLinkList* list)
{
    return list->end();
}

inline RwLLLink* rwLLLinkGetNext(RwLLLink* link)
{
    return link->next;
}

#define rwLLLinkGetData LLLinkGetData

#define RWFORCEENUMSIZEINT ((RwInt32)((~((RwUInt32)0)) >> 1))

typedef rw::CombineOp RwOpCombineType;
constexpr rw::CombineOp rwCOMBINEREPLACE = rw::COMBINEREPLACE;
constexpr rw::CombineOp rwCOMBINEPRECONCAT = rw::COMBINEPRECONCAT;
constexpr rw::CombineOp rwCOMBINEPOSTCONCAT = rw::COMBINEPOSTCONCAT;

inline void* RwMalloc(size_t sz)
{
    return rw::Engine::memfuncs.rwmalloc(sz, 0);
}
inline void* RwMallocL(size_t sz, RwUInt32 hint, void* _l)
{
    return rw::Engine::memfuncs.rwmalloc(sz, hint);
}
inline void RwFree(void* p)
{
    rw::Engine::memfuncs.rwfree(p);
}
inline void* RwRealloc(void* p, size_t sz)
{
    return rw::Engine::memfuncs.rwrealloc(p, sz, 0);
}

#define rwstrcmp strcmp

constexpr RwUInt32 rwID_NAOBJECT = rw::ID_NAOBJECT;
constexpr RwUInt32 rwID_STRUCT = rw::ID_STRUCT;
constexpr RwUInt32 rwID_STRING = rw::ID_STRING;
constexpr RwUInt32 rwID_EXTENSION = rw::ID_EXTENSION;
constexpr RwUInt32 rwID_CAMERA = rw::ID_CAMERA;
constexpr RwUInt32 rwID_TEXTURE = rw::ID_TEXTURE;
constexpr RwUInt32 rwID_MATERIAL = rw::ID_MATERIAL;
constexpr RwUInt32 rwID_MATLIST = rw::ID_MATLIST;
constexpr RwUInt32 rwID_WORLD = rw::ID_WORLD;
constexpr RwUInt32 rwID_MATRIX = rw::ID_MATRIX;
constexpr RwUInt32 rwID_FRAMELIST = rw::ID_FRAMELIST;
constexpr RwUInt32 rwID_GEOMETRY = rw::ID_GEOMETRY;
constexpr RwUInt32 rwID_CLUMP = rw::ID_CLUMP;
constexpr RwUInt32 rwID_LIGHT = rw::ID_LIGHT;
constexpr RwUInt32 rwID_ATOMIC = rw::ID_ATOMIC;
constexpr RwUInt32 rwID_TEXTURENATIVE = rw::ID_TEXTURENATIVE;
constexpr RwUInt32 rwID_TEXDICTIONARY = rw::ID_TEXDICTIONARY;
constexpr RwUInt32 rwID_IMAGE = rw::ID_IMAGE;
constexpr RwUInt32 rwID_GEOMETRYLIST = rw::ID_GEOMETRYLIST;
constexpr RwUInt32 rwID_ANIMANIMATION = rw::ID_ANIMANIMATION;
constexpr RwUInt32 rwID_RIGHTTORENDER = rw::ID_RIGHTTORENDER;
constexpr RwUInt32 rwID_UVANIMDICT = rw::ID_UVANIMDICT;
constexpr RwUInt32 rwID_SKYMIPMAP = rw::ID_SKYMIPMAP;
constexpr RwUInt32 rwID_SKIN = rw::ID_SKIN;
constexpr RwUInt32 rwID_HANIM = rw::ID_HANIM;
constexpr RwUInt32 rwID_USERDATA = rw::ID_USERDATA;
constexpr RwUInt32 rwID_MATFX = rw::ID_MATFX;
constexpr RwUInt32 rwID_ANISOT = rw::ID_ANISOT;
constexpr RwUInt32 rwID_PDS = rw::ID_PDS;
constexpr RwUInt32 rwID_ADC = rw::ID_ADC;
constexpr RwUInt32 rwID_UVANIMATION = rw::ID_UVANIMATION;
constexpr RwUInt32 rwID_MESH = rw::ID_MESH;
constexpr RwUInt32 rwID_NATIVEDATA = rw::ID_NATIVEDATA;
constexpr RwUInt32 rwID_VERTEXFMT = rw::ID_VERTEXFMT;
constexpr RwUInt32 rwID_RASTERGL = rw::ID_RASTERGL;
constexpr RwUInt32 rwID_RASTERPS2 = rw::ID_RASTERPS2;
constexpr RwUInt32 rwID_RASTERXBOX = rw::ID_RASTERXBOX;
constexpr RwUInt32 rwID_RASTERD3D8 = rw::ID_RASTERD3D8;
constexpr RwUInt32 rwID_RASTERD3D9 = rw::ID_RASTERD3D9;
constexpr RwUInt32 rwID_RASTERWDGL = rw::ID_RASTERWDGL;
constexpr RwUInt32 rwID_RASTERGL3 = rw::ID_RASTERGL3;
constexpr RwUInt32 rwID_DRIVER = rw::ID_DRIVER;

#define rwLinkListGetFirstLLLink(list) ((list)->link.next)

// ---------------------- RwVideoMode -----------------------------------

inline RwInt32 RwEngineGetCurrentVideoMode()
{
    return rw::engine->getCurrentVideoMode();
}

inline RwVideoMode* RwEngineGetVideoModeInfo(RwVideoMode* modeinfo, RwInt32 modeIndex)
{
    return rw::engine->getVideoModeInfo(modeinfo, modeIndex);
}

// --------------------- RenderState --------------------------------------

typedef rw::BlendFunction RwBlendFunction;
constexpr rw::BlendFunction rwBLENDZERO = rw::BLENDZERO;
constexpr rw::BlendFunction rwBLENDONE = rw::BLENDONE;
constexpr rw::BlendFunction rwBLENDSRCCOLOR = rw::BLENDSRCCOLOR;
constexpr rw::BlendFunction rwBLENDINVSRCCOLOR = rw::BLENDINVSRCCOLOR;
constexpr rw::BlendFunction rwBLENDSRCALPHA = rw::BLENDSRCALPHA;
constexpr rw::BlendFunction rwBLENDINVSRCALPHA = rw::BLENDINVSRCALPHA;
constexpr rw::BlendFunction rwBLENDDESTALPHA = rw::BLENDDESTALPHA;
constexpr rw::BlendFunction rwBLENDINVDESTALPHA = rw::BLENDINVDESTALPHA;
constexpr rw::BlendFunction rwBLENDDESTCOLOR = rw::BLENDDESTCOLOR;
constexpr rw::BlendFunction rwBLENDINVDESTCOLOR = rw::BLENDINVDESTCOLOR;
constexpr rw::BlendFunction rwBLENDSRCALPHASAT = rw::BLENDSRCALPHASAT;

typedef rw::ShadeMode RwShadeMode;
constexpr rw::ShadeMode rwSHADEMODEFLAT = rw::FLAT;
constexpr rw::ShadeMode rwSHADEMODEGOURAUD = rw::GOURAUD;

typedef rw::CullMode RwCullMode;
constexpr RwCullMode rwCULLMODECULLNONE = rw::CULLNONE;
constexpr RwCullMode rwCULLMODECULLBACK = rw::CULLBACK;
constexpr RwCullMode rwCULLMODECULLFRONT = rw::CULLFRONT;

typedef rw::Texture::Addressing RwTextureAddressMode;
constexpr RwTextureAddressMode rwTEXTUREADDRESSWRAP = rw::Texture::WRAP;
constexpr RwTextureAddressMode rwTEXTUREADDRESSMIRROR = rw::Texture::MIRROR;
constexpr RwTextureAddressMode rwTEXTUREADDRESSCLAMP = rw::Texture::CLAMP;
constexpr RwTextureAddressMode rwTEXTUREADDRESSBORDER = rw::Texture::BORDER;

typedef rw::Texture::FilterMode RwTextureFilterMode;
constexpr RwTextureFilterMode rwFILTERNEAREST = rw::Texture::NEAREST;
constexpr RwTextureFilterMode rwFILTERLINEAR = rw::Texture::LINEAR;
constexpr RwTextureFilterMode rwFILTERMIPNEAREST = rw::Texture::MIPNEAREST;
constexpr RwTextureFilterMode rwFILTERMIPLINEAR = rw::Texture::MIPLINEAR;
constexpr RwTextureFilterMode rwFILTERLINEARMIPNEAREST = rw::Texture::LINEARMIPNEAREST;
constexpr RwTextureFilterMode rwFILTERLINEARMIPLINEAR = rw::Texture::LINEARMIPLINEAR;

typedef rw::RenderState RwRenderState;
constexpr rw::RenderState rwRENDERSTATETEXTURERASTER = rw::TEXTURERASTER;
constexpr rw::RenderState rwRENDERSTATETEXTUREADDRESS = rw::TEXTUREADDRESS;
constexpr rw::RenderState rwRENDERSTATETEXTUREADDRESSU = rw::TEXTUREADDRESSU;
constexpr rw::RenderState rwRENDERSTATETEXTUREADDRESSV = rw::TEXTUREADDRESSV;
constexpr rw::RenderState rwRENDERSTATETEXTUREFILTER = rw::TEXTUREFILTER;
constexpr rw::RenderState rwRENDERSTATEVERTEXALPHA = rw::VERTEXALPHA;
constexpr rw::RenderState rwRENDERSTATESRCBLEND = rw::SRCBLEND;
constexpr rw::RenderState rwRENDERSTATEDESTBLEND = rw::DESTBLEND;
constexpr rw::RenderState rwRENDERSTATEVERTEXALPHAENABLE = rw::VERTEXALPHAENABLE;
constexpr rw::RenderState rwRENDERSTATEZTESTENABLE = rw::ZTESTENABLE;
constexpr rw::RenderState rwRENDERSTATESHADEMODE = rw::SHADEMODE;
constexpr rw::RenderState rwRENDERSTATEZWRITEENABLE = rw::ZWRITEENABLE;
constexpr rw::RenderState rwRENDERSTATEFOGENABLE = rw::FOGENABLE;
constexpr rw::RenderState rwRENDERSTATEFOGCOLOR = rw::FOGCOLOR;
constexpr rw::RenderState rwRENDERSTATEFOGTYPE = rw::FOGTYPE;
constexpr rw::RenderState rwRENDERSTATEFOGDENSITY = rw::FOGDENSITY;
constexpr rw::RenderState rwRENDERSTATECULLMODE = rw::CULLMODE;
constexpr rw::RenderState rwRENDERSTATESTENCILENABLE = rw::STENCILENABLE;
constexpr rw::RenderState rwRENDERSTATESTENCILFAIL = rw::STENCILFAIL;
constexpr rw::RenderState rwRENDERSTATESTENCILZFAIL = rw::STENCILZFAIL;
constexpr rw::RenderState rwRENDERSTATESTENCILPASS = rw::STENCILPASS;
constexpr rw::RenderState rwRENDERSTATESTENCILFUNCTION = rw::STENCILFUNCTION;
constexpr rw::RenderState rwRENDERSTATESTENCILFUNCTIONREF = rw::STENCILFUNCTIONREF;
constexpr rw::RenderState rwRENDERSTATESTENCILFUNCTIONMASK = rw::STENCILFUNCTIONMASK;
constexpr rw::RenderState rwRENDERSTATESTENCILFUNCTIONWRITEMASK = rw::STENCILFUNCTIONWRITEMASK;
constexpr rw::RenderState rwRENDERSTATEALPHATESTFUNC = rw::ALPHATESTFUNC;
constexpr rw::RenderState rwRENDERSTATEALPHATESTREF = rw::ALPHATESTREF;
constexpr rw::RenderState rwRENDERSTATEGSALPHATEST = rw::GSALPHATEST;
constexpr rw::RenderState rwRENDERSTATEGSALPHATESTREF = rw::GSALPHATESTREF;

inline void RwRenderStateSet(RwRenderState state, void* value)
{
    rw::SetRenderState(state, (rw::uint32)value);
}
inline RwBool RwRenderStateGet(RwRenderState state, void* value)
{
    *reinterpret_cast<RwUInt32*>(value) = rw::GetRenderState(state);
    return 1;
}

// ------------------------- RwStream -----------------------------------

enum RwStreamType
{
    rwNASTREAM = 0,
    rwSTREAMFILE,
    rwSTREAMFILENAME,
    rwSTREAMMEMORY,
    rwSTREAMCUSTOM,
    rwSTREAMTYPEFORCEENUMSIZEINT = RWFORCEENUMSIZEINT
};
enum RwStreamAccessType
{
    rwNASTREAMACCESS = 0,
    rwSTREAMREAD,
    rwSTREAMWRITE,
    rwSTREAMAPPEND,
    rwSTREAMACCESSTYPEFORCEENUMSIZEINT = RWFORCEENUMSIZEINT
};

struct RwMemory
{
    RwUInt8* start;
    RwUInt32 length;
};

inline void* RwMemNative32(void* mem, RwUInt32 size)
{
    // I believe this function is supposed to convert endianness between assets and host
    // For now no conversion should be necessary
    return mem;
}

inline RwStream* RwStreamOpen(RwStreamType type, RwStreamAccessType accessType, const void* pData)
{
    switch (type)
    {
    case rwSTREAMMEMORY:
    {
        assert(accessType != rwSTREAMAPPEND && "Not Implemented");
        const RwMemory* mem = reinterpret_cast<const RwMemory*>(pData);
        rw::StreamMemory* stream =
            reinterpret_cast<rw::StreamMemory*>(RwMalloc(sizeof(rw::StreamMemory)));
        new (stream) rw::StreamMemory();
        return stream->open(mem->start, mem->length);
        // TODO: I think we need to support dynamically growing the stream allocation for writing
        break;
    }
    default:
        // BfBB only uses rwSTREAMMEMORY
        assert(false && "Not Implemented");
    }
    return NULL;
}

inline RwBool RwStreamClose(RwStream* stream, void* pData)
{
    stream->close();
    stream->~Stream();
    RwFree(stream);
    // TODO: I think some streams own their buffer and that needs to be freed if so.
    return 1;
}

inline RwBool RwStreamFindChunk(RwStream* stream, RwUInt32 type, RwUInt32* lengthOut,
                                RwUInt32* versionOut)
{
    return rw::findChunk(stream, type, lengthOut, versionOut);
}

inline RwStream* RwStreamReadChunkHeaderInfo(RwStream* stream, RwChunkHeaderInfo* chunkHeaderInfo)
{
    rw::readChunkHeaderInfo(stream, chunkHeaderInfo);
    return stream;
}

enum RwFogType
{
    rwFOGTYPENAFOGTYPE,
    rwFOGTYPELINEAR,
    rwFOGTYPEEXPONENTIAL,
    rwFOGTYPEEXPONENTIAL2,
    rwFOGTYPEFORCEENUMSIZEINT = RWFORCEENUMSIZEINT
};

// ---------------------- RwV3d --------------------------

inline RwReal _rwSqrt(const RwReal num)
{
    return sqrtf(num);
}
inline RwReal _rwInvSqrt(const RwReal num)
{
    return 1.0f / sqrtf(num);
}

inline RwReal RwV3dNormalize(RwV3d* out, const RwV3d* in)
{
    RwReal len = rw::length(*in);
    *out = scale(*in, 1.0f / len);
    return len;
}

inline RwReal RwV3dLength(const RwV3d* in)
{
    return rw::length(*in);
}

inline void RwV3dAssign(RwV3d* out, const RwV3d* ina)
{
    *out = *ina;
}
inline void RwV3dAdd(RwV3d* out, const RwV3d* ina, const RwV3d* inb)
{
    *out = rw::add(*ina, *inb);
}
inline void RwV3dSub(RwV3d* out, const RwV3d* ina, const RwV3d* inb)
{
    *out = rw::sub(*ina, *inb);
}
inline void RwV3dScale(RwV3d* out, const RwV3d* in, RwReal scalar)
{
    *out = rw::scale(*in, scalar);
}
inline void RwV3dIncrementScaled(RwV3d* out, const RwV3d* in, RwReal scalar)
{
    *out = rw::add(*out, rw::scale(*in, scalar));
}
inline void RwV3dNegate(RwV3d* out, const RwV3d* in)
{
    *out = rw::neg(*in);
}
inline RwReal RwV3dDotProduct(const RwV3d* ina, const RwV3d* inb)
{
    return rw::dot(*ina, *inb);
}
inline void RwV3dCrossProduct(RwV3d* out, const RwV3d* ina, const RwV3d* inb)
{
    *out = rw::cross(*ina, *inb);
}

inline RwV3d* RwV3dTransformPoints(RwV3d* pointsOut, const RwV3d* pointsIn, RwInt32 numPoints,
                                   const RwMatrix* matrix)
{
    rw::V3d::transformPoints(pointsOut, pointsIn, numPoints, matrix);
    return pointsOut;
}

// -------------------- RwMatrix ------------------------

typedef rw::Matrix::Type RwMatrixType;

constexpr RwMatrixType rwMATRIXTYPENORMAL = rw::Matrix::TYPENORMAL;
constexpr RwMatrixType rwMATRIXTYPEORTHOGONAL = rw::Matrix::TYPEORTHOGONAL;
constexpr RwMatrixType rwMATRIXTYPEORTHONORMAL = rw::Matrix::TYPEORTHONORMAL;
constexpr RwMatrixType rwMATRIXTYPEMASK = rw::Matrix::TYPEMASK;

inline void RwMatrixCopy(RwMatrix* dst, RwMatrix* src)
{
    *dst = *src;
}

inline void RwMatrixUpdate(RwMatrix* matrix)
{
    matrix->update();
}

inline void RwMatrixSetIdentity(RwMatrix* matrix)
{
    matrix->setIdentity();
}

inline void RwMatrixInvert(RwMatrix* out, RwMatrix* in)
{
    rw::Matrix::invert(out, in);
}

inline RwMatrix* RwMatrixScale(RwMatrix* matrix, const RwV3d* scale, RwOpCombineType combineOp)
{
    return matrix->scale(scale);
}

inline RwMatrix *RwMatrixTranslate(RwMatrix * matrix, const RwV3d * translation, RwOpCombineType combineOp)
{
    matrix->translate(translation, combineOp);
    return matrix;
}

inline RwV3d* RwMatrixGetRight(RwMatrix* matrix)
{
    return &matrix->right;
}
inline RwV3d* RwMatrixGetUp(RwMatrix* matrix)
{
    return &matrix->up;
}
inline RwV3d* RwMatrixGetAt(RwMatrix* matrix)
{
    return &matrix->at;
}
inline RwV3d* RwMatrixGetPos(RwMatrix* matrix)
{
    return &matrix->pos;
}

// --------------- RwError ---------------------------

inline RwError* RwErrorGet(RwError* code)
{
    return rw::getError(code);
}

// --------------- Actual garbage -----------------------

union RwSplitBits
{
    RwReal nReal;
    volatile RwInt32 nInt;
    volatile RwUInt32 nUInt;
};

#endif
