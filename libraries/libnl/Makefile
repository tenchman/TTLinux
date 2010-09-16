# $Id$

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

NAME	    = libnl
FORMAT	    = tar.gz
VERSION	    = 1.1
PATCHES     = libnl-diet.patch
PATCHES    += libnl-compat.patch
PATCHES    += libnl-static.patch
CFLAGS     += -DNDEBUG -D_BSD_SOURCE -ffunction-sections -fdata-sections
LDFLAGS    += -lm
STRIPPIT    = yes
DO_PREPARE  = $(STAMP)-prepare
FILES	    = ./opt/diet/lib-$(ARCH)/
FILES	   += ./opt/diet/include/

include $(TOPDIR)/rules.mk
