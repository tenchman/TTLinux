# $Id: Makefile 506 2005-11-25 07:48:26Z gernot $

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

NAME	    = maildrop
VERSION	    = 2.0.1
FORMAT	    = tar.bz2
DO_PREPARE  = $(STAMP)-prepare
ARGS	    = --without-db --with-db=no --disable-authlib --enable-unicode
ARGS       += --with-locking-method=fcntl
ifneq ($(ARCH),i386)
  ARGS     += ac_cv_func_setpgrp_void=yes
endif
PATCHES     = maildrop-2.0.1-db.patch
PATCHES    += maildrop-2.0.1-sig.patch
PATCHES    += maildrop-2.0.1-charset.patch
PATCHES    += maildrop-2.0.1-install.patch
CC         += -D_BSD_SOURCE
MAKE_ARGS   = static CC='$(CC)' CXX='$(CXX)'
PREFIX	    = /usr
STRIPPIT    = yes

FILES	= /

include $(TOPDIR)/rules.mk
