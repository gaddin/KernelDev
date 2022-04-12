#include "VGA.h"
#include "hwio.h"
#define NOP asm("xor %eax, %eax");
int32_t _start()
{
	//setup
	char string[] = "entered kernel";
	vga_prints(string,0,0);	
	enable_a20();
	return 0;
}
