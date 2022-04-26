#ifndef CPU_H
#define CPU_H

typedef struct
{
    uint16_t offset_0 ;
    uint16_t selector ;
    uint8_t _reserved ;
    uint8_t type_attributes ;
    uint16_t offset_1 ;
}
idt_descriptor __attribute__((packed)) ;

typedef idt_descriptor idt_ptr ;

void load_idt() ;

uint32_t read_cr0() ;
uint32_t _reservedread_cr1() ;
uint32_t read_cr2() ;
uint32_t read_cr0() ;
uint32_t read_cr0() ;
uint32_t read_cr0() ;
uint32_t read_cr0() ;


inline void enable_a20() { 

}

inline void write_cr0() { 

}

inline void write_cr2() { 

}

inline void write_cr3() { 

}

void write_cr5() ;

#endif /* CPU_H */
