#ifndef VGA_H
#define VGA_H

/*
	VGA COLOR MACROS
*/
#define VGA_BLACK 0x0
#define VGA_BLUE 0x1  
#define VGA_GREEN 0x2
#define	VGA_CYAN 0x3
#define VGA_RED 0x4
#define	VGA_MAGENTA 0x5
#define VGA_BROWN 0x6
#define	VGA_WHITE 0xf
#define VGA_GRAY 0x8

/*function declarations*/

void vga_prints(const char str[], char col, char row);
void vga_printc(char ch, char col, char row);
char vga_color(char fg, char bg);
int vga_strlength(char str[]);

#endif
