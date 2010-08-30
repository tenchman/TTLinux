# $Id: Makefile 1716 2009-07-14 22:05:01Z gernot $

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

VERSION	    = 1.2.3
NAME	    = zlib
FORMAT	    = tar.bz2
PATCHES	    = zlib-1.2.1-diet.patch
LDSHARED    = $(CC) -shared -Wl,-soname,libz.so.1
ARGS	    = --shared
MAKEARGS    = all libz.a CFLAGS='-DUSE_MMAP $(CFLAGS)'
DO_PREPARE  = $(STAMP)-libzprepare
INSTALLARGS = LIBS='libz.so.$(VERSION) libz.a' install

FILES	= /opt/diet/lib-$(ARCH)
FILES  += /opt/diet/include

include $(TOPDIR)/rules.mk

$(STAMP)-libzprepare: Makefile
	(cd $(PKGBUILDDIR); \
		cp contrib/asm686/match.S .; \
		CC="$(CC)" LDSHARED="$(LDSHARED)" ./configure \
		--prefix=/opt/diet \
		--libdir=/opt/diet/lib-$(ARCH) \
		$(ARGS) );
	touch $@

