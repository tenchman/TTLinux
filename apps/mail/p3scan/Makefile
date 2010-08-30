# $Id$
# uses its own Makefile without configuring
# see p3scan-diet-patch

include $(TOPDIR)/.config
#include $(TOPDIR)/$(ARCH).config

NAME	    = p3scan
FORMAT	    = tar.gz
VERSION	    = 2.3.2
PATCHES     = patches/p3scan-diet.patch
FILES       = /
LDFLAGS    += -Wl,--gc-sections

include $(TOPDIR)/rules.mk

