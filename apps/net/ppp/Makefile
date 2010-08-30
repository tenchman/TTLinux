# $Id: Makefile 1742 2009-08-24 15:48:50Z gernot $

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

VERSION	    = 2.4.4
PATCHLEVEL  = 2
NAME	    = ppp
FORMAT	    = tar.gz
PATCHES	    = ppp-destdir.patch
PATCHES	   += ppp-diet.patch
PATCHES    += killaddr-smarter.patch
PATCHES    += ppp-ip_pre_down.patch
CC	   += -D_BSD_SOURCE -D_GNU_SOURCE -Wno-deprecated-declarations $(CFLAGS)
DO_PREPARE  = $(STAMP)-myprepare
DO_INSTALL  = $(STAMP)-myinstall

FILES	    = /usr/sbin/* /usr/lib/pppd/* $(PREFIX)/include/*

include $(TOPDIR)/rules.mk

PATH   = $(TARGETROOT)/$(TARGETALIAS)/bin:$(TARGETROOT)/bin:/bin:/usr/bin
export PATH

$(STAMP)-myprepare: $(STAMP)-patch $(DO_AUTOCONF)
	echo "MAKEARGS= $(MAKEARGS)"
	(cd $(PKGBUILDDIR); \
		CC='$(CC)' ./configure \
		--prefix=/usr \
		--incdir=$(PREFIX)/include \
		--sysconfdir=/etc $(MAKEARGS) \
	);
	touch $(STAMP)-myprepare

$(STAMP)-myinstall: $(STAMP)-install
	install -d $(TMPDIR)$(PREFIX)/include/linux
	install -d $(TMPDIR)$(PREFIX)/include/net
	install -m 644 $(PKGBUILDDIR)/include/linux/*ppp*.h $(TMPDIR)$(PREFIX)/include/linux
	install -m 644 $(PKGBUILDDIR)/include/net/*.h $(TMPDIR)$(PREFIX)/include/net
	touch $(STAMP)-myinstall
