# $Id:$

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

NAME	    = hping2
VERSION	    = rc3
FORMAT	    = tar.gz
PKGSRC	    = hping2.0.0-rc3.tar.gz
PATCHES	   += hping2-rc3-make.patch
DO_PREPARE  = $(STAMP)-prepare
STRIPPIT    = yes
CC	    += -D_GNU_SOURCE -D_BSD_SOURCE -Wno-deprecated-declarations -static
LDFLAGS	    += -static

FILES	    = ./usr/sbin/*

include $(TOPDIR)/rules.mk
