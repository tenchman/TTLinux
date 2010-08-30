# $Id: Makefile 911 2007-02-15 22:34:15Z gernot $

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

NAME	      = gcc
VERSION	      = 4.2.2
FORMAT	      = tar.bz2
CFLAGS	      = -D__dietlibc__ -pipe
CXXFLAGS      = -Os -D__dietlibc__ -pipe -D_BSD_SOURCE -D_GNU_SOURCE
PATCHES	      = gcc-4.1.2-diet.patch
PATCHES	     += gcc-3.4.1-percent_n.patch
PREFIX	      = /opt/diet
ARCHLIBDIR    = $(PREFIX)/lib-$(ARCH)

CONFIGARGS    = --prefix=$(PREFIX) --with-local-prefix=$(PREFIX)/local
CONFIGARGS   += --disable-__cxa_atexit --disable-checking --disable-libunwind-exceptions
CONFIGARGS   += --enable-nls=no --enable-c-mbchar=no --enable-clocale=no --enable-wchar_t=no
CONFIGARGS   += --program-prefix=$(TARGETALIAS)- --enable-sjlj-exceptions
CONFIGARGS   += --libdir=$(ARCHLIBDIR) --includedir=$(PREFIX)/include
CONFIGARGS   += --build=$(HOSTALIAS)
CONFIGARGS   += --host=$(HOSTALIAS)
CONFIGARGS   += --target=$(TARGETALIAS)

TARGETARGS   += AR_FOR_TARGET=$(TARGETALIAS)-ar
TARGETARGS   += AS_FOR_TARGET=$(TARGETALIAS)-as
TARGETARGS   += LD_FOR_TARGET=$(TARGETALIAS)-ld
TARGETARGS   += RANLIB_FOR_TARGET=$(TARGETALIAS)-ranlib
TARGETARGS   += AR=$(TARGETALIAS)-ar
TARGETARGS   += AS=$(TARGETALIAS)-as
TARGETARGS   += LD=$(TARGETALIAS)-ld
TARGETARGS   += RANLIB=$(TARGETALIAS)-ranlib

# i386 architecture
ifeq ($(ARCH),i386)
CONFIGARGS   += --enable-threads=posix
MAKEARGS     += $(TARGETARGS) bootstrap
ifeq ($(CONFIG_GCC_STATIC),)
CC	      = $(PREFIX)/bin/diet-dyn $(HOSTCC)
CONFIGARGS   += --enable-shared
XCFLAGS       = XCFLAGS='-Os -fPIC -D_BSD_SOURCE -D_GNU_SOURCE'
BOOT_CFLAGS   = BOOT_CFLAGS='-Os -fPIC -D_BSD_SOURCE -D_GNU_SOURCE'
else
CC	      = $(PREFIX)/bin/diet $(HOSTCC)
CONFIGARGS   += --disable-shared
CONFIGARGS   += --enable-languages=c,c++
XCFLAGS       = XCFLAGS='-Os -D_BSD_SOURCE -D_GNU_SOURCE'
BOOT_CFLAGS   = BOOT_CFLAGS='-Os -D_BSD_SOURCE -D_GNU_SOURCE'
XLDFLAGS      = XLDFLAGS='-static'
endif
# other archs
else
MAKEARGS     += $(TARGETARGS)
CONFIGARGS   += --enable-threads=single --enable-newlib
endif

STRIPPIT      = yes

DO_PREPARE    = $(STAMP)-myprepare
DO_BUILD      =	$(STAMP)-mybuild
DO_INSTALL    = $(STAMP)-myinstall
DO_CLEAN      = $(STAMP)-myclean

FILES = .$(PREFIX)/

include $(TOPDIR)/rules.mk

STAGEDIR  = $(PACKAGE)/$(HOSTVER)

$(STAMP)-myprepare:
	rm -rf $(STAGEDIR)
	mkdir -p $(STAGEDIR)
	(cd $(STAGEDIR); \
		PATH=$(DISTDIR)$(PREFIX)/bin:$$PATH \
		CC='$(CC)' $(TARGETARGS) \
		../configure $(CONFIGARGS) \
	);
	touch $(STAMP)-myprepare

$(STAMP)-mybuild: $(DO_PREPARE)
	(cd $(STAGEDIR); \
		PATH=$(DISTDIR)$(PREFIX)/bin:$(DISTDIR)$(PREFIX)/$(TARGETALIAS)/bin:$$PATH \
		$(MAKE) $(XCFLAGS) $(XLDFLAGS) $(BOOT_CFLAGS) CXXFLAGS='$(CXXFLAGS)' \
		$(MAKEARGS) \
	);
	touch $(STAMP)-mybuild

$(STAMP)-myinstall: $(DO_BUILD)
	(cd $(STAGEDIR); \
		PATH=$(PREFIX)/bin:$$PATH \
		$(MAKE) DESTDIR=$(TMPDIR) install \
	);
	rm -f $(TMPDIR)$(PREFIX)/bin/$(ARCH)-*-$(ARCH)-*
	touch $(STAMP)-myinstall

$(STAMP)-myclean:
	@echo "==> cleaning $(PACKAGE)"
	@rm -rf $(PACKAGE)
	@rm -rf $(STAGEDIR)
	@rm -f $(STAGES)

