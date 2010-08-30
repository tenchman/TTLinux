# $Id: Makefile 281 2004-09-23 15:39:24Z gernot $

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

NAME	    = ripmime
VERSION	    = 1.4.0.7
FORMAT	    = tar.gz
PATCHES	    = ripmime-make.patch
PATCHES	   += ripmime-1.4.0.5-charset.patch
DO_PREPARE  =
STRIPPIT    = yes
MAKEARGS    = CFLAGS='$(CFLAGS_S)'
INSTALLARGS = LOCATION=$(TMPDIR) install

FILES	= ./bin/ripmime

include $(TOPDIR)/rules.mk
