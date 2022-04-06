#ifndef HWIO_H
#define HWIO_H
/*includes*/
#include "types.h"

void outb(size_t port, u8 data); // 8-bit value
u8 inb(size_t port);

void outw(size_t port, u16 data); // 16-bit value
u16 inw(size_t port);

#endif
