# $Id: Makefile 1310 2008-03-18 17:12:06Z gernot $

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

NAME	    = acl
VERSION	    = 2.2.39
FORMAT	    = tar.gz
PATCHES	    = acl-build.patch
PATCHES	   += acl-errno.patch
CFLAGS	   += -D_BSD_SOURCE -D_GNU_SOURCE
LDFLAGS     = -lcompat
DO_AUTOCONF = $(STAMP)-autoconf213
DO_PREPARE  = $(STAMP)-myprepare
DO_INSTALL  = $(STAMP)-myinstall
STRIPPIT    = yes
ARGS       += --bindir=/usr/bin $(HOSTARGS) LD='$(LD)'
MAKEARGS    = LDFLAGS=-lcompat LD='$(LD)'
INSTALLARGS = install install-dev install-lib

FILES	= /opt/diet/{lib-$(ARCH)/*.{a,so*},include/*} /usr/bin/*

include $(TOPDIR)/rules.mk

$(STAMP)-myprepare: $(STAMP)-prepare
	perl -pi -e "s,/usr/bin/libtool,/opt/diet/bin/libtool," $(PACKAGE)/include/builddefs
	touch $(STAMP)-myprepare

$(STAMP)-myinstall: $(STAMP)-install
	install $(PACKAGE)/libacl/.libs/libacl.a $(TMPDIR)/opt/diet/lib-$(ARCH)/
	touch $(STAMP)-myinstall
