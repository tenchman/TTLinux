# $Id$

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

NAME	    = iw
FORMAT	    = tar.bz2
VERSION	    = 0.9.21
PATCHES    += patches/iw-errno.patch
PATCHES    += patches/iw-libm.patch
CFLAGS     += -D_GNU_SOURCE -D_BSD_SOURCE
LDFLAGS    += -static -Wl,--gc-sections
PREFIX      = /usr
STRIPPIT    = yes
DO_PREPARE  =
FILES	    = /usr/sbin/iw

include $(TOPDIR)/rules.mk
