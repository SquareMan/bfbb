#include "rtintsec.h"

#include "collision_support.h"
#include "macros.h"
#include "rw.h"


static RwV3d ClosestPointOnLine(RwV3d& test, RwV3d& a, RwV3d& b)
{
    RwV3d ab = rw::sub(b, a);
    RwV3d at = rw::sub(test, a);

    RwReal t = rw::dot(at, ab) / rw::dot(ab, ab);
    t = CLAMP(t, 0.0f, 1.0f);
    return rw::add(a, rw::scale(ab, t));
}

RwBool RtIntersectionSphereTriangle(RwSphere* sphere, RwV3d* a, RwV3d* b, RwV3d* c, RwV3d* normal,
                                    RwReal* distance)
{
    RwV3d ab = rw::sub(*b, *a);
    RwV3d ac = rw::sub(*c, *a);
    RwV3d bc = rw::sub(*c, *b);

    // 1. Get closest point on triangle's plane from the sphere's center
    RwV3d planeNormal = rw::normalize(rw::cross(ab, ac));

    // if that point is in the triangle we are done
    // Covers the case where the sphere is only intersecting with the face
    RwV3d closestToPlane = rw::sub(
        sphere->center, rw::scale(planeNormal, rw::dot(rw::sub(sphere->center, *a), planeNormal)));
    if (rw::dot(rw::sub(closestToPlane, sphere->center), rw::sub(closestToPlane, sphere->center)) <=
            sphere->radius * sphere->radius &&
        PointInTriangle(closestToPlane, *a, *b, *c))
    {
        *normal = planeNormal;
        *distance = rw::length(rw::sub(closestToPlane, sphere->center));
        return 1;
    }

    // 2. Get closest point on triangle

    RwV3d closestAB = ClosestPointOnLine(sphere->center, *a, *b);
    RwV3d closestAC = ClosestPointOnLine(sphere->center, *a, *c);
    RwV3d closestBC = ClosestPointOnLine(sphere->center, *b, *c);

    RwV3d x = rw::sub(sphere->center, closestAB);
    RwReal dist2AB = std::abs(rw::dot(x, x));
    x = rw::sub(sphere->center, closestAC);
    RwReal dist2AC = std::abs(rw::dot(x, x));
    x = rw::sub(sphere->center, closestBC);
    RwReal dist2BC = std::abs(rw::dot(x, x));

    RwReal min = MIN(MIN(dist2AB, dist2AC), dist2BC);

    RwV3d* closest;
    if (min == dist2AB)
    {
        closest = &closestAB;
    }
    else if (min == dist2AC)
    {
        closest = &closestAC;
    }
    else
    {
        closest = &closestBC;
    }

    // 3. Determine if that point is in the sphere
    RwV3d sc = rw::sub(*closest, sphere->center);
    RwReal d2 = rw::dot(sc, sc);

    if (d2 <= sphere->radius * sphere->radius)
    {
        if (normal != NULL)
        {
            *normal = planeNormal;
        }
        if (distance != NULL)
        {
            // TODO: Verify if this is correct or even used
            // This writes the distance to the sphere center, not surface
            *distance = sqrtf(d2);
        }
        return 1;
    }
    return 0;
}

static bool SatTest(const RwV3d& halfBoxExtent, const RwV3d& axis, const RwV3d& triA,
                    const RwV3d& triB, const RwV3d& triC)
{
    RwReal projA = rw::dot(triA, axis);
    RwReal projB = rw::dot(triB, axis);
    RwReal projC = rw::dot(triC, axis);

    RwV3d faceX = { 1.0f, 0.0f, 0.0f };
    RwV3d faceY = { 0.0f, 1.0f, 0.0f };
    RwV3d faceZ = { 0.0f, 0.0f, 1.0f };
    RwReal r = halfBoxExtent.x * std::abs(rw::dot(faceX, axis)) +
               halfBoxExtent.y * std::abs(rw::dot(faceY, axis)) +
               halfBoxExtent.z * std::abs(rw::dot(faceZ, axis));

    return MAX(-MAX(MAX(projA, projB), projC), MIN(MIN(projA, projB), projC)) > r;
}

RwBool RtIntersectionBBoxTriangle(RwBBox* bbox, RwV3d* v0, RwV3d* v1, RwV3d* v2)
{
    RwV3d center = rw::scale(rw::add(bbox->sup, bbox->inf), 0.5f);
    RwV3d half = rw::sub(bbox->sup, center);

    // put triangle in bbox-space
    RwV3d a = rw::sub(*v0, center);
    RwV3d b = rw::sub(*v1, center);
    RwV3d c = rw::sub(*v2, center);

    // Calculate seperating axes' normals
    RwV3d faceX = { 1.0f, 0.0f, 0.0f };
    RwV3d faceY = { 0.0f, 1.0f, 0.0f };
    RwV3d faceZ = { 0.0f, 0.0f, 1.0f };

    // BBox axes
    if (SatTest(half, faceX, a, b, c))
        return 0;
    if (SatTest(half, faceY, a, b, c))
        return 0;
    if (SatTest(half, faceZ, a, b, c))
        return 0;

    RwV3d ab = rw::sub(b, a);
    RwV3d ac = rw::sub(c, a);

    // Tri normal axis
    if (SatTest(half, rw::cross(ab, ac), a, b, c))
        return 0;

    RwV3d bc = rw::sub(c, b);
    if (SatTest(half, rw::cross(faceX, ab), a, b, c))
        return 0;
    if (SatTest(half, rw::cross(faceX, ac), a, b, c))
        return 0;
    if (SatTest(half, rw::cross(faceX, bc), a, b, c))
        return 0;
    if (SatTest(half, rw::cross(faceY, ab), a, b, c))
        return 0;
    if (SatTest(half, rw::cross(faceY, ac), a, b, c))
        return 0;
    if (SatTest(half, rw::cross(faceY, bc), a, b, c))
        return 0;
    if (SatTest(half, rw::cross(faceZ, ab), a, b, c))
        return 0;
    if (SatTest(half, rw::cross(faceZ, ac), a, b, c))
        return 0;
    if (SatTest(half, rw::cross(faceZ, bc), a, b, c))
        return 0;
    return 1;
}
