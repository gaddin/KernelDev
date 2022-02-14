#!/bin/bash
nasm -f bin boot.asm -o boot.bin
gcc -fno-pic -nostdlib -ffreestanding -c kernel.c -o kernel.o
ld  -o kernel.bin -Ttext 0x7f00 kernel.o --oformat binary
cat boot.bin kernel.bin > kernel.elf
doas dd if=/dev/zero of=/kernel.iso bs=512 count=1440
dd if=kernel.elf of=kernel.iso  conv=notrunc bs=1024 count=2
qemu-system-i386 -k 10 kernel.iso -full-screen
