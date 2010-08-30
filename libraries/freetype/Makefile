# $Id: Makefile 1376 2008-04-30 06:43:11Z gernot $

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

VERSION	     = 2.3.5
NAME	     = freetype
FORMAT	     = tar.gz
DO_PREPARE   = $(STAMP)-myprepare
DO_BUILD     = $(STAMP)-mybuild
PREFIX	     = /opt/diet
STRIPPIT     = yes
LIBTOOL      = ""

FILES	    = $(PREFIX)/lib-$(ARCH)
FILES	   += $(PREFIX)/include

include $(TOPDIR)/rules.mk

$(STAMP)-myprepare: $(STAMP)-patch $(DO_AUTOCONF)
	(cd $(PKGBUILDDIR); \
		export PKG_CONFIG_PATH=$(PKG_CONFIG_PATH) PATH=$(PATH); \
		CC='$(COMPILER)' ./configure --host=$(TARGETALIAS) \
		$(DISABLENLS) --prefix=$(PREFIX) \
		--mandir=$(PREFIX)/share/man \
		--libdir=$(PREFIX)/lib-$(ARCH) \
		--infodir=$(PREFIX)/share/info \
		--sysconfdir=/etc $(ARGS) \
	);
	touch $(STAMP)-myprepare

$(STAMP)-mybuild: $(DO_PREPARE)
	(cd $(PKGBUILDDIR); \
		PATH=$(PATH); \
		$(MAKE) \
		);
	touch $(STAMP)-mybuild


