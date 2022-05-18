#include "IDT.h"

IDT_ENTRY_32 populate_idt_entry(uint8_t idt_entry, void *handler_address) {

    static uint16_t offset;
    
    idt_entry = {
        .offset_1 = MASK_ADDRESS(HI, handler_address);
        .segment_selector = CODE_SEGMENT;
        ._reserved = 0x0;
        .attributes = STD_H;
        .offset_2 = MASK_ADDRESS(LO, handler_address);
    };
    
    return idt_entry;
}

void install_idt() {
    
    idt_ptr* idt_address = { .limit = sizeof(IDT) * MAX, .base = &IDT };
    lidt();
}


