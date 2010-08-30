# $Id$

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

NAME	    = libdaemon
FORMAT	    = tar.gz
VERSION	    = 0.14
ifeq ($(CONFIG_PACKAGE_STATIC),y)
LDFLAGS    += -static
CC          = $(COMPILER)
endif
PREFIX      = /usr
STRIPPIT    = yes
DO_PREPARE  = $(STAMP)-prepare $(STAMP)-fixup
FILES	    = /

include $(TOPDIR)/rules.mk

$(STAMP)-fixup:
	sed -i -e "s:sys/unistd.h:unistd.h:" $(PKGBUILDDIR)/examples/testd.c
	touch $@
