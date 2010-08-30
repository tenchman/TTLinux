# $Id: Makefile 280 2004-09-20 13:19:37Z gernot $

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

VERSION	    = 6b
NAME	    = jpeg
FORMAT	    = tar.bz2
PKGSRC	    = jpegsrc.v6b.tar.bz2
PATCHES	    = patches/libjpeg-6b-arm.patch
PATCHES	   += patches/jpeg-c++.patch
PATCHES	   += patches/libjpeg-shared.patch
PATCHES	   += patches/libjpeg-rpath.patch
PATCHES	   += patches/libjpeg-install.patch
DO_PREPARE  = $(STAMP)-prepare
PREFIX	    = /opt/diet
ARGS 	    = --enable-static $(HOSTARGS)
ARGS       += --enable-shared LDFLAGS='-L/opt/diet/lib-$(ARCH)'
FILES	    = ./opt/diet/lib-$(ARCH)
FILES	   += ./opt/diet/include

include $(TOPDIR)/rules.mk
