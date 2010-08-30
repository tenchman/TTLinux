#ifndef _BYTEORDER_H
#define _BYTEORDER_H

#include <endian.h>

#if __BYTE_ORDER == __LITTLE_ENDIAN
# ifndef __LITTLE_ENDIAN_BITFIELD
# define __LITTLE_ENDIAN_BITFIELD
# endif
#elif __BYTE_ORDER == __BIG_ENDIAN
# ifndef __BIG_ENDIAN_BITFIELD
# define __BIG_ENDIAN_BITFIELD
# endif
#endif

#endif
