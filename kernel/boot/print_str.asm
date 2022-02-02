print_str:
    or            ax, bx
    loop:
    lodsb
    cmp             al, 0x0
    je              terminate
    mov             [0xb8000 + ecx], ax 
    add             ecx, 0x2
    jmp             loop
terminate:
    ret