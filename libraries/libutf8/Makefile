# $Id: Makefile 228 2004-08-23 11:56:50Z gernot $

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

NAME	    = libutf8
VERSION	    = 0.8
FORMAT	    = tar.gz
DO_PREPARE  = $(STAMP)-prepare
PATCHES	    = libutf8-0.8-destdir.patch
PATCHES	   += libutf8-0.8-noplugin.patch
ARGS	    = --enable-static --with-gnu-ld
ifeq ($(SHARED),y)
ARGS	   += --enable-shared
else
ARGS       += --disable-shared
endif

PREFIX	    = /opt/diet

FILES	= ./opt/diet/lib-$(ARCH)
FILES  += ./opt/diet/include

include $(TOPDIR)/rules.mk
