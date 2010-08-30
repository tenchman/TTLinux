# $Id: Makefile 1128 2007-09-06 19:30:05Z gernot $

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

VERSION	    = 1.2.11
NAME	    = libtar
FORMAT	    = tar.gz
PATCHES     = libtar-eof.patch
DO_PREPARE  = $(STAMP)-prepare
# avoid running of test programs
ARGS       += compat_cv_func_makedev_three_args=no
ARGS       += compat_cv_func_snprintf_works=yes
INSTALLARGS = INSTALL_PROGRAM='/usr/bin/install -c' install
LDFLAGS     = -static
STRIPPIT    = yes

FILES   = $(PREFIX)/bin/*
FILES  += $(PREFIX)/share/man/man3/*
FILES  += $(PREFIX)/lib-$(ARCH)/*
FILES  += $(PREFIX)/include/*

include $(TOPDIR)/rules.mk

