#ifndef CPU_H
#define CPU_H

typedef struct
{
    uint16_t offset_0;
    uint16_t selector;
    uint8_t zero;
    uint8_t type_attributes;
    uint16_t offset_1;
}
idt_entry;

void load_idt();
void enable_a20();
#endif /* CPU_H */
