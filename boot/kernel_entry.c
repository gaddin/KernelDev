#include "VGA.h"
#include "hwio.h"
int32_t _start()
{
	char string[] = "entered kernel";
	vga_prints(string,0,1);
	return 0;
}
