# $Id: Makefile 1239 2008-01-14 20:01:20Z gernot $

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

VERSION	      = 2.7.1
NAME	      = e3
FORMAT	      = tar.gz
PATCHES	      = e3-2.6.1-make.patch
DO_PREPARE    = 
INSTALLARGS   = BINDIR=$(TMPDIR)/bin MANDIR=$(TMPDIR)/usr/share/man install

FILES	= ./bin/*

include $(TOPDIR)/rules.mk
