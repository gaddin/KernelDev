#include "devices.h"
int _start()
{	
	/*
	general setup 
	*/
	
	VIDEO_MODE (*video_mode)(void) = NULL;
	//starting the kernel with the correct videomode
	k_start(video_mode);
	return 0;
}
