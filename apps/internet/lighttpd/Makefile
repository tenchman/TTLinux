# $Id: Makefile 1302 2008-03-13 23:50:46Z gernot $
include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

NAME	    = lighttpd
VERSION	    = 1.4.18
FORMAT	    = tar.bz2
STRIPPIT    = yes
DO_PREPARE  = $(STAMP)-prepare
PREFIX	    = /usr
CC	   += $(CFLAGS_S) -ffunction-sections -fdata-sections -D_GNU_SOURCE -D_BSD_SOURCE
LDFLAGS	   += -Wl,--gc-sections
FILES       = /usr/lib-i386/mod*.so /usr/sbin/lighttpd /usr/bin/spawn-fcgi /usr/share/man/man1/*

include $(TOPDIR)/rules.mk
