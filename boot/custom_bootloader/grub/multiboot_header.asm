/* this multiboot header should be aligned to 8 inside the .multiboot section -> see linker.ld */

global _start

_16_Kib equ 0x4000
MAGIC_NUMBER equ 0xE85250D6

.header_start:

MAGIC:      dd MAGIC_NUMBER
ARCH:       dd 0    ; 32-bit protected 
LENGTH:     dd .header_end - .header_start
CHECKSUM:   dd -( .header_end - .header_start + MAGIC_NUMBER )

_start:
    mov esp, stack_top
    cli
    jmp halt

section .bss
stack: equ $
resb _16_KiB
stack_top:

