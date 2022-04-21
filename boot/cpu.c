#include "cpu,h"
#include "hwio.h"
#include <stdint.h>

void load_idt (idt_ptr *idt_) {
	
	return ;
}


void enable_a20() {
    
    uint8_t a20 = inb(0x92) ;
    asm volatile ("or $0x2, %0"
                    : "=r"(a20)) ;
    outb(0x92, a20) ;
    
    return ;
}
