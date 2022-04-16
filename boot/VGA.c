#include "VGA.h"


void vga_printc(int8_t data, int8_t col, int8_t row)
{
	
	volatile uint8_t * vga_memory = (volatile uint8_t*) 0xb8000;
    
    vga_memory += (col * 2) + (row * 160);
	*vga_memory= data;
    vga_memory++;
	*vga_memory = vga_color(VGA_WHITE, VGA_BLACK);

    return;
}


void vga_prints(const char *str, int8_t col, int8_t row)
{
	int i = 0;
	
    do
	{
		vga_printc(str[i], col+i, row);
		i++;
	}
	while(str[i]);	
	
    return;
}


int8_t vga_color(int8_t foreground, int8_t background)
{
	return (foreground | (background << 4));
}


uint16_t vga_strlength(char str[])
{
	int i = 0;
	
    do
	{	
		i++;
	}
	while(str[i]);
	
    return i;
}
