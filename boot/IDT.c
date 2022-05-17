#include "IDT.h"

IDT_ENTRY_32 populate_idt_entry(uint8_t IDT_ENTRY_32 idt_entry, uint32_t handler_address) {

    static uint16_t offset;
    
    idt_entry = {
        .offset_1 = MASK_ADDRESS(HI, handler_address);
        .segment_selector = CODE_SEGMENT;
        ._reserved = 0x0;
        .attributes = RING_0;
        .offset_2 = MASK_ADDRESS(LO, handler_address);
    };
    
    
    return idt_entry;
}

void install_idt() {
    
    idt_ptr* idt_address = {}
    lidt();
}


