# $Id: Makefile 275 2004-09-19 17:49:20Z gernot $

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

NAME	    = sqlite2
FORMAT      = tar.gz
VERSION	    = 2.8.17
REALNAME    = sqlite-$(VERSION)
PKGSRC      = $(REALNAME).$(FORMAT)

PATCHES	    = sqlite-2.8.15-make.patch
ifneq ($(ARCH),i386)
PATCHES	   += sqlite-cross.patch
endif
DO_PREPARE  = $(STAMP)-myprepare
PREFIX	    = /opt/diet
CFLAGS     += -DNO_TCL=1 -DSQLITE_DISABLE_LFS
MAKEARGS    = READLINE_FLAGS="" TCL_FLAGS=""

FILES	= ./opt/diet/lib-$(ARCH)/*.[as]*
FILES  += ./opt/diet/include

include $(TOPDIR)/rules.mk

unexport CC STRIP LD CXX CXXFLAGS

ifeq ($(ARCH),i386)
  OURCC = CC='$(CC)'
else
  OURCC = TARGET_CC='$(CC)' BUILD_CC='$(HOSTCC)'
endif

$(STAMP)-myprepare: $(STAMP)-patch $(DO_AUTOCONF)
	(cd $(PKGBUILDDIR); \
		export PKG_CONFIG_PATH=$(PKG_CONFIG_PATH) PATH=$(PATH); \
		$(OURCC) ./configure \
		$(DISABLENLS) $(HOSTARGS) --prefix=$(PREFIX) \
		--mandir=$(PREFIX)/share/man \
		--libdir=$(PREFIX)/lib-$(ARCH) \
		--infodir=$(PREFIX)/share/info \
		--sysconfdir=/etc $(ARGS) \
	);
	touch $@
