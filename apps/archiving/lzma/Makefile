# $Id: Makefile 170 2004-03-24 16:33:53Z gernot $

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

VERSION	    = 4.32
NAME	    = lzma
FORMAT	    = tar.gz
PATCHES     = lzma-4.32-make.patch
DO_PREPARE  = 
DO_BUILD    = $(STAMP)-mybuild
DO_INSTALL  = $(STAMP)-myinstall
PREFIX	    = /opt/diet
INSTALLARGS = PREFIX=/opt/diet LIBDIR=/opt/diet/lib-$(ARCH) install

MAKEARGS    = -f makefile.gcc prefix=$(PREFIX)

FILES	    = /opt/diet/bin/

CC+=-static
CXX+=-static

include $(TOPDIR)/rules.mk

$(STAMP)-mybuild: $(DO_PREPARE)
	(cd $(PKGBUILDDIR); \
		PATH=$(PATH); \
		$(MAKE) -C C/7zip/Archive/7z_C CXX='$(CC)' $(MAKEARGS); \
		$(MAKE) -C C/7zip/Compress/LZMA_C CXX='$(CC)' $(MAKEARGS); \
		$(MAKE) -C C/7zip/Compress/LZMA_Alone CXX='$(CXX)' CXX_C='$(CC)' $(MAKEARGS); \
		);
	touch $(STAMP)-mybuild

$(STAMP)-myinstall: $(DO_BUILD)
	install -d $(TMPDIR)$(PREFIX)/bin
	(cd $(PKGBUILDDIR); \
		install C/7zip/Compress/LZMA_C/lzmadec $(TMPDIR)$(PREFIX)/bin; \
		install C/7zip/Compress/LZMA_Alone/lzma $(TMPDIR)$(PREFIX)/bin; \
		install C/7zip/Archive/7z_C/7zDec $(TMPDIR)$(PREFIX)/bin; \
		);
	touch $(STAMP)-myinstall
