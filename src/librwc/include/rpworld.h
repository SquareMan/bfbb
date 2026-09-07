#ifndef LIBRWC_RPWORLD
#define LIBRWC_RPWORLD

#include "rw.h"
#include "rwcore.h"
#include "rwplcore.h"

typedef rw::Material RpMaterial;
typedef rw::MaterialList RpMaterialList;
typedef rw::Triangle RpTriangle;
// typedef rw::BuildMeshTriangle RpBuildMeshTriangle;
// typedef rw::BuildMesh RpBuildMesh;
typedef rw::Mesh RpMesh;
typedef rw::MeshHeader RpMeshHeader;
typedef rw::MorphTarget RpMorphTarget;
typedef rw::Geometry RpGeometry;
typedef rw::Clump RpClump;
// typedef rw::Interpolator RpInterpolator;
typedef rw::Atomic RpAtomic;
typedef rw::Atomic::RenderCB RpAtomicCallBackRender;
// typedef rw::VertexNormal RpVertexNormal;
// typedef rw::Polygon RpPolygon;
// typedef rw::WorldSector RpWorldSector;
// typedef rw::Sector RpSector;
typedef struct BfbbRpWorld RpWorld;
typedef rw::Light RpLight;

// TODO: these types are not in librw
typedef void RpVertexNormal;
typedef void RwResEntry;
struct RpPolygon
{
    RwUInt16 matIndex;
    RwUInt16 vertIndex[3];
};

struct RpWorldSector
{
    RwInt32 type;
    RpPolygon* polygons;
    RwV3d* vertices;
    RpVertexNormal* normals;
    RwTexCoords* texCoords[8];
    RwRGBA* preLitLum;
    RwResEntry* repEntry;
    RwLinkList collAtomicsInWorldSector;
    RwLinkList noCollAtomicsInWorldSector;
    RwLinkList lightsInWorldSector;
    RwBBox boundingBox;
    RwBBox tightBoundingBox;
    RpMeshHeader* mesh;
    RxPipeline* pipeline;
    RwUInt16 matListWindowBase;
    RwUInt16 numVertices;
    RwUInt16 numPolygons;
    RwUInt16 pad;
};

struct RpSector
{
    RwInt32 type;
};

//TODO
typedef void* RpWorldRenderOrder;

typedef RpWorldSector* (*RpWorldSectorCallBack)(RpWorldSector* worldSector, void* data);
typedef RpWorldSector* (*RpWorldSectorCallBackRender)(RpWorldSector* worldSector);
struct BfbbRpWorldExt
{
    RwUInt32 flags;
    RpWorldRenderOrder renderOrder;
    RpMaterialList matList;
    RpSector* rootSector;
    RwInt32 numTexCoordSets;
    RwInt32 numClumpsInWorld;
    RwLLLink* currentClumpLink;
    RwV3d worldOrigin;
    RwBBox boundingBox;
    RpWorldSectorCallBackRender renderCallBack;
    RxPipeline* pipeline;
};
struct BfbbRpWorld : rw::World, BfbbRpWorldExt
{
};

inline RpWorld* RpWorldCreate(RwBBox* boundingBox)
{
    // Note: RpWorld is actually our BfbbRpWorld
    return reinterpret_cast<RpWorld*>(rw::World::create(boundingBox));
}
inline RwBool RpWorldDestroy(RpWorld* world)
{
    world->destroy();
    return 1;
}

inline RpWorld* RpWorldRender(RpWorld* world)
{
    world->render();
    return world;
}

inline RpWorld* RpWorldAddCamera(RpWorld* world, RwCamera* camera)
{
    world->addCamera(camera);
    return world;
}
inline RpWorld* RpWorldRemoveCamera(RpWorld* world, RwCamera* camera)
{
    world->removeCamera(camera);
    return world;
}

inline RpWorld* RpWorldAddLight(RpWorld* world, RpLight* light)
{
    world->addLight(light);
    return world;
}

inline RpWorld* RpWorldRemoveLight(RpWorld* world, RpLight* light)
{
    world->removeLight(light);
    return world;
}

inline RwInt32 RpWorldGetNumMaterials(RpWorld* world)
{
    return world->matList.numMaterials;
}

inline RpMaterial* RpWorldGetMaterial(RpWorld* world, RwInt32 num)
{
    return world->matList.materials[num];
}

inline RpWorld* RpWorldStreamRead(RwStream* stream)
{
    // TODO: This needs to be implemented in librw.
    // IN BFBB this is only used for BSB_Read
    return NULL;
}

// -------------- RpMaterial --------------------------

typedef RpMaterial* (*RpMaterialCallBack)(RpMaterial* material, void* data);

inline RpMaterial* RpMaterialSetTexture(RpMaterial* material, RwTexture* texture)
{
    material->setTexture(texture);
    return material;
}
inline RwTexture* RpMaterialGetTexture(const RpMaterial* material)
{
    return material->texture;
}

inline RpMaterial* RpMaterialSetColor(RpMaterial* material, const RwRGBA* color)
{
    material->color = *color;
    return material;
}

inline const RwRGBA* RpMaterialGetColor(const RpMaterial* material)
{
    return &material->color;
}

inline RpGeometry* RpGeometryForAllMaterials(RpGeometry* geometry, RpMaterialCallBack fpCallBack,
                                             void* pData)
{
    for (int32_t i; i < geometry->matList.numMaterials; i++)
    {
        if (fpCallBack(geometry->matList.materials[i], pData) == NULL)
        {
            break;
        }
    }
    return geometry;
}

// ------------------- RpMaterialList --------------------------

inline RpMaterial* RpMaterialListGetMaterial(const RpMaterialList* matList, RwInt32 matIndex)
{
    return matList->materials[matIndex];
}

// ----------------- RpAtomic ---------------------------------

constexpr RwUInt32 rpATOMICCOLLISIONTEST = rw::Atomic::COLLISIONTEST;
constexpr RwUInt32 rpATOMICRENDER = rw::Atomic::RENDER;
constexpr RwUInt32 rpATOMICWORLDBOUNDDIRTY = rw::Atomic::WORLDBOUNDDIRTY;
constexpr RwUInt32 rpATOMICSAMEBOUNDINGSPHERE = rw::Atomic::SAMEBOUNDINGSPHERE;

inline RwBool RpAtomicDestroy(RpAtomic* atomic)
{
    atomic->destroy();
    return 1;
}

inline RwBool RpAtomicInstance(RpAtomic* atomic)
{
    atomic->instance();
    return 1;
}

inline void RpAtomicRender(RpAtomic* atomic)
{
    atomic->render();
}

inline RwUInt32 RpAtomicGetFlags(const RpAtomic* atomic)
{
    return atomic->getFlags();
}

inline void RpAtomicSetPipeline(RpAtomic* atomic, RxPipeline* pipeline)
{
    atomic->pipeline = pipeline;
}

inline RpGeometry* RpAtomicGetGeometry(const RpAtomic* atomic)
{
    return atomic->geometry;
}

inline RpAtomic* RpAtomicSetGeometry(RpAtomic* atomic, RpGeometry* geometry, RwUInt32 flags)
{
    atomic->setGeometry(geometry, flags);
    return atomic;
}

inline void RpAtomicSetRenderCallBack(RpAtomic* atomic, RpAtomicCallBackRender callback)
{
    atomic->setRenderCB(callback);
}

inline RpAtomicCallBackRender RpAtomicGetRenderCallBack(RpAtomic* atomic)
{
    return atomic->renderCallBack;
}

inline RpAtomic* RpAtomicSetFrame(RpAtomic* atomic, RwFrame* frame)
{
    atomic->setFrame(frame);
    return atomic;
}
inline RwFrame* RpAtomicGetFrame(RpAtomic* atomic)
{
    return atomic->getFrame();
}

inline RpClump* RpAtomicGetClump(RpAtomic* atomic)
{
    return atomic->clump;
}

inline RwSphere* RpAtomicGetBoundingSphere(RpAtomic* atomic)
{
    return &atomic->boundingSphere;
}

inline RpAtomic* AtomicDefaultRenderCallBack(RpAtomic* atomic)
{
    return rw::Atomic::defaultRenderCB(atomic);
}

inline RpAtomic* RpAtomicStreamWrite(RpAtomic* atomic, RwStream* stream)
{
    assert(false && "TODO");
    return NULL;
}

inline RpAtomic* RpAtomicStreamRead(RwStream* stream)
{
    assert(false && "TODO");
    return NULL;
}

typedef rw::Geometry::Flags RpGeometryFlag;
constexpr RpGeometryFlag rpGEOMETRYTRISTRIP = rw::Geometry::TRISTRIP;
constexpr RpGeometryFlag rpGEOMETRYPOSITIONS = rw::Geometry::POSITIONS;
constexpr RpGeometryFlag rpGEOMETRYTEXTURED = rw::Geometry::TEXTURED;
constexpr RpGeometryFlag rpGEOMETRYPRELIT = rw::Geometry::PRELIT;
constexpr RpGeometryFlag rpGEOMETRYNORMALS = rw::Geometry::NORMALS;
constexpr RpGeometryFlag rpGEOMETRYLIGHT = rw::Geometry::LIGHT;
constexpr RpGeometryFlag rpGEOMETRYMODULATEMATERIALCOLOR = rw::Geometry::MODULATE;
constexpr RpGeometryFlag rpGEOMETRYTEXTURED2 = rw::Geometry::TEXTURED2;
constexpr RpGeometryFlag rpGEOMETRYNATIVE = rw::Geometry::NATIVE;
constexpr RpGeometryFlag rpGEOMETRYNATIVEINSTANCE = rw::Geometry::NATIVEINSTANCE;

constexpr rw::Geometry::LockFlags rpGEOMETRYLOCKPOLYGONS = rw::Geometry::LockFlags::LOCKPOLYGONS;
constexpr rw::Geometry::LockFlags rpGEOMETRYLOCKVERTICES = rw::Geometry::LockFlags::LOCKVERTICES;
constexpr rw::Geometry::LockFlags rpGEOMETRYLOCKNORMALS = rw::Geometry::LockFlags::LOCKNORMALS;
constexpr rw::Geometry::LockFlags rpGEOMETRYLOCKPRELIGHT = rw::Geometry::LockFlags::LOCKPRELIGHT;
constexpr rw::Geometry::LockFlags rpGEOMETRYLOCKTEXCOORDS = rw::Geometry::LockFlags::LOCKTEXCOORDS;
constexpr rw::Geometry::LockFlags rpGEOMETRYLOCKTEXCOORDS1 = rw::Geometry::LockFlags::LOCKTEXCOORDS;
constexpr rw::Geometry::LockFlags rpGEOMETRYLOCKTEXCOORDS2 = rw::Geometry::LockFlags::LOCKTEXCOORDS;
constexpr rw::Geometry::LockFlags rpGEOMETRYLOCKTEXCOORDS3 = rw::Geometry::LockFlags::LOCKTEXCOORDS;
constexpr rw::Geometry::LockFlags rpGEOMETRYLOCKTEXCOORDS4 = rw::Geometry::LockFlags::LOCKTEXCOORDS;
constexpr rw::Geometry::LockFlags rpGEOMETRYLOCKTEXCOORDS5 = rw::Geometry::LockFlags::LOCKTEXCOORDS;
constexpr rw::Geometry::LockFlags rpGEOMETRYLOCKTEXCOORDS6 = rw::Geometry::LockFlags::LOCKTEXCOORDS;
constexpr rw::Geometry::LockFlags rpGEOMETRYLOCKTEXCOORDS7 = rw::Geometry::LockFlags::LOCKTEXCOORDS;
constexpr rw::Geometry::LockFlags rpGEOMETRYLOCKTEXCOORDS8 = rw::Geometry::LockFlags::LOCKTEXCOORDS;
constexpr rw::Geometry::LockFlags rpGEOMETRYLOCKTEXCOORDSALL =
    rw::Geometry::LockFlags::LOCKTEXCOORDSALL;
constexpr rw::Geometry::LockFlags rpGEOMETRYLOCKALL = rw::Geometry::LockFlags::LOCKALL;
inline RpGeometry* RpGeometryCreate(RwInt32 numVert, RwInt32 numTriangles, RwUInt32 format)
{
    return rw::Geometry::create(numVert, numTriangles, format);
}
inline RpGeometry* RpGeometryLock(RpGeometry* geom, RwUInt32 lockFlags)
{
    geom->lock(lockFlags);
    return geom;
}
inline void RpGeometryUnlock(RpGeometry* geom)
{
    geom->unlock();
}

inline const RpGeometry* RpGeometryTriangleSetVertexIndices(const RpGeometry* geometry,
                                                            RpTriangle* triangle, RwUInt16 vert1,
                                                            RwUInt16 vert2, RwUInt16 vert3)
{
    triangle->vertIndex[0] = vert1;
    triangle->vertIndex[1] = vert2;
    triangle->vertIndex[2] = vert3;
    return geometry;
}

inline const RpGeometry* RpGeometryTriangleGetVertexIndices(const RpGeometry* geometry,
                                                            const RpTriangle* triangle,
                                                            RwUInt16* vert1, RwUInt16* vert2,
                                                            RwUInt16* vert3)
{
    if (vert1 != NULL)
    {
        *vert1 = triangle->vertIndex[0];
    }
    if (vert2 != NULL)
    {
        *vert2 = triangle->vertIndex[1];
    }
    if (vert3 != NULL)
    {
        *vert3 = triangle->vertIndex[2];
    }
    return geometry;
}

inline RpGeometry* RpGeometryTriangleSetMaterial(RpGeometry* geometry, RpTriangle* triangle,
                                                 RpMaterial* material)
{
    RwUInt16 id = triangle->matId;
    if (id == 0xFFFF)
    {
        return NULL;
    }
    geometry->matList.materials[id] = material;
    return geometry;
}

inline RpMaterial* RpGeometryTriangleGetMaterial(const RpGeometry* geometry,
                                                 const RpTriangle* triangle)
{
    RwUInt16 id = triangle->matId;
    if (id == 0xFFFF)
    {
        return NULL;
    }
    return geometry->matList.materials[id];
}

inline RpMorphTarget* RpGeometryGetMorphTarget(RpGeometry* geometry, RwInt32 index)
{
    return &geometry->morphTarget[index];
}

inline RpTriangle* RpGeometryGetTriangles(RpGeometry* geometry)
{
    return geometry->triangles;
}

inline RwInt32 RpGeometryGetNumVertices(const RpGeometry* geometry)
{
    return geometry->numVertices;
}

// ------------- RpMorphTarget --------------------------

inline const RpMorphTarget* RpMorphTargetCalcBoundingSphere(const RpMorphTarget* morphTarget,
                                                            RwSphere* boundingSphere)
{
    *boundingSphere = morphTarget->calculateBoundingSphere();
    return morphTarget;
}

inline RwV3d* RpMorphTargetGetVertices(const RpMorphTarget* morphTarget)
{
    return morphTarget->verts;
}

inline RwV3d* RpMorphTargetGetVertexNormals(const RpMorphTarget* morphTarget)
{
    return morphTarget->normals;
}

// -------------------- RpLight ---------------------------

inline RwBool RpLightDestroy(RpLight* light)
{
    light->destroy();
    return 1;
}

constexpr RwUInt32 rpLIGHTDIRECTIONAL = rw::Light::DIRECTIONAL;
constexpr RwUInt32 rpLIGHTAMBIENT = rw::Light::AMBIENT;
constexpr RwUInt32 rpLIGHTPOINT = rw::Light::POINT;
constexpr RwUInt32 rpLIGHTSPOT = rw::Light::SPOT;
constexpr RwUInt32 rpLIGHTSPOTSOFT = rw::Light::SOFTSPOT;
inline RpLight* RpLightCreate(RwInt32 type)
{
    return rw::Light::create(type);
}

constexpr RwUInt32 rpLIGHTLIGHTATOMICS = rw::Light::Flags::LIGHTATOMICS;
constexpr RwUInt32 rpLIGHTLIGHTWORLD = rw::Light::Flags::LIGHTWORLD;
inline void RpLightSetFlags(RpLight* light, RwUInt32 flags)
{
    light->setFlags(flags);
}

inline void RpLightSetFrame(RpLight* light, RwFrame* frame)
{
    light->setFrame(frame);
}

inline RwFrame* RpLightGetFrame(RpLight* light)
{
    return light->getFrame();
}

inline RpLight* RpLightSetRadius(RpLight* light, RwReal radius)
{
    light->radius = radius;
    return light;
}

inline RpLight* RpLightSetColor(RpLight* light, const RwRGBAReal* color)
{
    light->setColor(color->red, color->green, color->blue);
    return light;
}

inline RpLight* RpLightSetConeAngle(RpLight* light, RwReal angle)
{
    light->setAngle(angle);
    return light;
}

// -------------------- RpClump -------------------------

inline RpClump* RpClumpStreamRead(RwStream* stream)
{
    return rw::Clump::streamRead(stream);
}

inline RwBool RpClumpDestroy(RpClump* clump)
{
    clump->destroy();
    return 1;
}

inline RwInt32 RpClumpGetNumAtomics(RpClump* clump)
{
    return clump->countAtomics();
}

inline RpClump* RpClumpAddAtomic(RpClump* clump, RpAtomic* atomic)
{
    clump->addAtomic(atomic);
    return clump;
}

inline RwFrame* RpClumpGetFrame(RpClump* clump)
{
    return clump->getFrame();
}

inline RpClump* RpClumpRemoveAtomic(RpClump* clump, RpAtomic* atomic)
{
    clump->removeAtomic(atomic);
    return clump;
}

typedef RpAtomic* (*RpAtomicCallBack)(RpAtomic* atomic, void* data);
inline RpClump* RpClumpForAllAtomics(RpClump* clump, RpAtomicCallBack callback, void* pData)
{
    FORLIST(lnk, clump->atomicList)
    if (callback(rw::Atomic::fromClump(lnk), pData) == NULL)
        break;
    return clump;
}

// -------------------- RpMesh ---------------------------------------------

typedef RpMesh* (*RpMeshCallBack)(RpMesh* mesh, RpMeshHeader* meshHeader, void* pData);

// ------------------- RpMeshHeader ------------------------------------

inline RpMeshHeader* RpMeshHeaderForAllMeshes(RpMeshHeader* meshHeader, RpMeshCallBack fpCallBack,
                                              void* pData)
{
    RpMesh* meshes = meshHeader->getMeshes();
    for (RwInt32 i = 0; i < meshHeader->numMeshes; i++)
    {
        if (fpCallBack(&meshes[i], meshHeader, pData) == NULL)
        {
            break;
        }
    }
    return meshHeader;
}
#endif
