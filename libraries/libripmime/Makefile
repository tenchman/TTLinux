# $Id: Makefile 281 2004-09-23 15:39:24Z gernot $

include $(TOPDIR)/.config

NAME	    = ripmime
VERSION	    = 1.4.0.7
FORMAT	    = tar.gz
PRENAME	    = lib
PATCHES	    = ripmime-1.4.0.5-make.patch
PATCHES	   += ripmime-1.4.0.5-charset.patch
DO_PREPARE  =
DO_INSTALL  = $(STAMP)-myinstall
STRIPPIT    = yes
MAKEARGS    = CFLAGS='$(CFLAGS_S) -D_BSD_SOURCE'
INSTALLARGS = CFLAGS='$(CFLAGS_S) -D_BSD_SOURCE' LOCATION=$(TMPDIR) LIBDIR=$(PREFIX)/lib-$(ARCH) INCLUDEDIR=$(PREFIX)/include/ripmime install_lib
PREFIX	    = /opt/diet

FILES	= .$(PREFIX)/lib-$(ARCH) .$(PREFIX)/include

include $(TOPDIR)/rules.mk

$(STAMP)-myinstall: $(DO_BUILD) $(DO_PREPARE)
	mkdir -p $(TMPDIR)$(PREFIX)/{lib,lib-$(ARCH),bin,include}
	PATH=$(PATH) \
	$(MAKE) -C $(PKGBUILDDIR) CC='$(CC)' DESTDIR=$(TMPDIR) $(INSTALLARGS)
	install -d $(TMPDIR)$(PREFIX)/include/$(NAME)
	cd $(PKGBUILDDIR) && install -m 644 mime.h $(TMPDIR)$(PREFIX)/include/$(NAME)
	touch $(STAMP)-myinstall


