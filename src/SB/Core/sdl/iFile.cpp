#include "iFile.h"

#include "iTRC.h"

#include "xFile.h"
#include "xMath.h"
#include "xTRC.h"

#include <cstdint>
#include <macros.h>
#include <string.h>

struct file_queue_entry
{
    tag_xFile* file;
    void* buf;
    U32 size;
    U32 offset;
    IFILE_READSECTOR_STATUS stat;
    void (*callback)(tag_xFile* file);
    U32 asynckey;
};

file_queue_entry file_queue[4];

static U32 tbuffer[1024 + 8];
static U32* buffer32;
volatile U32 iFileSyncAsyncReadActive;

void iFileInit()
{
    buffer32 = (U32*)ALIGN_NEXT((intptr_t)tbuffer, 32);
}

void iFileExit()
{
}

U32* iFileLoad(const char* name, U32* buffer, U32* size)
{
    return NULL;
}

U32 iFileOpen(const char* name, S32 flags, tag_xFile* file)
{
    return 0;
}

S32 iFileSeek(tag_xFile* file, S32 offset, S32 whence)
{
    return 0;
}

static void ifilereadCB(tag_xFile* file)
{
    iFileSyncAsyncReadActive = 0;
}

U32 iFileRead(tag_xFile* file, void* buf, U32 size)
{
    return size;
}

S32 iFileReadAsync(tag_xFile* file, void* buf, U32 aSize, void (*callback)(tag_xFile*),
                   S32 priority)
{
    return -1;
}

IFILE_READSECTOR_STATUS iFileReadAsyncStatus(S32 key, S32* amtToFar)
{
    if (key != file_queue[key & 0x3].asynckey)
    {
        return IFILE_RDSTAT_EXPIRED;
    }

    if (amtToFar)
    {
        *amtToFar = file_queue[key & 0x3].offset;
    }

    return file_queue[key & 0x3].stat;
}

U32 iFileClose(tag_xFile* file)
{
    return 0;
}

U32 iFileGetSize(tag_xFile* file)
{
    return 0;
}

void iFileReadStop()
{
}

void iFileFullPath(const char* relname, char* fullname)
{
    strcpy(fullname, relname);
}

void iFileSetPath(const char* path)
{
}

U32 iFileFind(const char* name, tag_xFile* file)
{
    return iFileOpen(name, 0, file);
}

void iFileGetInfo(tag_xFile* file, U32* addr, U32* length)
{
    if (addr)
    {
        *addr = NULL;
    }

    if (length)
    {
        *length = 0;
    }
}
