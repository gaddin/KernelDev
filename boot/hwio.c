/* hardware input and output */

#include <stdint.h>
#include "hwio.h"
#include "VGA"

void outb(uint16_t port, uint8_t data) {

    asm volatile ("outb %0, %1" :: "a" (data),"Nd" (port)) ;
    
    return;
}


uint8_t inb(uint16_t port) {
	
    uint8_t data ;
    
    asm volatile ("inb %1, %0" 
		    : "=a" (data)
		    : "Nd" (port)) ;
    
    return data ;
}


void outw(uint16_t port, uint16_t data) {

    asm volatile ("outw %0, %1" :: "a" (data), "Nd" (port)) ;
  
    return;
}


uint16_t inw(uint16_t port) {

    uint16_t data;
    
    asm volatile ("inw %1, %0"
                    : "=a" (data)
		    : "Nd" (port)) ;
    
    return data ;
}
