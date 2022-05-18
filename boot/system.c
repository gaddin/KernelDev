#include "system.h"
#include "types.h"

void *memset (void *dst, uint8_t byte, size_t count) {
    for(size_t i = 0; i <= count; i++) {
        dst[i++] = byte;
    }
    
    return dst;
}

void memcpy(void *dst, void *src, size_t num) {

    for(size_t i = 0; i <= num; i++) {
        dst[i++] = src[i++];
    }
    return;
}

void *malloc(size_t size) {
    
    void* block
    return block;
}

void free(void *ptr) {

    
    
    return;
}
