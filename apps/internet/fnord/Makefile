# $Id: Makefile 386 2005-01-14 18:17:38Z gernot $

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

NAME	    = fnord
VERSION	    = 1.10
FORMAT	    = tar.bz2
PATCHES	    = fnord-1.9-make.patch
PATCHES    += fnord-1.9-mime.patch
PATCHES    += fnord-1.10-timezone.patch
STRIPPIT    = yes
PREFIX      = /usr
MAKEARGS    = DIET="" CFLAGS='$(CFLAGS_S)'
CC          = $(COMPILER) -static

FILES  = /command/*

include $(TOPDIR)/rules.mk
