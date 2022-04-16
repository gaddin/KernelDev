#ifndef KERNEL_LOG_H
#define KERNEL_LOG_H

/* MACROS */
#define CLS     0x1
#define VGA     0x2
#define FD      0x4

uint8_t kernel_log_init (uint_t flags) ;
void kernel_log_write(char* event) ;
#endif /* KERNEL_LOG_H */
