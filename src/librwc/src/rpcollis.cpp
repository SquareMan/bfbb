#include "rpcollis.h"

#include "rtintsec.h"
#include "rw.h"
#include "rwcore.h"
#include "rwplcore.h"

RpAtomic* RpAtomicForAllIntersections(RpAtomic* atomic, RpIntersection* intersection,
                                      RpIntersectionCallBackGeometryTriangle callBack, void* data)
{
    RpGeometry* geo = atomic->geometry;
    RpMorphTarget* morph = atomic->geometry->morphTarget;

    RwMatrix inverse;
    RwMatrixInvert(&inverse, &atomic->getFrame()->modelling);

    switch (intersection->type)
    {
    case rpINTERSECTPOINT: {
        RwV3d modelSpacePoint = intersection->t.point;
        RwV3dTransformPoints(&modelSpacePoint, &modelSpacePoint, 2, &inverse);

        for (int i = 0; i < geo->numTriangles; i++)
        {
            RpTriangle* tri = &geo->triangles[i];
        }
        // TODO:
        break;        
    }
    case rpINTERSECTLINE: {
        RwLine modelSpaceLine = intersection->t.line;
        RwV3dTransformPoints(&modelSpaceLine.start, &modelSpaceLine.end, 2, &inverse);

        for (int i = 0; i < geo->numTriangles; i++)
        {
            RpTriangle* tri = &geo->triangles[i];
        }
        // TODO:
        break;
    }
    case rpINTERSECTBOX:
    {
        RwBBox modelSpaceBBox = intersection->t.box;
        RwV3dTransformPoints(&modelSpaceBBox.sup, &modelSpaceBBox.sup, 2, &inverse);

        for (int i = 0; i < geo->numTriangles; i++)
        {
            RpTriangle* tri = &geo->triangles[i];
            if (RtIntersectionBBoxTriangle(&modelSpaceBBox, &morph->verts[tri->vertIndex[0]],
                                           &morph->verts[tri->vertIndex[1]],
                                           &morph->verts[tri->vertIndex[2]]))
            {
                RpCollisionTriangle coll;
                coll.index = i;
                coll.point = morph->verts[tri->vertIndex[0]];
                coll.vertices[0] = &morph->verts[tri->vertIndex[0]];
                coll.vertices[1] = &morph->verts[tri->vertIndex[1]];
                coll.vertices[2] = &morph->verts[tri->vertIndex[2]];
                coll.normal =
                    rw::normalize(rw::cross(rw::sub(*coll.vertices[1], *coll.vertices[0]),
                                            rw::sub(*coll.vertices[2], *coll.vertices[0])));
                if (callBack(intersection, &coll, 0.0f, data) == NULL) 
                {
                    return atomic;
                }
            }
        }

        break;
    }
    case rpINTERSECTSPHERE:
    {
        RwSphere modelSpaceSphere = intersection->t.sphere;
        RwV3dTransformPoints(&modelSpaceSphere.center, &modelSpaceSphere.center, 1, &inverse);

        for (int i = 0; i < geo->numTriangles; i++)
        {
            RpTriangle* tri = &geo->triangles[i];
            RwV3d normal;
            RwReal distance;
            if (RtIntersectionSphereTriangle(&modelSpaceSphere, &morph->verts[tri->vertIndex[0]],
                                             &morph->verts[tri->vertIndex[1]],
                                             &morph->verts[tri->vertIndex[2]], &normal, &distance))
            {
                RpCollisionTriangle coll;
                coll.index = i;
                coll.normal = normal;
                coll.point = morph->verts[tri->vertIndex[0]];
                coll.vertices[0] = &morph->verts[tri->vertIndex[0]];
                coll.vertices[1] = &morph->verts[tri->vertIndex[1]];
                coll.vertices[2] = &morph->verts[tri->vertIndex[2]];

                if (callBack(intersection, &coll, distance, data) == NULL)
                {
                    return atomic;
                }
            }
        }
        break;
    }
    }
    return atomic;
}

RpWorld* RpCollisionWorldForAllIntersections(RpWorld* world, RpIntersection* intersection,
                                             RpIntersectionCallBackWorldTriangle callBack,
                                             void* data)
{
    return NULL;
}
