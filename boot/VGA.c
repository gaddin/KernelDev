#include "VGA.h"
void printc(char ch, char col, char row)
{
	
	volatile char * mem = (char*) 0xb8000;
	mem += (col * 2) + (row * 160);
	*mem = ch;
	mem ++;
	*mem = vga_color(VGA_WHITE, VGA_BLUE); //arg0 foreground arg1 background
	return;
}
void prints(const char str[256], char col, char row)
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
const char* reverse_string(char bytes[])
{
	char reversed[BUFFER];	
	for(int i = 0; i <= strlength(bytes); i++)
	{	
		reversed[i] = (int) bytes[strlength(bytes) - i];	
	}
	return reversed;
}
int strlength(char str[])
{
	int i = 0;
	do
	{	
		i++;
	}
	while(str[i]);
	return i;
}
