#include "graphics.h"
#include "cpu.h"
#include "ISR.h"
int32_t _kmain () {
	
	enable_a20() ;
   	
	IDT_DESCRIPTOR_32 IDT[IDT_MAX_SIZE];
	
	
	
	return 0 ;
}
