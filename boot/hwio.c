


/*
* hardware input and output
*/

#include "hwio.h"
#include "types.h"
void out8(size_t port, u8 data)
{
  asm volatile ("outb %0, %1":: "a" (data), "Nd" (port));
}
u8 in8(size_t port)
{
  u8 data;
  asm volatile ("inb %1, %0"  
                  : "=a" (data)
                  : "Nd" (port));
  return data;
}
void out16(size_t port, u16 data)
{
  asm volatile ("outw %0, %1" ::"a" (data), "Nd" (port));
  
}
u16 in16(size_t port)
{
  u16 data;
  asm volatile ("inw %1, %0"
                  : "=a" (data)
                  : "Nd" (port));
  return data;
}
