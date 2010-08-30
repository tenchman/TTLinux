# $Id: Makefile 1302 2008-03-13 23:50:46Z gernot $

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

VERSION	      = 1.3.3
NAME	      = mawk
FORMAT	      = tar.gz
PATCHES	      = mawk-1.3.3-misc.patch mawk-1.3.3-builtin.patch
DO_PREPARE    = $(STAMP)-myprepare
PREFIX	      = /usr
MAKEARGS      = mawk
STRIPPIT      = yes
INSTALLARGS   = bindir=$(TMPDIR)/bin
INSTALLARGS  += mandir=$(TMPDIR)/usr/share/man install

FILES	= ./bin/mawk

include $(TOPDIR)/rules.mk

$(STAMP)-myprepare: Makefile
	(cd $(PKGBUILDDIR); CC="$(CC)" CFLAGS="$(CFLAGS_S)" ./configure \
		--prefix=$(PREFIX) \
		$(ARGS) );
	touch $(STAMP)-myprepare

