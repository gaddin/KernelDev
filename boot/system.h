#ifndef SYSTEM_H
#define SYSTEM_H

#include "types.h"

typedef struct {
  void* ptr_to_next;
  size_t size;
} header;

void *memset (void* dst, uint8_t byte, size_t count );

#endif /* SYSTEM_H */
