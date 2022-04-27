# DISCLAIMER
I have literally no idea what i'm doing. Everything you see is the product of my extensive research.

# KernelDev
KernelDev is a small project of mine where i research about bootloaders and OS-development and share my progress in form of a small (yet badly written) operating system kernel.<br>
Feel free to take a look and download my shitty kernel.


# TODO
- IDT for basic interrupts (Keyboard, PIC, Syscalls).
- implement GRUB (multiboot 2) alongside the current bootloader (add argument to buildscript to choose between those two).
- UEFI support.
- add VESA (BIOS and CSM) and UGA (Universal Graphics Adapter) graphics support.
- basic filesystem (FAT 16 or similar).
- char devices for (primarily for framebuffers).
- add a lookup table for the systemcall interrupt to jump to the address the %eax parameter points to.

# DONE
- MBR bootloader (VGA-bios)
- 25x80 16-color Text-mode vgafb.
- global descriptor table.
- 8- and 16-bit i/o port functions (inb, outb, inw, outw).
- can enable/disable a20 line.
