#include "iDraw.h"

#include <d3d9.h>
#include <d3d9types.h>
#include <rw.h>

void iDrawSetFBMSK(U32 abgr)
{
    rw::uint32 mask = 0;
    if ((abgr & 0x000000FF) == 0) mask |= D3DCOLORWRITEENABLE_RED;
    if ((abgr & 0x0000FF00) == 0) mask |= D3DCOLORWRITEENABLE_GREEN;
    if ((abgr & 0x00FF0000) == 0) mask |= D3DCOLORWRITEENABLE_BLUE;
    if ((abgr & 0xFF000000) == 0) mask |= D3DCOLORWRITEENABLE_ALPHA;
    
    rw::d3d::setRenderState(D3DRS_COLORWRITEENABLE, mask);
}

void iDrawBegin()
{
    return;
}

void iDrawEnd()
{
    return;
}
