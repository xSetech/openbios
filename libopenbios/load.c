/*
 *   Creation Date: <2010/06/25 20:00:00 mcayland>
 *   Time-stamp: <2010/06/25 20:00:00 mcayland>
 *
 *	<load.c>
 *
 *	C implementation of load
 *
 *   Copyright (C) 2010 Mark Cave-Ayland (mark.cave-ayland@siriusit.co.uk)
 *
 *   This program is free software; you can redistribute it and/or
 *   modify it under the terms of the GNU General Public License
 *   version 2
 *
 */

#include "config.h"
#include "kernel/kernel.h"
#include "libopenbios/bindings.h"
#include "libopenbios/sys_info.h"
#include "libopenbios/load.h"

#ifdef CONFIG_LOADER_AOUT
#include "libopenbios/aout_load.h"
#endif

#ifdef CONFIG_LOADER_FCODE
#include "libopenbios/fcode_load.h"
#endif

#ifdef CONFIG_LOADER_FORTH
#include "libopenbios/forth_load.h"
#endif


void load(ihandle_t dev)
{
	/* Invoke the loaders on the specified device */

#ifdef CONFIG_LOADER_AOUT
	aout_load(&sys_info, dev);
#endif

#ifdef CONFIG_LOADER_FCODE
	fcode_load(dev);
#endif

#ifdef CONFIG_LOADER_FORTH
	forth_load(dev);
#endif

}