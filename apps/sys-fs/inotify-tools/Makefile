# $Id$

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

NAME	    = inotify-tools
VERSION	    = 3.13
FORMAT	    = tar.gz
PATCHES     = inotify-tools-cross.patch
PATCHES    += inotify-tools-static.patch
DO_PREPARE  = $(STAMP)-prepare
STRIPPIT    = yes
CFLAGS      = -D__flexarr=[]
LDFLAGS     = -lcompat -static
# INSTALLARGS = root_sbindir=/sbin bindir=/usr/bin sbindir=/usr/sbin install install-libs

FILES	= $(PREFIX)/include/* $(PREFIX)/lib-$(ARCH)/* $(PREFIX)/bin/*

include $(TOPDIR)/rules.mk
