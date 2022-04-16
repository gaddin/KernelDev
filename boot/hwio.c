/* hardware input and output */

#include <stdint.h>
#include "hwio.h"
#include "VGA.h"
#include "kernel_log.h"

void out8(uint16_t port, uint8_t data) 
{
    asm volatile ("outb %0, %1" 
                    :
		            : "a" (data),"Nd" (port)) ;
    
    return;
}


uint8_t in8(uint16_t port) 
{
    uint8_t data ;
    
    asm volatile ("inb %1, %0" 
                    : "=a" (data)
		            : "Nd" (port)) ;
    
    return data ;
}


void out16(uint16_t port, uint16_t data) 
{
    asm volatile ("outw %0, %1" 
                    :
		            : "a" (data), "Nd" (port)) ;
  
    return;
}


uint16_t in16(uint16_t port) 
{
    uint16_t data;
    
    asm volatile ("inw %1, %0"
                    : "=a" (data)
		            : "Nd" (port)) ;
    
    return data ;
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
