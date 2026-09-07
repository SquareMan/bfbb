#ifndef LIBRWC_RPMATFX
#define LIBRWC_RPMATFX

#include "rpworld.h"

typedef RwUInt32 RpMatFXMaterialFlags;
constexpr RpMatFXMaterialFlags rpMATFXEFFECTNULL = rw::MatFX::NOTHING;
constexpr RpMatFXMaterialFlags rpMATFXEFFECTBUMPMAP = rw::MatFX::BUMPMAP;
constexpr RpMatFXMaterialFlags rpMATFXEFFECTENVMAP = rw::MatFX::ENVMAP;
constexpr RpMatFXMaterialFlags rpMATFXEFFECTBUMPENVMAP = rw::MatFX::BUMPENVMAP;
constexpr RpMatFXMaterialFlags rpMATFXEFFECTDUAL = rw::MatFX::DUAL;

// RwBool RpMatFXPluginAttach( void );
inline RpAtomic* RpMatFXAtomicEnableEffects(RpAtomic* atomic)
{
    rw::MatFX::enableEffects(atomic);
    return atomic;
}
// RwBool RpMatFXAtomicQueryEffects( RpAtomic *atomic );
// RpWorldSector *RpMatFXWorldSectorEnableEffects( RpWorldSector *worldSector );
//RwBool RpMatFXWorldSectorQueryEffects( RpWorldSector *worldSector );
inline RpMaterial* RpMatFXMaterialSetEffects(RpMaterial* material, RpMatFXMaterialFlags flags)
{
    rw::MatFX::setEffects(material, flags);
    return material;
}

inline RpMatFXMaterialFlags RpMatFXMaterialGetEffects(const RpMaterial* material)
{
    return rw::MatFX::getEffects(material);
}

inline RpMaterial* RpMatFXMaterialSetupBumpMap(RpMaterial* material, RwTexture* texture,
                                               RwFrame* frame, RwReal coef)
{
    rw::MatFX* fx = rw::MatFX::get(material);
    fx->setBumpTexture(texture);
    fx->setBumpFrame(frame);
    fx->setBumpCoefficient(coef);
    return material;
}

inline RpMaterial* RpMatFXMaterialSetupEnvMap(RpMaterial* material, RwTexture* texture,
                                              RwFrame* frame, RwBool useFrameBufferAlpha,
                                              RwReal coef)
{
    rw::MatFX* fx = rw::MatFX::get(material);
    fx->setEnvTexture(texture);
    fx->setEnvFrame(frame);
    fx->setEnvFBAlpha(useFrameBufferAlpha);
    fx->setEnvCoefficient(coef);
    return material;
}
// RpMaterial *RpMatFXMaterialSetupDualTexture( RpMaterial *material, RwTexture *texture, RwBlendFunction srcBlendMode, RwBlendFunction dstBlendMode );
// RpMaterial *RpMatFXMaterialSetBumpMapTexture( RpMaterial *material, RwTexture *texture );
// RpMaterial *RpMatFXMaterialSetBumpMapFrame( RpMaterial *material, RwFrame *frame );
inline RpMaterial* RpMatFXMaterialSetBumpMapCoefficient(RpMaterial* material, RwReal coef)
{
    rw::MatFX::get(material)->setBumpCoefficient(coef);
    return material;
}
// RwTexture *RpMatFXMaterialGetBumpMapTexture( const RpMaterial *material );
// RwTexture *RpMatFXMaterialGetBumpMapBumpedTexture( const RpMaterial *material );
// RwFrame *RpMatFXMaterialGetBumpMapFrame( const RpMaterial *material );
// RwReal RpMatFXMaterialGetBumpMapCoefficient( const RpMaterial *material );
// RpMaterial *RpMatFXMaterialSetEnvMapTexture( RpMaterial *material, RwTexture *texture );
// RpMaterial *RpMatFXMaterialSetEnvMapFrame( RpMaterial *material, RwFrame *frame );
// RpMaterial *RpMatFXMaterialSetEnvMapFrameBufferAlpha( RpMaterial *material, RwBool useFrameBufferAlpha );
inline RpMaterial* RpMatFXMaterialSetEnvMapCoefficient(RpMaterial* material, RwReal coef)
{
    rw::MatFX::get(material)->setEnvCoefficient(coef);
    return material;
}
// RwTexture *RpMatFXMaterialGetEnvMapTexture( const RpMaterial *material );
// RwFrame *RpMatFXMaterialGetEnvMapFrame( const RpMaterial *material );
// RwBool RpMatFXMaterialGetEnvMapFrameBufferAlpha( const RpMaterial *material );
// RwReal RpMatFXMaterialGetEnvMapCoefficient( const RpMaterial *material );
// RpMaterial *RpMatFXMaterialSetDualTexture( RpMaterial *material, RwTexture *texture );
// RpMaterial *RpMatFXMaterialSetDualBlendModes( RpMaterial *material, RwBlendFunction srcBlendMode, RwBlendFunction dstBlendMode );
// RwTexture *RpMatFXMaterialGetDualTexture( const RpMaterial *material );
// const RpMaterial *RpMatFXMaterialGetDualBlendModes( const RpMaterial *material, RwBlendFunction *srcBlendMode, RwBlendFunction *dstBlendMode );

#endif
