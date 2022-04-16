#include "kernel_log.h"
#include "video.h"
#include "VGA.h"


uint8_t kernel_log_init (uint8_t flags)
{
	if (flags && CLS) CLEAR_SCREEN();
	
    if (flags && VGA) SET_VGA();
	return flags;
}
