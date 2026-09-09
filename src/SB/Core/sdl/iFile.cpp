#include <Windows.h>
#include "iFile.h"

#include "iTRC.h"

#include "xFile.h"
#include "xMath.h"
#include "xTRC.h"

#include <processenv.h>
#include <rwcore.h>
#include <cassert>
#include <cstdint>
#include <macros.h>
#include <stdio.h>
#include <string.h>

#include <immintrin.h>
#include <SDL3/SDL_filesystem.h>
#include <SDL3/SDL_iostream.h>

void iFileInit()
{
}

void iFileExit()
{
}

U32* iFileLoad(const char* name, U32* buffer, U32* size)
{
    tag_xFile file;
    iFileOpen(name, IFILE_OPEN_READ, &file);

    SDL_PathInfo info;
    SDL_GetPathInfo(name, &info);

    U32 bufSize = ALIGN_NEXT(info.size, 32);

    if(buffer == NULL)
    {
        // Callers use RwFree soo...... 
        buffer = (U32*)RwMalloc(bufSize);
    }
    
    iFileRead(&file, buffer, bufSize);

    if(size != NULL)
    {
        *size = bufSize;
    }

    iFileClose(&file);
    return buffer;
}

U32 iFileOpen(const char* name, S32 flags, tag_xFile* file)
{
    tag_iFile* ps = &file->ps;
    SDL_PathInfo info = {};
    
    bool fileExists = SDL_GetPathInfo(name, &info);
    
    ps->size = (U32)info.size;
    
    const char* mode;
    switch (flags)
    {
    case 0:
        // Simply check if the file exists
        return fileExists;
    case IFILE_OPEN_WRITE:
        mode = "rw";
        break;
    case IFILE_OPEN_READ:
        mode = "rb";
        break;
    default:
        assert(false && "IFILE OPEN MODE not specified");
        return 1;
    };

    if(!fileExists)
    {
        printf("Cannot open file \"%s\": Does not exist", name);
        return 1;
    }

    SDL_IOStream* io = SDL_IOFromFile(name, mode);
    file->ps.io = io;
    
    return 0;
}

S32 iFileSeek(tag_xFile* file, S32 offset, S32 whence)
{
    SDL_IOStream* io = file->ps.io;
    SDL_IOWhence sdl_whence;
    switch(whence)
    {
    case IFILE_SEEK_SET:
        sdl_whence = SDL_IO_SEEK_SET;
        break;
    case IFILE_SEEK_CUR:
        sdl_whence = SDL_IO_SEEK_CUR;
        break;
    case IFILE_SEEK_END:
        sdl_whence = SDL_IO_SEEK_END;
        break;
    default:
        assert(false && "Unreachable");
    }
    SDL_SeekIO(io, offset, sdl_whence);
    return TRUE;
}

U32 iFileRead(tag_xFile* file, void* buf, U32 size)
{
    SDL_ReadIO(file->ps.io, buf, size);
    return size;
}

S32 iFileReadAsync(tag_xFile* file, void* buf, U32 aSize, void (*callback)(tag_xFile*),
                   S32 priority)
{
    // assert(false && "TODO");
    iFileRead(file, buf, aSize);
    callback(file);
    return 1;
}

IFILE_READSECTOR_STATUS iFileReadAsyncStatus(S32 key, S32* amtToFar)
{
    // assert(false && "TODO");
    return IFILE_RDSTAT_DONE;
}

U32 iFileClose(tag_xFile* file)
{
    if(!SDL_CloseIO(file->ps.io))
    {
        printf("Failed to close file: %s", SDL_GetError());
        return 1;
    }
    return 0;
}

U32 iFileGetSize(tag_xFile* file)
{
    return file->ps.size;
}

void iFileReadStop()
{
    assert(false && "TODO");
}

void iFileFullPath(const char* relname, char* fullname)
{
    strcpy(fullname, relname);
}

void iFileSetPath(const char* path)
{
    // Not platform independent. SDL does not provide an API for this as it supports many platforms where this doesn't make sense
    SetCurrentDirectoryA(path);
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
        *length = file->ps.size;
    }
}
