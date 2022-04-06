#include "hwio.h"

void outb(size_t port, u8 data)
{
  asm volatile (
   "outb %0, %1\n\t"
    : "r" (data)
    : "=r" (port)
  );
}
u8 inb(size_t port)
{
  u8 data;
  asm volatile (
    "inb %0, %1\n\t"  
    : "r" (port)
    : "=r" (data)
  );
  return data;
}
void outw(size_t port, u16 data)
{
  asm volatile (
    "outw %0, %1\n\t"
    : "r" (data)
    : "=r" (port)
  );
}
u16 inw(size_t port)
{
  u16 data;
  asm volatile (
    "inw %0, %1\n\t"
    : "r" (port)
    : "=r" (data)
  );
  return data;
}
