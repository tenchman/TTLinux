# $Id$

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

NAME	    = libusb
FORMAT	    = tar.bz2
VERSION	    = 1.0.8
CFLAGS     += -D_BSD_SOURCE
STRIPPIT    = yes
DO_PREPARE  = $(STAMP)-prepare
FILES	    = /

include $(TOPDIR)/rules.mk
