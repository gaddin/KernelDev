 		dw 0xffff               ; segment limit first 0-15 bits
		dw 0                    ; base first 0-15 bits
          db 0                    ; base 16-23 bits
          db 0x9a                 ; access byte
          db 0xcf         ; high 4 bits (flags) low 4 bits (limit 4 last bits)(limit is 20 bit wide)
          db 0                    ; base 24-31 bits
 
 ; offset 0x10
 .data:                          ; ds, ss, es, fs, and gs should point to this descriptor
         dw 0xffff               ; segment limit first 0-15 bits
         dw 0                    ; base first 0-15 bits
         db 0                    ; base 16-23 bits
         db 0x92                 ; access byte
         db 0xcf                 ; high 4 bits (flags) low 4 bits (limit 4 last bits)(limit is 20 bit wide)
         db 0 
