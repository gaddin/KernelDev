#ifndef VGA_H
#define VGA_H

#include "../types.h"
/* VGA COLOR MACROS */
#define VGA_BLACK 0x0
#define VGA_BLUE 0x1  
#define VGA_GREEN 0x2
#define	VGA_CYAN 0x3
#define VGA_RED 0x4
#define	VGA_MAGENTA 0x5
#define VGA_BROWN 0x6
#define	VGA_WHITE 0xf
#define VGA_GRAY 0x8

#define VGA_SET_COLOR(FOREGROUND, BACKGROUND)\
	( FOREGROUND | (BACKGROUND << 4) )

void vga_printc(int8_t data, int8_t col, int8_t row);
void vga_prints(const char* str, int8_t col, int8_t row);
uint16_t vga_strlength(char str[]);

#endif /* VGA_H */
