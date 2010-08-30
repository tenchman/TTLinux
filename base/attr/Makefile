# $Id: Makefile 1310 2008-03-18 17:12:06Z gernot $

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

NAME	    = attr
VERSION	    = 2.4.41
FORMAT	    = tar.gz
PATCHES	    = attr-build.patch
CFLAGS	   += -D_BSD_SOURCE -D_GNU_SOURCE
DO_PREPARE  = $(STAMP)-myprepare
DO_INSTALL  = $(STAMP)-myinstall
DO_AUTOCONF = $(STAMP)-autoconf259
MAKEARGS    = LDFLAGS=-lcompat CPPFLAGS="-D_="
STRIPPIT    = yes
ARGS        = --bindir=/usr/bin --disable-gettext $(HOSTARGS)
INSTALLARGS = install install-dev install-lib

FILES	= /opt/diet/{lib-$(ARCH)/*.{a,so*},include/*} /usr/bin/*

include $(TOPDIR)/rules.mk

$(STAMP)-myprepare: $(STAMP)-prepare
	perl -pi -e "s,/usr/bin/libtool,/opt/diet/bin/libtool," $(PACKAGE)/include/builddefs
	touch $(STAMP)-myprepare

$(STAMP)-myinstall: $(STAMP)-install
	install $(PACKAGE)/libattr/.libs/libattr.a $(TMPDIR)/opt/diet/lib-$(ARCH)/
	touch $(STAMP)-myinstall
