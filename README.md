# KernelDev
This is a small project of mine where i research about bootloaders and OS-development and share my progress in form of a small (yet badly written) operating system kernel.<br>
Feel free to take a look and download my shitty kernel.

# TODO
- implement GRUB alongside the current bootloader
- add VESA (bios and CSM)and UGA graphics support
- Basic filesystem (FAT 16 or similar)
- char devices (primarily for VESA framebuffering, stdout and stdin)
- add a lookup table for the systemcall interrupt to jump to the address the %eax parameter points to

