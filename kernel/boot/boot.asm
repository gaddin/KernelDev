;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; FILE:		boot.asm					;
; AUTHOR:	Francisco Fischer			;
; DATE:		02.11.2022					;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
bits 16
[org 0x7c00]
jmp _entry16
kernel equ 0x7f00
%include "../functions/bios.asm"

_entry16:
	mov             	ah, VIDEO_MODE		; AH = 0x0
	mov             	al, VGA_TTY			; AL = 0x2
	int             	VGA					
    
	mov             	ah, 0x1
   	mov             	cx, 1 << 13         ; CX = 0b0001000000000000 -> disable cursor
	int             	VGA
	mov             	ah, SET_COLOR       ; AH = 0x6 
    	mov             	al, 0x0				; top left
    	mov             	bh, 0xe					
    	xor			cx, cx				; CX = 0x0
    	mov             	dx, 0x184f			; bottom right
    	int            		VGA
	mov			ah, READ_DISK
	mov			al, 0x80
	xor			ch, ch				; CH = 0x0
	xor			bx, bx				; BX = 0x0
	mov			cl, 0x2
	xor			dh, dh				; DH = 0x0
	mov			dl, 0x80
	mov			bx, 0x7e00
	int			DISK
	mov			ax, 0x0
	mov			ds, ax
	mov			sp, ax
	mov			gs, ax
	mov			fs, ax
	mov			es, ax
	cli

    lgdt            [GDT_Descriptor]    ; loading Global Descriptor Table
    	mov             eax, cr0
    	or		eax, 1
	mov             cr0, eax            ; Control Register Bit 1 = 0 -> protectedmode

jmp             CODE_SEG: _entry32  ; long-jump into the _entry32 label 

%include "../GDT/GDT.asm"

bits 32
													

%include "strings.asm"					; Strings for debugging
%include "../functions/printf.asm"		; print format see printf.txt for information
_entry32:
.segment_setup:
xor				ecx, ecx			; ECX = 0x0
	xor				ebx, ebx			; EBX = 0x0
	mov             si, OSname
	mov             ah, 0x23			; 
	call            printf
	mov				si, str
	call            printf
	jmp _sector2
	mov				si, err				; displays error if the jump failed
	call			printf
	hlt
	times 510 - ($-$$) db 0
    dw 0xAA55							; places bootsignature at the 510th byte

_sector2:				; second sector at byte 513
	mov				si, sector2
	call			printf
	call kernel
	times 1024 - ($-$$) db 0
