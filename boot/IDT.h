#ifndef IDT_H
#define IDT_H

#include "system.h"

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
    uint16_t selector;
    uint8_t _reserved;
    uint8_t attributes; // use flags 
    uint16_t offset_2;
}IDT_DESCRIPTOR_32 __attribute__((packed));

inline IDT_DESCRIPTOR_32 populate_idt_descriptor(IDT_DESCRIPTOR_32 idt_descriptor, uint32_t handler_address) {
    static uint16_t offset;
    idt_descriptor {
        .offset_1 = offset;
        .selector = CODE_SEGMENT;
        ._reserved = 0x0;
        .attributes = RING_0;
        .offset_2 = handler_address;
    };

    return idt_descriptor;
}

inline void install_idt() {
    
}

#endif /* IDT_H */
