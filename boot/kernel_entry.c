#include "VGA.h"
#include "hwio.h"

int32_t _start() 
{
    enable_a20() ;
    kernel_log_init() ;
    enable_a20() ;
    do
    {
    }
    while() ;
    return 0 ;
}
