/home/espi/build-i686-elf/linux/output/bin/i686-elf-gcc -ffreestanding -nostdlib -c main.c -o main.o -save-temps=obj
nasm -f bin boot.asm -o boot.bin
/home/espi/build-i686-elf/linux/output/bin/i686-elf-ld -o main.bin -Ttext 0x7ef0 main.o --oformat binary
cat boot.bin main.bin > kernel.elf
qemu-system-i386 kernel.elf 

