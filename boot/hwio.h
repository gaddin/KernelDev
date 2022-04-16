#ifndef HWIO_H
#define HWIO_H

/* output an 8-bit value to a port */
void out8(uint16_t port, uint8_t data) ;
/* get an 8-bit value from a port */
uint8_t in8(uint16_t port) ;
/* */
void out16(uint16_t port, uint16_t data) ;  
uint16_t in16(uint16_t port) ;

#endif /* HWIO_H */
