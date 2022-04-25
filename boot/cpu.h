#ifndef CPU_H
#define CPU_H

typdef struct
{
    uint16_t offset_0;
    uint16_t selector;
    uint8_t reserved;
    uint8_t type_attributes;
    uint16_t offset_1;
}
idt_descriptor __attribute__((packed));

typedef idt_descriptor* idt_ptr;
void load_idt();
void enable_a20();

#endif /* CPU_H */
