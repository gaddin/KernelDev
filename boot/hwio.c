
/*
* hardware input and output
*/

#include "hwio.h"
#include <stdint.h>
#include "VGA.h"
void out8(uint16_t port, uint8_t data)
{
  	asm volatile ("outb %0, %1" 
		  	:
		  	: "a" (data),"Nd" (port));
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
  	asm volatile ("outw %0, %1" 
		  	:
		  	: "a" (data), "Nd" (port));
  
}
uint16_t in16(uint16_t port)
{
  	uint16_t data;
  	asm volatile ("inw %1, %0"
		  	: "=a" (data)
		  	: "Nd" (port));
  	return data;
}
void enable_a20()
{
	char success[] = "enabled a20 line!";
	uint8_t a20 = in8(0x92);
	asm volatile ("or $0x2, %0"
			:"=r"(a20));
	out8(0x92,a20);
	vga_prints(success,0,3);
}
// THIS IS JUST FOR DEBUGGING 
// THERE IS LITERALLY NO USE OF DISABLEING IT AGAIN BRUH
void disable_a20()
{
	char disabled[] = "disabled a20 line!";
	uint8_t a20 = in8(0x92);
	asm volatile ("xor $0x2, %0"
			:"=r"(a20));
	out8(0x92, a20);
	vga_prints(disabled,0,2);
}
