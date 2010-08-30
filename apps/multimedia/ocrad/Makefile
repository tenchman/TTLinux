# $Id: Makefile 276 2004-09-19 20:28:28Z gernot $

include $(TOPDIR)/.config
include $(TOPDIR)/$(SRCH).config

NAME	    = ocrad
VERSION	    = 0.18
FORMAT	    = tar.bz2
STRIPPIT    = yes
# PATCHES     = ocrad-diet.patch
DO_PREPARE  = $(STAMP)-myprepare
PREFIX	    = /usr
CFLAGS	    = $(CFLAGS_S)
CXXFLAGS    = 
MAKEARGS    = CXX='$(CXX) -fPIC -pipe' CXXFLAGS='$(CFLAGS_S)'
INSTALLARGS = PATH=$(PATH):/sbin install

FILES	    = /usr/bin/ocrad /usr/share/info/ocrad.info

include $(TOPDIR)/rules.mk

$(STAMP)-myprepare: $(STAMP)-patch $(DO_AUTOCONF)
	(cd $(PKGBUILDDIR); \
		export PKG_CONFIG_PATH=$(PKG_CONFIG_PATH); \
		CC="$(CC)" ./configure \
		--prefix=$(PREFIX) \
		--mandir=$(PREFIX)/share/man \
		--infodir=$(PREFIX)/share/info \
		);
	touch $(STAMP)-myprepare

