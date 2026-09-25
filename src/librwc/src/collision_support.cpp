#include "collision_support.h"

#include <cmath>

bool PointInTriangle(const RwV3d& test, const RwV3d& a, const RwV3d& b, const RwV3d& c)
{
    RwV3d ab = rw::normalize(rw::sub(b, a));
    RwV3d ac = rw::normalize(rw::sub(c, a));

    RwV3d ba = rw::neg(ab);
    RwV3d bc = rw::normalize(rw::sub(c, b));

    RwV3d ca = rw::neg(ac);
    RwV3d cb = rw::neg(bc);

    if (rw::dot(ab, ac) > rw::dot(ab, rw::normalize(rw::sub(test, a))))
        return false;
    if (rw::dot(ba, bc) > rw::dot(ba, rw::normalize(rw::sub(test, b))))
        return false;
    if (rw::dot(ca, cb) > rw::dot(ca, rw::normalize(rw::sub(test, c))))
        return false;
    return true;
}

RwBool IntersectionLineTriangle(const RwLine& line, const RwV3d& a, const RwV3d& b, const RwV3d& c, RwReal& outT)
{
    RwV3d planeNormal = rw::normalize(rw::cross(rw::sub(b, a), rw::sub(c, a)));
    RwReal planeDist = rw::dot(planeNormal, a);
    
    // Ray cast against tri plane
    RwV3d rayLine = rw::sub(line.end, line.start);
    RwV3d rayDir = rw::normalize(rayLine);
    RwReal cos = rw::dot(rayDir, planeNormal);
    if(cos == 0)
    {
        // Ray is parallell to plane
        return 0;
    }

    RwReal t = (planeDist - rw::dot(line.start, planeNormal)) / cos;
    RwReal lineDist2 = rw::dot(rayLine, rayLine);
    if (t < 0.0f || t*t > lineDist2)
    {
        return 0;
    }

    RwV3d intersection = rw::add(line.start, rw::scale(rayDir, t));
    // Test if intersection with plane is in triangle
    if(PointInTriangle(intersection, a, b, c))
    {
        outT = t / std::sqrt(lineDist2);
        return 1;
    }
    return 0;
}
