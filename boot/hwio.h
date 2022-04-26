#ifndef HWIO_H
#define HWIO_H

inline void outb(uint16_t port, uint8_t data) {

    asm volatile ("outb %0, %1" :: "a" (data),"Nd" (port)) ;
    
    return;
}


inline uint8_t inb(uint16_t port) {
	
    uint8_t data ;
    
    asm volatile ("inb %1, %0" 
		    	: "=a" (data)
		    	: "Nd" (port)) ;
    
    return data ;
}


inline void outw(uint16_t port, uint16_t data) {

    asm volatile ("outw %0, %1" :: "a" (data), "Nd" (port)) ;
  
    return;
}


inline uint16_t inw(uint16_t port) {

    uint16_t data;
    
    asm volatile ("inw %1, %0"
                    : "=a" (data)
		    		:"Nd" (port)) ;
    
    return data ;
}

#endif /* HWIO_H */
