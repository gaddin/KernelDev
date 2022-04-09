
/*
* hardware input and output
*/

#include "hwio.h"
#include <stdint.h>
void out8(uint16_t port, uint8_t data)
{
  asm volatile ("outb %0, %1":: "a" (data), "Nd" (port));
}
uint8_t in8(uint16_t port)
{
uint8_t data;
  asm volatile ("inb %1, %0" 
		  : "=a" (data)
		  : "Nd" (port));
  return data;
}
void out16(uint16_t port, uint16_t data)
{
  asm volatile ("outw %0, %1" :: "a" (data), "Nd" (port));
  
}
uint16_t in16(uint16_t port)
{
  uint16_t data;
  asm volatile ("inw %1, %0"
		  : "=a" (data)
		  : "Nd" (port));
  return data;
}
