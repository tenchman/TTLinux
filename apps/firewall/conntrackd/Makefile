# $Id:$

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

NAME	    = conntrackd
VERSION	    = 0.9.2
FORMAT      = tar.gz
PATCHES     = conntrackd-0.9.2-limits.patch
CC         += -I$(KERNELINC)
CC	   += -D_GNU_SOURCE -D_BSD_SOURCE -D__KERNEL_STRICT_NAMES -D__GLIBC__=2
CC	   += -D__GNU_LIBRARY__ -Wno-deprecated-declarations
DO_PREPARE  = $(STAMP)-prepare
STRIPPIT    = yes
ARGS        = --prefix=$(PREFIX)
FILES       = $(PREFIX)/sbin/conntrackd

include $(TOPDIR)/rules.mk
