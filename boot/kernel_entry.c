#include "VGA.h"
#include "hwio.h"

int32_t _kmain() 
{
    enable_a20() ;
    kernel_log_init() ;
    do
    {
    }
    while() ;
    return 0 ;
}
