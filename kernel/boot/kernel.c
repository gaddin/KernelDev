#include "../../include/crstd.h"
#include <inttypes.h>
void _start()
{
	//this is a test string
	__vga__putchar__('>', 1, 7, VGA_LIGHT_CYAN);
	__vga__putchar__('>', 2, 7, VGA_LIGHT_RED);
	asm volatile("hlt\n\t");
}

