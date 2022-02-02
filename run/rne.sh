#!/bin/bash
nasm -f bin ../kernel/boot/boot.asm -o boot.bin
qemu-system-i386 -m 20 boot.bin