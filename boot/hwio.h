#ifndef HWIO_H
#define HWIO_H
/*includes*/
#include "types.h"

void out8(size_t port, u8 data); // 8-bit value
u8 in8(size_t port);

void out16(size_t port, u16 data); // 16-bit value
u16 in16(size_t port);

#endif
