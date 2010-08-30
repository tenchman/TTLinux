# $Id: Makefile 223 2004-08-15 19:52:16Z gernot $

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

NAME	    = adns
VERSION	    = 1.4
FORMAT	    = tar.gz
PATCHES     = adns-1.4-install.patch
DO_PREPARE  = $(STAMP)-prepare
CFLAGS     += $(CFLAGS_S) -D_BSD_SOURCE 
STRIPPIT    = yes
# INSTALLARGS = instroot=$(TMPDIR) install

FILES	= $(PREFIX)/lib-$(ARCH)/* $(PREFIX)/include/* $(PREFIX)/bin/*

include $(TOPDIR)/rules.mk
