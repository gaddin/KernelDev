#include "VGA.h"

int _start()
{
	char kernel[] = "kernel loaded successfully!";	
	char addr[] = "kernel address: 0x7ef0";
	prints(kernel, 0, 1);
	prints(addr, 0, 3);
	return 0;
}
