GDT_Start:
    null_descriptor:
        dd 0
        dd 0
        
    code_descriptor:
        dw 0xffff
        dw 0x0
        db 0x0
        db 0b10011010
        db 0b11001111
        db 0x0

    data_descriptor:
        dw 0xffff
        dw 0x0
        db 0x0
        db 0b10010010
        db 0b11001111
        db 0
GDT_END:

GDT_Descriptor:
    dw GDT_END - GDT_Start - 1
    dd GDT_Start
CODE_SEG equ code_descriptor - GDT_Start 
DATA_SEG equ data_descriptor - GDT_Start
