# $Id: Makefile 1305 2008-03-17 06:50:59Z gernot $

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

NAME	    = pcre
VERSION	    = 7.6
FORMAT	    = tar.bz2
DO_PREPARE  = $(STAMP)-prepare
ARGS	    = LD="ld" --enable-static --with-link-size=2

ifneq ($(SHARED),y)
ARGS	   += --disable-shared
else
ARGS       += --enable-shared
endif

ifneq ($(CPLUSPLUS),y)
ARGS	   += --disable-cpp
endif

INSTALLARGS = includedir=$(PREFIX)/include/pcre install
PREFIX	    = /opt/diet

FILES	= /opt/diet/lib-$(ARCH)
FILES  += /opt/diet/include/pcre
FILES  += /opt/diet/bin/pcre-config

include $(TOPDIR)/rules.mk
