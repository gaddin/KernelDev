_D=`head -1 toolchain.conf`
CC=$(_D)i686-elf-gcc
LD=$(_D)i686-elf-ld
CC64=$(_D)/x86_64-elf-gcc
LD64=$(_D)/x86_64-elf-ld
OBJ= tmpd/entry/kernel_entry.o tmpd/*.o
KERNEL_FLAGS=-nostdlib -ffreestanding -Wall -Tlink.ld -m32
EFI_FLAGS=-ffreestanding -I/home/espi/gnu-efi/inc/x86_64 -I/home/espi/gnu-efi/inc/protocol -c -o
EFI_OUTPUT_FLAGS=-nostdlib -Wl,-dll -shared -Wl,--subsystem,10 -e efi_main -o $(TMP_D)BOOTX64.EFI 
LD_FLAGS=-Tlink.ld
TMP_D=tmpd/
BUILD_D=build/

BOOT_D=boot/
DRIVER_D=kernel/drivers/
UTILS_D=kernel/utils/



# **BUILD**
help:
	@cat help.txt
debug:
	@echo -e "VERSION:\n db \"[ DBG ]    built on `uname -r` `date`\",0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20, 0x20, 0x20, 0x20,0\n"> $(BOOT_D)version.asm
	
release:
	@echo -e "VERSION:\n db \"[ RELEASE ]    built on `uname -r` `date`\",0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0\n"> $(BOOT_D)version.asm
all: $(BUILD_D)kernel.iso

fresh: clean setup all

full: fresh run

efi: $(TMP_D)entry/kernel.elf efi_boot

efi_boot:
	$(CC) $(EFI_FLAGS) $(BOOT_D)UEFI/i686/boot.c

$(BUILD_D)kernel.iso: $(TMP_D)kernel.elf
	dd if=/dev/zero of=$@  bs=512 count=2880
	dd if=$^ of=$@  conv=notrunc bs=512 count=2048

$(TMP_D)kernel.elf: $(TMP_D)boot.bin $(TMP_D)entry/kernel.elf
	cat $^ > $@

$(TMP_D)boot.bin: $(BOOT_D)BIOS/boot.asm $(BOOT_D)version.asm
	nasm -f bin $< -o $@

$(TMP_D)entry/kernel.elf: $(BOOT_D)kernel_entry.c $(UTILS_D)*.c $(DRIVER_D)*.c
	$(CC64) $(KERNEL_FLAGS) $^ -o $@

clean:
	@echo -e "cleaing up!\n\n"
	rm -rf $(TMP_D)
	rm -rf $(BUILD_D)
setup:
	mkdir $(TMP_D)
	mkdir $(TMP_D)entry
	mkdir $(BUILD_D)
run:	$(BUILD_D)kernel.iso
	@echo -e "starting emulator\n\n"
	qemu-system-x86_64 -cpu pentium build/kernel.iso -m 512\
		-enable-kvm -monitor stdio -vga std
	@echo -e " "
efirun:
	qemu-system-x86_64  -bios /usr/share/edk2-ovmf/ia32/OVMF.fd -enable-kvm -vga std -monitor stdio -m 512
