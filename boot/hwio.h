#pragma once
/*includes*/
#include <stdint.h>
void out8(uint16_t port, uint8_t data); // 8-bit value
uint8_t in8(uint16_t port);

void out16(uint16_t port, uint16_t data); // 16-bit value
uint16_t in16(uint16_t port);
void enable_a20();
//TODO DEBUG FUNCTION REMOVE AS SOON AS POSSIBLE
void disable_a20();

