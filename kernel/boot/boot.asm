[bits 16]
[org 0x7c00]
_entry:
    mov             ah, 0x0
    mov             al, 0x2
    int             0x10
    mov             ah, 0x1
    mov             cx, 1 << 13         ; 0b0001000000000000 -> disable cursor
    int             0x10            
    mov             ah, 0x2
    mov             bl, 0x0
    mov             dl, 0x0
    int             0x10
    mov             ah, 0x6        
    mov             al, 0x0   
    mov             bh, 0x43  
    mov             cx, 0x0
    mov             dx, 0x184f
    int             0x10
    cli                                 ; disable interrupts


    lgdt            [GDT_Descriptor]    ; loading Global Descriptor Table
    mov             eax, cr0
    or              eax, 1
    mov             cr0, eax            ; Control Register Bit 1 = 0 -> protectedmode
    jmp             CODE_SEG: _entry32  ; long-jump into the _entry32 label 

%include "..GDT/GDT.asm"

[bits 32]

str:
    db              "mode: pm", 0x0
str2:
    db              "jmp _kernel_entry", 0x0
%include "../functions/print_str.asm"
_entry32:


    mov             si, str
    mov             ah, 0x0f
    mov             bx, 0x3 << 4
    mov             ecx, 0x0
    call            print_str
    mov             si, str2
    mov             ebx, ecx
    add             ecx, 0xa0
    sub             ecx, ebx
    mov             bx, 0x0 << 4
    call            print_str
    hlt
   

    times 510 - ($-$$) db 0
    dw 0xAA55    



        
