#include "rtintsec.h"

#include <cassert>
#include <cstdio>

#define FAIL_IMPL(_file, _line, _msg)                                                              \
    {                                                                                              \
        printf("%s:%d Check Failed: %s\n", (_file), (_line), (_msg));                              \
        exit(1);                                                                                   \
    }

#define EXPECT(_cond, _msg)                                                                        \
    if (!(_cond))                                                                                  \
    FAIL_IMPL(__FILE__, __LINE__, _msg)

#define EXPECT_FALSE(_cond, _msg) EXPECT(!(_cond), (_msg))

static void test_sphere_triangle()
{
    RwSphere sphere = { { 0.2f, 0.4f, -0.6f }, 10.0f };
    RwV3d a = { 1.0f, 0.0f, 0.0f };
    RwV3d b = { -1.0f, 0.0f, 0.0f };
    RwV3d c = { 0.0f, 0.0f, 1.0f };

    // obviously overlapping
    RwV3d normal;
    RwReal distance;
    RwBool result = RtIntersectionSphereTriangle(&sphere, &a, &b, &c, &normal, &distance);
    EXPECT(result, "Collision expected");

    // obviously not overlapping
    sphere = { { 100.0f, 50.0f, 25.0f }, 5.0f };
    result = RtIntersectionSphereTriangle(&sphere, &a, &b, &c, &normal, &distance);
    EXPECT_FALSE(result, "No collision expected");

    // Partial Overlap
    sphere = { { 2.0f, 0.0f, 0.0f }, 2.0f };
    result = RtIntersectionSphereTriangle(&sphere, &a, &b, &c, &normal, &distance);
    EXPECT(result, "Collision expected");

    // Touching edge
    sphere = { { 2.0f, 0.0f, 0.0f }, 1.0f };
    result = RtIntersectionSphereTriangle(&sphere, &a, &b, &c, &normal, &distance);
    EXPECT(result, "Collision expected");

    // Barely seperated
    sphere = { { 2.0f, 0.0f, 0.0f }, 0.99f };
    result = RtIntersectionSphereTriangle(&sphere, &a, &b, &c, &normal, &distance);
    EXPECT_FALSE(result, "No collision expected");
    
    // Partially overlapping one edge but no vertices
    sphere = { { 1.0f, 0.0f, 1.0f }, 0.8f };
    result = RtIntersectionSphereTriangle(&sphere, &a, &b, &c, &normal, &distance);
    EXPECT(result, "Collision expected");
    
    // Actual test case from main menu
    sphere = { { 73.6701279f, 1.43989754f, -0.624138832f }, 0.649999976f };
    a = {70.9878998f, 0.958100021f, 0.858099997f};
    b = {75.5416031f, 1.17890000f, -2.78379989f};
    c = {74.2768021f, 1.07589996f, -3.61179996f};
    result = RtIntersectionSphereTriangle(&sphere, &a, &b, &c, &normal, &distance);
    EXPECT(result, "Collision expected");

    // Partially overlapping face but no edges or vertices
    sphere = { { 38.1103821f, 0.461630940f, -1.56791687f }, 0.649999976f };
    a = {39.5175018f, 0.0f, -1.73549998f};
    b = {38.1749001f, 0.0f, -3.07809997f};
    c = {36.2029991f, 0.0f, 0.907599986f};
    result = RtIntersectionSphereTriangle(&sphere, &a, &b, &c, &normal, &distance);
    EXPECT(result, "Collision expected");
     
    // Above triangle's plane
    sphere = { { 38.1103821f, 1.461630940f, -1.56791687f }, 0.649999976f };
    a = {39.5175018f, 0.0f, -1.73549998f};
    b = {38.1749001f, 0.0f, -3.07809997f};
    c = {36.2029991f, 0.0f, 0.907599986f};
    result = RtIntersectionSphereTriangle(&sphere, &a, &b, &c, &normal, &distance);
    EXPECT_FALSE(result, "No collision expected");
}

static void test_sphere_bbox()
{

    RwV3d a = { 1.0f, 0.0f, 0.0f };
    RwV3d b = { -1.0f, 0.0f, 0.0f };
    RwV3d c = { 0.0f, 1.0f, 0.0f };
    
    // box in front
    RwBBox box1 = {{-0.5f, 0.0f, -1.0f}, {0.5f, 2.0f, -0.5f}};
    RwBool result = RtIntersectionBBoxTriangle(&box1, &a, &b, &c);
    EXPECT_FALSE(result, "No Collision expected");

    // box above
    RwBBox box2 = {{-0.5f, 2.0f, -1.0f}, {0.5f, 4.0f, 1.0f}};
    result = RtIntersectionBBoxTriangle(&box2, &a, &b, &c);
    EXPECT_FALSE(result, "No Collision expected");

    // box beside
    RwBBox box3 = {{1.5f, 0.0f, -1.0f}, {2.0f, 2.0f, 1.0f}};
    result = RtIntersectionBBoxTriangle(&box3, &a, &b, &c);
    EXPECT_FALSE(result, "No Collision expected");

    // box clipping edge
    RwBBox box4 = {{0.5f, 0.0f, -1.0f}, {2.0f, 2.0f, 1.0f}};
    result = RtIntersectionBBoxTriangle(&box4, &a, &b, &c);
    EXPECT(result, "Collision expected");
    
    // box touching edge
    RwBBox box5 = {{1.0f, 0.0f, -1.0f}, {2.0f, 2.0f, 1.0f}};
    result = RtIntersectionBBoxTriangle(&box5, &a, &b, &c);
    EXPECT(result, "Collision expected");

    // box barely seperated
    RwBBox box6 = {{1.01f, 0.0f, -1.0f}, {2.0f, 2.0f, 1.0f}};
    result = RtIntersectionBBoxTriangle(&box6, &a, &b, &c);
    EXPECT_FALSE(result, "No collision expected");
}

int main()
{
    test_sphere_triangle();
    test_sphere_bbox();
}
