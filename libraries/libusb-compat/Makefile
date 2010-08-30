# $Id$

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

NAME	    = libusb-compat
FORMAT	    = tar.bz2
VERSION	    = 0.1.3
CFLAGS     += -D_GNU_SOURCE
STRIPPIT    = yes
DO_PREPARE  = $(STAMP)-prepare
FILES	    = /

include $(TOPDIR)/rules.mk
