#ifndef LIBRWC_RWBASE
#define LIBRWC_RWBASE

#include "rw.h"
#include "rwplcore.h"

typedef rw::Line RwLine;
typedef rw::Triangle RpTriangle;
typedef rw::BBox RwBBox;
typedef rw::Sphere RwSphere;
typedef rw::TexCoords RwTexCoords;
typedef RwUInt16 RwImVertexIndex;
typedef rw::RWDEVICE::Im2DVertex RwIm2DVertex;
typedef rw::RWDEVICE::Im3DVertex RwIm3DVertex;
typedef rw::PrimitiveType RwPrimitiveType;
typedef rw::MeshHeader RpMeshHeader;

typedef rw::ObjPipeline RxPipeline;

typedef rw::Engine RwEngine;

typedef rw::Frame RwFrame;
typedef rw::Camera RwCamera;
typedef rw::Light RpLight;
typedef rw::MorphTarget RpMorphTarget;
typedef rw::FrustumPlane RwFrustumPlane;

typedef rw::Raster RwRaster;
typedef rw::Image RwImage;
typedef rw::TexDictionary RwTexDictionary;
typedef rw::Texture RwTexture;

struct RxRenderStateVector
{
    RwUInt32 Flags;
    RwShadeMode ShadeMode;
    RwBlendFunction SrcBlend;
    RwBlendFunction DestBlend;
    RwRaster* TextureRaster;
    RwTextureAddressMode AddressModeU;
    RwTextureAddressMode AddressModeV;
    RwTextureFilterMode FilterMode;
    RwRGBA BorderColor;
    RwFogType FogType;
    RwRGBA FogColor;
};

inline RxRenderStateVector* RxRenderStateVectorLoadDriverState(RxRenderStateVector* rsvp)
{
    // HACK: Only getting the states that the single callsite in bfbb actually uses
    rsvp->SrcBlend = (RwBlendFunction)rw::GetRenderState(rw::SRCBLEND);
    rsvp->DestBlend = (RwBlendFunction)rw::GetRenderState(rw::DESTBLEND);
    rsvp->ShadeMode = (RwShadeMode)rw::GetRenderState(rw::SHADEMODE);
    rsvp->Flags &= (rw::GetRenderState(rw::ZWRITEENABLE) >> 2);
    rsvp->Flags &= (rw::GetRenderState(rw::VERTEXALPHAENABLE) >> 3);
    return rsvp;
}

// -------------- RwFrame -------------------------

inline void RwFrameSyncDirty()
{
    rw::Frame::syncDirty();
}

inline RwFrame* RwFrameCreate()
{
    return rw::Frame::create();
}
inline RwBool RwFrameDestroy(RwFrame* frame)
{
    frame->destroy();
    return false;
}

inline RwFrame *RwFrameGetRoot(const RwFrame * frame)
{
    return frame->root;
}

inline RwFrame* RwFrameOrthoNormalize(RwFrame* frame)
{
    RwMatrix* m = &frame->modelling;
    m->at = rw::normalize(m->at);
    m->up = rw::normalize(rw::cross(m->at, m->right));
    m->right = rw::cross(m->up, m->at);

    m->update();
    frame->updateObjects();
    return frame;
}

inline RwFrame* RwFrameUpdateObjects(RwFrame* frame)
{
    frame->updateObjects();
    return frame;
}

inline RwMatrix* RwFrameGetMatrix(RwFrame* frame)
{
    return &frame->modelling;
}

inline RwMatrix* RwFrameGetLTM(RwFrame* frame)
{
    return &frame->ltm;
}

inline RwFrame* RwFrameTransform(RwFrame* frame, const RwMatrix* m, RwOpCombineType combine)
{
    frame->transform(m, combine);
    return frame;
}

inline RwFrame* RwFrameTranslate(RwFrame* frame, const RwV3d* v, RwOpCombineType combine)
{
    frame->translate(v, combine);
    return frame;
}

inline RwFrame* RwFrameRotate(RwFrame* frame, const RwV3d* axis, RwReal angle,
                              RwOpCombineType combine)
{
    frame->rotate(axis, angle, combine);
    return frame;
}

typedef RwFrame *(*RwFrameCallBack)(RwFrame *frame, void *data);
inline RwFrame* RwFrameForAllChildren(RwFrame* frame, RwFrameCallBack callBack, void* data)
{
    return frame->forAllChildren(callBack, data);
}

inline RwBool RwFrameDestroyHierarchy(RwFrame * frame)
{
    frame->destroyHierarchy();
    return 1;
}

// -------------- RwCamera -------------------------

inline RwCamera* RwCameraCreate()
{
    return rw::Camera::create();
}

inline RwBool RwCameraDestroy(RwCamera* camera)
{
    camera->destroy();
    return 1;
}

inline void RwCameraSetFrame(RwCamera* camera, RwFrame* frame)
{
    camera->setFrame(frame);
}

inline RwRaster* RwCameraGetRaster(RwCamera* camera)
{
    return camera->frameBuffer;
}
inline void RwCameraSetRaster(RwCamera* camera, RwRaster* raster)
{
    camera->frameBuffer = raster;
}

inline RwRaster* RwCameraGetZRaster(RwCamera* camera)
{
    return camera->zBuffer;
}
inline void RwCameraSetZRaster(RwCamera* camera, RwRaster* raster)
{
    camera->zBuffer = raster;
}

inline RwCamera* RwCameraSetNearClipPlane(RwCamera* camera, RwReal nearClip)
{
    camera->setNearPlane(nearClip);
    return camera;
}
inline RwCamera* RwCameraSetFarClipPlane(RwCamera* camera, RwReal farClip)
{
    camera->setFarPlane(farClip);
    return camera;
}

inline RwReal RwCameraGetNearClipPlane(RwCamera* camera)
{
    return camera->nearPlane;
}

inline RwReal RwCameraGetFarClipPlane(RwCamera* camera)
{
    return camera->farPlane;
}

inline RwMatrix* RwCameraGetViewMatrix(RwCamera* camera)
{
    return &camera->viewMatrix;
}

inline void RwCameraSetFogDistance(RwCamera* camera, RwReal distance)
{
    camera->fogPlane = distance;
}

typedef RwInt32 RwCameraProjection;
constexpr RwInt32 rwPERSPECTIVE = rw::Camera::PERSPECTIVE;
constexpr RwInt32 rwPARALLEL = rw::Camera::PARALLEL;
inline RwCamera* RwCameraSetProjection(RwCamera* camera, RwCameraProjection projection)
{
    camera->setProjection(projection);
    return camera;
}
inline RwCamera* RwCameraSetViewWindow(RwCamera* camera, const RwV2d* viewWindow)
{
    camera->setViewWindow(viewWindow);
    return camera;
}
inline const RwV2d* RwCameraGetViewWindow(const RwCamera* camera)
{
    return &camera->viewWindow;
}

constexpr RwInt32 rwCAMERACLEARIMAGE = rw::Camera::CLEARIMAGE;
constexpr RwInt32 rwCAMERACLEARZ = rw::Camera::CLEARZ;
constexpr RwInt32 rwCAMERACLEARSTENCIL = rw::Camera::CLEARSTENCIL;
inline RwCamera* RwCameraClear(RwCamera* camera, RwRGBA* colour, RwInt32 clearMode)
{
    camera->clear(colour, clearMode);
    return camera;
}
inline RwCamera* RwCameraBeginUpdate(RwCamera* camera)
{
    camera->beginUpdate();
    return camera;
}

inline RwCamera* RwCameraEndUpdate(RwCamera* camera)
{
    camera->endUpdate();
    return camera;
}

inline RwCamera* RwCameraShowRaster(RwCamera* camera, void* pDev, RwUInt32 flags)
{
    camera->showRaster(flags);
    return camera;
}

inline RwCamera* RwCameraGetCurrentCamera()
{
    return rw::engine->currentCamera;
}

inline RwFrame* RwCameraGetFrame(RwCamera* camera)
{
    return camera->getFrame();
}

typedef struct BfbbRpWorld RpWorld;
inline RpWorld* RwCameraGetWorld(const RwCamera* camera)
{
    return reinterpret_cast<RpWorld*>(camera->world);
}

typedef RwInt32 RwFrustumTestResult;
constexpr RwFrustumTestResult rwSPHEREOUTSIDE = rw::Camera::SPHEREOUTSIDE;
constexpr RwFrustumTestResult rwSPHEREBOUNDARY = rw::Camera::SPHEREBOUNDARY;
constexpr RwFrustumTestResult rwSPHEREINSIDE = rw::Camera::SPHEREINSIDE;
inline RwFrustumTestResult RwCameraFrustumTestSphere(const RwCamera* camera, const RwSphere* sphere)
{
    return camera->frustumTestSphere(sphere);
}

// -------------- RwRaster -------------------------

constexpr RwUInt32 rwRASTERTYPENORMAL = rw::Raster::NORMAL;
constexpr RwUInt32 rwRASTERTYPEZBUFFER = rw::Raster::ZBUFFER;
constexpr RwUInt32 rwRASTERTYPECAMERA = rw::Raster::CAMERA;
constexpr RwUInt32 rwRASTERTYPETEXTURE = rw::Raster::TEXTURE;
constexpr RwUInt32 rwRASTERTYPECAMERATEXTURE = rw::Raster::CAMERATEXTURE;
constexpr RwUInt32 rwRASTERTYPEDONTALLOCATE = rw::Raster::DONTALLOCATE;

inline RwRaster* RwRasterCreate(RwInt32 width, RwInt32 height, RwInt32 depth, RwInt32 flags)
{
    return rw::Raster::create(width, height, depth, flags);
}

inline RwBool RwRasterDestroy(RwRaster* raster)
{
    raster->destroy();
    return 1;
}

constexpr RwInt32 rwRASTERLOCKWRITE = rw::Raster::LOCKWRITE;
constexpr RwInt32 rwRASTERLOCKREAD = rw::Raster::LOCKREAD;
constexpr RwInt32 rwRASTERLOCKNOFETCH = rw::Raster::LOCKNOFETCH;
constexpr RwInt32 rwRASTERLOCKRAW = rw::Raster::LOCKRAW;
inline RwUInt8* RwRasterLock(RwRaster* raster, RwUInt8 level, RwInt32 lockMode)
{
    return raster->lock(level, lockMode);
}

inline RwRaster* RwRasterUnlock(RwRaster* raster)
{
    raster->unlock(0);
    return raster;
}

inline RwInt32 RwRasterGetWidth(const RwRaster* raster)
{
    return raster->width;
}
inline RwInt32 RwRasterGetHeight(const RwRaster* raster)
{
    return raster->height;
}

// ------------------ RwImage ---------------------------------

inline RwImage* RwImageCreate(RwInt32 width, RwInt32 height, RwInt32 depth)
{
    return rw::Image::create(width, height, depth);
}

inline RwBool RwImageDestroy(RwImage* image)
{
    image->destroy();
    return 1;
}

inline RwImage* RwImageAllocatePixels(RwImage* image)
{
    image->allocate();
    return image;
}
inline RwImage* RwImageFreePixels(RwImage* image)
{
    image->free();
    return image;
}

inline RwUInt8* RwImageGetPixels(const RwImage* image)
{
    return image->pixels;
}

inline RwImage* RwImageSetFromRaster(RwImage* image, RwRaster* raster)
{
    // Not sure is this is going to work. Take over the user provided image and give them the librw created one
    image->destroy();
    memcpy(image, raster->toImage(), sizeof(RwImage));
    return image;
}

// -------------- RwTexDictionary -------------------------

inline RwTexDictionary* RwTexDictionaryCreate()
{
    return rw::TexDictionary::create();
}
inline RwBool RwTexDictionaryDestroy(RwTexDictionary* dict)
{
    dict->destroy();
    return 1;
}

inline RwTexture* RwTexDictionaryAddTexture(RwTexDictionary* dict, RwTexture* texture)
{
    dict->add(texture);
    return texture;
}
inline RwTexture* RwTexDictionaryRemoveTexture(RwTexture* texture)
{
    texture->dict->remove(texture);
    return texture;
}

inline RwTexDictionary* RwTexDictionaryStreamRead(RwStream* stream)
{
    return rw::TexDictionary::streamRead(stream);
}

typedef RwTexture* (*RwTextureCallBack)(RwTexture* texture, void* pData);
inline const RwTexDictionary* RwTexDictionaryForAllTextures(const RwTexDictionary* dict,
                                                            RwTextureCallBack fpCallBack,
                                                            void* pData)
{
    FORLIST(lnk, (const_cast<RwTexDictionary*>(dict))->textures)
    if (fpCallBack(rw::Texture::fromDict(lnk), pData) == NULL)
        break;
    return dict;
}

// -------------- RwTexture -------------------------

inline RwTexture* RwTextureCreate(RwRaster* raster)
{
    return rw::Texture::create(raster);
}

inline RwBool RwTextureDestroy(RwTexture* texture)
{
    texture->destroy();
    return 1;
}

inline void RwTextureAddRef(RwTexture* texture)
{
    texture->addRef();
}

inline RwRaster* RwTextureGetRaster(RwTexture* tex)
{
    return tex->raster;
}

inline void RwTextureSetFilterMode(RwTexture* texture, RwTextureFilterMode mode)
{
    texture->setFilter(mode);
}

// ------------------------ RxPipeline --------------------------

inline RxPipeline* RxPipelineCreate(void)
{
    return rw::ObjPipeline::create();
}

inline void RxPipelineDestroy(RxPipeline* Pipeline)
{
    Pipeline->destroy();
}

// ------------------- RwIm3D --------------------------------

constexpr rw::PrimitiveType rwPRIMTYPENONE = rw::PRIMTYPENONE;
constexpr rw::PrimitiveType rwPRIMTYPELINELIST = rw::PRIMTYPELINELIST;
constexpr rw::PrimitiveType rwPRIMTYPEPOLYLINE = rw::PRIMTYPEPOLYLINE;
constexpr rw::PrimitiveType rwPRIMTYPETRILIST = rw::PRIMTYPETRILIST;
constexpr rw::PrimitiveType rwPRIMTYPETRISTRIP = rw::PRIMTYPETRISTRIP;
constexpr rw::PrimitiveType rwPRIMTYPETRIFAN = rw::PRIMTYPETRIFAN;
constexpr rw::PrimitiveType rwPRIMTYPEPOINTLIST = rw::PRIMTYPEPOINTLIST;

constexpr RwInt32 rwIM3D_VERTEXUV = rw::im3d::VERTEXUV;
constexpr RwInt32 rwIM3D_ALLOPAQUE = rw::im3d::ALLOPAQUE;
constexpr RwInt32 rwIM3D_NOCLIP = rw::im3d::NOCLIP;
constexpr RwInt32 rwIM3D_VERTEXXYZ = rw::im3d::VERTEXXYZ;
constexpr RwInt32 rwIM3D_VERTEXRGBA = rw::im3d::VERTEXRGBA;
constexpr RwInt32 rwIM3D_LIGHTING = rw::im3d::LIGHTING;
constexpr RwInt32 rwIM3D_EVERYTHING = rw::im3d::EVERYTHING;

inline void* RwIm3DTransform(RwIm3DVertex* pVerts, RwUInt32 numVerts, RwMatrix* ltm, RwUInt32 flags)
{
    rw::im3d::Transform(pVerts, numVerts, ltm, flags);
    return pVerts;
}

inline RwBool RwIm3DRenderPrimitive(RwPrimitiveType primType)
{
    rw::im3d::RenderPrimitive(primType);
    return 1;
}

inline RwBool RwIm3DRenderIndexedPrimitive(RwPrimitiveType primType, RwImVertexIndex* indices,
                                           RwInt32 numIndices)
{
    rw::im3d::RenderIndexedPrimitive(primType, indices, numIndices);
    return 1;
}

inline RwBool RwIm3DEnd()
{
    rw::im3d::End();
    return 1;
}

inline void RwIm3DVertexSetPos(RwIm3DVertex* vert, RwReal x, RwReal y, RwReal z)
{
    vert->setX(x);
    vert->setX(y);
    vert->setX(z);
}

inline void RwIm3DVertexSetNormal(RwIm3DVertex* vert, RwReal x, RwReal y, RwReal z)
{
    vert->setNormalX(x);
    vert->setNormalY(y);
    vert->setNormalZ(z);
}

inline void RwIm3DVertexSetRGBA(RwIm3DVertex* vert, RwUInt8 r, RwUInt8 g, RwUInt8 b, RwUInt8 a)
{
    vert->setColor(r, g, b, a);
}

inline void RwIm3DVertexSetUV(RwIm3DVertex* vert, RwReal u, RwReal v)
{
    vert->setU(u);
    vert->setV(v);
}

// ------------------- RwIm2D --------------------------------

inline RwBool RwIm2DRenderPrimitive(RwPrimitiveType primType, RwIm2DVertex* vertices,
                                    RwInt32 numVertices)
{
    rw::im2d::RenderPrimitive(primType, vertices, numVertices);
    return 1;
}

inline RwBool RwIm2DRenderIndexedPrimitive(RwPrimitiveType primType, RwIm2DVertex* vertices,
                                           RwInt32 numVertices, RwImVertexIndex* indices,
                                           RwInt32 numIndices)
{
    rw::im2d::RenderIndexedPrimitive(primType, vertices, numVertices, indices, numIndices);
    return 1;
}

inline RwReal RwIm2DGetNearScreenZ()
{
    return rw::im2d::GetNearZ();
}

inline RwReal RwIm2DGetFarScreenZ()
{
    return rw::im2d::GetFarZ();
}

inline void RwIm2DVertexSetPos(RwIm2DVertex* vert, RwReal x, RwReal y, RwReal z)
{
    vert->setScreenX(x);
    vert->setScreenY(y);
    vert->setScreenZ(z);
}

inline void RwIm2DVertexSetRGBA(RwIm2DVertex* vert, RwUInt8 r, RwUInt8 g, RwUInt8 b, RwUInt8 a)
{
    vert->setColor(r, g, b, a);
}

inline void RwIm2DVertexSetRealRGBA(RwIm2DVertex* vert, RwReal r, RwReal g, RwReal b, RwReal a)
{
    vert->setColor((RwUInt8)r, (RwUInt8)g, (RwUInt8)b, (RwUInt8)a);
}

inline void RwIm2DVertexSetUV(RwIm2DVertex* vert, RwReal u, RwReal v)
{
    vert->setU(u, 0.0f);
    vert->setV(v, 0.0f);
}

inline void RwIm2DVertexSetScreenX(RwIm2DVertex* vert, RwReal x)
{
    vert->setScreenX(x);
}
inline void RwIm2DVertexSetScreenY(RwIm2DVertex* vert, RwReal y)
{
    vert->setScreenY(y);
}
inline void RwIm2DVertexSetScreenZ(RwIm2DVertex* vert, RwReal z)
{
    vert->setScreenZ(z);
}
inline void RwIm2DVertexSetU(RwIm2DVertex* vert, RwReal u, RwReal recipz)
{
    vert->setU(u, recipz);
}
inline void RwIm2DVertexSetV(RwIm2DVertex* vert, RwReal v, RwReal recipz)
{
    vert->setV(v, recipz);
}
inline void RwIm2DVertexSetIntRGBA(RwIm2DVertex* vert, RwUInt8 r, RwUInt8 g, RwUInt8 b, RwUInt8 a)
{
    vert->setColor(r, g, b, a);
}

inline void RwIm2DVertexSetRecipCameraZ(RwIm2DVertex* vert, RwReal recipz)
{
    vert->setRecipCameraZ(recipz);
}

#endif
