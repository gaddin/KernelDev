#include "cpu,h"
#include "hwio.h"
#include <stdint.h>
void load_idt (idt_ptr *idt_register) 
{

}


void enable_a20() 
{
    char success[] = "enabled a20 line!" ;
    
    uint8_t a20 = in8(0x92) ;
    asm volatile ("or $0x2, %0"
                    :"=r"(a20)) ;
    out8(0x92, a20) ;
    kernel_log_write(success) ; 
    return ;
}
