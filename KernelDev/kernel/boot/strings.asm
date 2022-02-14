OSname:
	db				"\[CCROSS-Bootloader version 0.01\[r\n\n", 0x0
str:
    db              "protected mode:             [\[COK!\[r]\n", 0x0
sector2:
	db				"sector \[C2\[r reached!           [\[COK!\[r]\n", 0x0
err:
	db				"\n\n\[RDISK ERR!-> \[Csector2\[R SKIPPED!!\[r\n", 0x0

