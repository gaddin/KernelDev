#ifndef HWIO_H
#define HWIO_H

/* output an 8-bit "byte" to a port */
void outb(uint16_t port, uint8_t data) ;

/* get an 8-bit "byte" from a port */
uint8_t inb(uint16_t port) ;

/* output a 16-bit "word" to a port */
void outw(uint16_t port, uint16_t data) ;
  
/* get a 16-bit "word" from a port */
uint16_t inw(uint16_t port) ;

#endif /* HWIO_H */
