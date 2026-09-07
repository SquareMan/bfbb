#ifndef LIBRWC_RPUSRDAT
#define LIBRWC_RPUSRDAT

#include "rpworld.h"

typedef rw::UserDataType RpUserDataFormat;
constexpr RpUserDataFormat rpINTUSERDATA = rw::USERDATAINT;
constexpr RpUserDataFormat rpREALUSERDATA = rw::USERDATAFLOAT;
constexpr RpUserDataFormat rpSTRINGUSERDATA = rw::USERDATASTRING;

typedef rw::UserDataArray RpUserDataArray;

inline RwInt32 RpGeometryAddUserDataArray(RpGeometry* geometry, const RwChar* name,
                                          RpUserDataFormat format, RwInt32 numElements)
{
    return rw::UserDataArray::geometryAdd(geometry, name, format, numElements);
}
inline RwInt32 RpGeometryGetUserDataArrayCount(const RpGeometry* geometry)
{
    return rw::UserDataArray::geometryGetCount(const_cast<RpGeometry*>(geometry));
}

inline RpUserDataArray* RpGeometryGetUserDataArray(const RpGeometry* geometry, RwInt32 data)
{
    return rw::UserDataArray::geometryGet(const_cast<RpGeometry*>(geometry), data);
}
// extern RwInt32 RpUserDataGetFormatSize(RpUserDataFormat format);
// extern RwBool RpUserDataPluginAttach(void);

#endif
