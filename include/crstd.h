#ifndef CRSTD_H
#define CRSTD_H

/****************************
 *		 VGA - 16 COLORS	*
 ****************************/

#define VGA_BLACK		0x00
#define VGA_BLUE		0x01
#define VGA_GREEN		0x02
#define VGA_CYAN		0x03
#define VGA_RED			0x04
#define VGA_PINK		0x05
#define VGA_BROWN		0x06
#define VGA_GREY		0x07
#define VGA_DARK_GREY	0x08
#define VGA_LIGHT_BLUE	0x09
#define VGA_LIGHT_GREEN 0x0a
#define VGA_LIGHT_CYAN	0x0b
#define VGA_LIGHT_RED	0x0c
#define VGA_LIGHT_PINK	0x0d
#define VGA_YELLOW		0x0e
#define VGA_WHITE		0x0f
void _init(){
	asm volatile("jmp _start /*located in crstd.h*/\n\t");
}
void __vga__putchar__(char c, char col, char row, char color)
{
	row--;
	volatile char *VGA = (volatile char *) 0xb8000;
    VGA += (row * 160) + (col * 2);
	*VGA = c;
	VGA += 1;
	*VGA = color;
	return;
}
void __vga__putstr__(char *s, char col, char row)
{
	int next = 160;	//each row contains 160 cells
	row--;
	for(int i = 0; i != 0x0 ;i++)
	{
		__vga__putchar__(s[i],i, row ,VGA_LIGHT_CYAN);
		if(i == next)
		{
			row++;
			next += 160;
		}
	}
}
#endif
