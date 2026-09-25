#include "iMemMgr.h"
#include "iSystem.h"
#include "xMemMgr.h"

#include <types.h>

#include <cstdlib>

U32 mem_top_alloc;
U32 mem_base_alloc;
U32 HeapSize;
extern xMemInfo_tag gMemInfo;
extern unsigned char _stack_end[];

void iMemInit()
{
    gMemInfo.system.addr = 0;
    gMemInfo.system.size = 0x100000;
    gMemInfo.system.flags = 0x20;
    HeapSize = 0x384000;
    U32 base = (U32)malloc(HeapSize);
    mem_base_alloc = base;
    mem_top_alloc = base + HeapSize;
    gMemInfo.DRAM.addr = base;
    gMemInfo.DRAM.size = HeapSize;
    gMemInfo.DRAM.flags = 0x820;
    gMemInfo.SRAM.addr = 0;
    gMemInfo.SRAM.size = 0x200000;
    gMemInfo.SRAM.flags = 0x660;
}

void iMemExit()
{
    free((void*)gMemInfo.DRAM.addr);
    gMemInfo.DRAM.addr = 0;
}
