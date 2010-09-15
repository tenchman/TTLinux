# $Id$

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

NAME	    = ifplugd
FORMAT	    = tar.gz
VERSION	    = 0.28
ifeq ($(CONFIG_PACKAGE_STATIC),y)
LDFLAGS    += -static
CC          = $(COMPILER)
endif
CFLAGS     += -D_GNU_SOURCE -D_BSD_SOURCE
ARGS       += --disable-lynx
PREFIX      = /usr
STRIPPIT    = yes
DO_PREPARE  = $(STAMP)-prepare $(STAMP)-fixtypes
FILES	    = /

include $(TOPDIR)/rules.mk

$(STAMP)-fixtypes:
	sed -i -e "s/__uint/uint/" $(PKGBUILDDIR)/src/ethtool-local.h
	touch $@
