#include "VGA.h"
void vga_printc(char ch, char col, char row)
{
	
	volatile char * mem = (char*) 0xb8000;
	mem += (col * 2) + (row * 160);
	*mem = ch;
	mem ++;
	*mem = vga_color(VGA_WHITE, VGA_BLUE); //arg0 foreground arg1 background
	return;
}
void vga_prints(const char str[256], char col, char row)
{
	int i = 0;
	do
	{
		printc(str[i], col+i, row);
		i++;
	}
	while(str[i]);	
	return;
}
char vga_color(char fg, char bg)
{
	return (fg | (bg<<4));
}
int vga_strlength(char str[])
{
	int i = 0;
	do
	{	
		i++;
	}
	while(str[i]);
	return i;
}
