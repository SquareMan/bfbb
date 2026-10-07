#include <macros.h>

#include "iFile.h"

#include "xFile.h"

#include <cassert>
#include <rwcore.h>

#include <immintrin.h>
#include <Windows.h>
#include <SDL3/SDL_iostream.h>
#include <SDL3/SDL_log.h>
#include <SDL3/SDL_filesystem.h>

struct file_queue_entry
{
    tag_xFile* file;
    U32 bytesRead;
    IFILE_READSECTOR_STATUS stat;
    void (*callback)(tag_xFile* file);
    U32 asynckey;
};

file_queue_entry file_queue[4];

void iFileInit()
{
    memset(file_queue, 0, sizeof(file_queue));
    for (S32 i = 0; i < 4; i++)
    {
        file_queue[i].stat = IFILE_RDSTAT_NOOP;
    }
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

    if (buffer == NULL)
    {
        // Callers use RwFree soo......
        buffer = (U32*)RwMalloc(bufSize);
    }

    iFileRead(&file, buffer, bufSize);

    if (size != NULL)
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

    if (!SDL_GetPathInfo(name, &info))
    {
        SDL_Log("Cannot open file \"%s\": Does not exist\n", name);
        return 1;
    }

    ps->size = (U32)info.size;

    const char* mode;
    switch (flags)
    {
    case IFILE_OPEN_WRITE:
        mode = "rw";
        break;
    case 0:
    case IFILE_OPEN_READ:
        mode = "rb";
        break;
    default:
        assert(false && "IFILE OPEN MODE not specified");
        return 1;
    };

    SDL_IOStream* io = SDL_IOFromFile(name, mode);
    file->ps.io = io;

    if (io == NULL)
    {
        SDL_Log("Failed to open file \"%s\": %s", name, SDL_GetError());
        return 1;
    }

    return 0;
}

S32 iFileSeek(tag_xFile* file, S32 offset, S32 whence)
{
    SDL_IOStream* io = file->ps.io;
    SDL_IOWhence sdl_whence;
    switch (whence)
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
    Sint64 final = SDL_SeekIO(io, offset, sdl_whence);
    if (final == -1)
    {
        SDL_Log("Could not seek to position %d for file \"%s\": %s", offset, file->relname,
                SDL_GetError());
    }
    return final;
}

U32 iFileRead(tag_xFile* file, void* buf, U32 size)
{
    SDL_ReadIO(file->ps.io, buf, size);
    return size;
}

S32 iFileReadAsync(tag_xFile* file, void* buf, U32 aSize, void (*callback)(tag_xFile*),
                   S32 priority)
{
    static S32 fopcount = 1;
    tag_iFile* ps = &file->ps;
    S32 i;

    for (i = 0; i < 4; i++)
    {
        if (file_queue[i].stat != IFILE_RDSTAT_QUEUED && file_queue[i].stat != IFILE_RDSTAT_INPROG)
        {
            S32 asynckey;
            S32 id = fopcount++ << 2;

            asynckey = id + i;

            // This API is not supposed to move the file cursor
            Sint64 cursor = SDL_TellIO(file->ps.io);
            iFileRead(file, buf, aSize);
            Sint64 bytesRead = SDL_TellIO(file->ps.io) - cursor;
            SDL_SeekIO(file->ps.io, cursor, SDL_IO_SEEK_SET);

            file_queue[i].file = file;
            file_queue[i].bytesRead = bytesRead;
            file_queue[i].stat = IFILE_RDSTAT_QUEUED;
            file_queue[i].callback = callback;
            file_queue[i].asynckey = asynckey;

            ps->asynckey = asynckey;

            return i + id;
        }
    }

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
        *amtToFar = file_queue[key & 0x3].bytesRead;
    }

    return file_queue[key & 0x3].stat;
}

void iFileAsyncService()
{
    for (int i = 0; i < 4; i++)
    {
        file_queue_entry* entry = &file_queue[i];
        if (entry->stat != IFILE_RDSTAT_QUEUED)
        {
            continue;
        }
        // We loaded everything in the intial call to iFileReadAsync
        tag_xFile* file = entry->file;
        entry->stat = IFILE_RDSTAT_DONE;

        if (entry->callback)
        {
            entry->callback(file);
        }

        file->ps.asynckey = -1;
    }
}

U32 iFileClose(tag_xFile* file)
{
    if (!SDL_CloseIO(file->ps.io))
    {
        SDL_Log("Failed to close file: %s", SDL_GetError());
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
    // no-op unless we implement actual async io
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
    SDL_PathInfo info;
    return SDL_GetPathInfo(name, &info) ? 0 : 1;
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
