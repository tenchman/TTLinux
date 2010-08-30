# $Id:$

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

NAME	    = hdparm
VERSION	    = 7.6
FORMAT	    = tar.gz
CC          = $(COMPILER)
PATCHES     = hdparm-byteorder.patch
CFLAGS      = -Os -fno-builtin
CPPFLAGS    = -I/opt/diet/include $(TTL_KERNELINC) -nostdinc -D__KERNEL_STRICT_NAMES -D_BSD_SOURCE -D_GNU_SOURCE -D_ASM_GENERIC_IOCTL_H
DO_PREPARE  = 
MAKEARGS    = LDFLAGS=-static
STRIPPIT    = yes

FILES	    = /sbin/hdparm

include $(TOPDIR)/rules.mk

PATH   = $(TARGETROOT)/$(TARGETALIAS)/bin:$(TARGETROOT)/bin:/bin:/usr/bin
export PATH
