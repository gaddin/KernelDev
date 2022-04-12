#include "debug.h"
#include "VGA.h"
void printk(const char[256] bytes)
{
	vga_prints(bytes);
}
