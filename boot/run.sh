#!/bin/bash

nasm -f bin boot.asm -o boot.bin
$HOME/cross-compiler/bin/i686-elf-gcc -nostdlib -ffreestanding -c kernel_entry.c -o kernel_entry.o
$HOME/cross-compiler/bin/i686-elf-gcc -nostdlib -ffreestanding -S kernel_entry.c -o tmp.s
$HOME/cross-compiler/bin/i686-elf-gcc -nostdlib -ffreestanding -c VGA.c  -o VGA.o
$HOME/cross-compiler/bin/i686-elf-gcc -nostdlib -ffreestanding -c hwio.c  -o hwio.o
$HOME/cross-compiler/bin/i686-elf-ld  -o kernel.bin -Ttext 0x10000 kernel_entry.o VGA.o hwio.o --oformat binary
cat boot.bin kernel.bin > kernel.elf
sudo dd if=/dev/zero of=kernel.iso bs=512 count=1440
dd if=kernel.elf of=kernel.iso  conv=notrunc bs=1024 count=2
rm *.o *.elf #kernel.bin 
sudo qemu-system-x86_64 -k 10 kernel.iso -monitor stdio 
