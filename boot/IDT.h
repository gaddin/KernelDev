#ifndef IDT_H
#define IDT_H

#include "system.h"

#define MAX_IDT_SIZE 256

#define MASK_ADDRESS(FLAGS, ADDRESS)
  #if FLAGS == HI
    (ADDRESS & 0xFFFF0000) << 16
  #elif FLAGS == LO
    (ADDRESS & 0xFFFF << 16) >> 16 
  #endif

#define LIDT(); asm volatile ("lidt (%0)"::"m"(idt_address)); /* mov idtr, idt_address*/

/* SEGMENTS */
#define CODE_SEGMENT 0x8
/*FLAGS*/

#define RING_0 0x8e

typedef struct {
    uint16_t limit;
    uint32_t base;
}idt_ptr __attribute__((packed));

typedef struct {
    uint16_t offset_1;
    uint16_t segment_selector;
    uint8_t _reserved;
    uint8_t attributes;
    uint16_t offset_2;
}IDT_ENTRY_32 __attribute__((packed));

#endif /* IDT_H */
