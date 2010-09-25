# $Id: Makefile 1302 2008-03-13 23:50:46Z gernot $

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

NAME	    = matrixssl
VERSION	    = 1-7-3-open
FORMAT	    = tar.gz
LDFLAGS	    = -L/opt/diet/lib
DFLAGS	    = -Os -fomit-frame-pointer
DFLAGS     += -ffunction-sections -fdata-sections
STRIPPIT    = yes
PATCHES	    = patches/matrixssl-1-2-5-pthread.patch
PATCHES    += patches/matrixssl-1-0-make.patch
PATCHES	   += patches/matrixssl-1-2-5-config.patch
PATCHES	   += patches/matrixssl-1-7-3-dbg.patch
PATCHES    += patches/matrixssl-1-7-1-getciphername.patch
PATCHES	   += patches/matrixssl-1-7-1-serial.patch
PATCHES    += patches/matrixssl-1-7-1-ian.patch
PATCHES    += patches/matrixssl-1-7-3-stdio.patch
# prevent clashes with qmail etc.pp.
PATCHES    += patches/matrixssl-1-7-1-int32.patch
PATCHES	   += patches/matrixssl-1-7-1-commonName.patch

ifeq ($(CONFIG_MATRIXSSL_DEBUG),y)
CC	   += -DDEBUG
else
CC	   += -DNDEBUG
endif
DO_PREPARE  = 
DO_INSTALL  = $(STAMP)-myinstall
DO_BUILD    = $(STAMP)-mybuild
TARGETS	    = libmatrixssl.a
ifeq ($(CONFIG_MATRIXSSL_SHARED),y)
TARGETS	   += libmatrixssl.so
endif
FILES	= ./

INCDIR = $(TMPDIR)$(TARGETROOT)/include/matrixssl

include $(TOPDIR)/rules.mk

$(STAMP)-mybuild:
	PATH=$(TARGETROOT)/bin:$$PATH \
	$(MAKE) -C $(PKGBUILDDIR)/src CC='$(CC)' DFLAGS='$(DFLAGS)' $(TARGETS); \
	touch $@

$(STAMP)-myinstall:
	install -d $(TMPDIR)$(TARGETLIBDIR); \
	install -d $(INCDIR); \
	install $(PKGBUILDDIR)/matrix*.h $(INCDIR); \
	(cd $(PKGBUILDDIR)/src; \
	  for i in `find . -name '*.h' -print`; do install $$i $(INCDIR); done; \
	  install $(TARGETS) $(TMPDIR)$(TARGETLIBDIR); \
	  sed -i -e 's,\.\./,,g' $(INCDIR)/*.h; \
	  sed -i -e 's,pki/,,' $(INCDIR)/*.h; \
	  sed -i -e 's,src/,,' $(INCDIR)/*.h; \
	  sed -i -e 's,os/,,' $(INCDIR)/*.h; \
	  sed -i -e 's,peersec/,,' $(INCDIR)/*.h; \
	  sed -i -e 's,crypto/,,' $(INCDIR)/*.h; \
	);
	touch $@
