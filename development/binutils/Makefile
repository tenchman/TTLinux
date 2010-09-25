# $Id: Makefile 1302 2008-03-13 23:50:46Z gernot $

include $(TOPDIR)/.config

NAME	      = binutils
VERSION	      = 2.17
FORMAT	      = tar.bz2
CFLAGS	      = -Wno-deprecated-declarations -fomit-frame-pointer -D_BSD_SOURCE
PATCHES	      = patches/binutils-ldmake.patch
PATCHES	     += patches/binutils-diet.patch
LDFLAGS	      = -nostdlib
DO_PREPARE    = $(STAMP)-myprepare
ARCHLIBDIR    = $(PREFIX)/lib-$(ARCH)

include $(TOPDIR)/rules.mk

ARGS	      = --prefix=$(PREFIX) --exec-prefix=$(PREFIX)
ARGS	     += --disable-__cxa_atexit --enable-nls=no
ARGS         += --program-prefix=$(TARGETALIAS)-
ARGS         += --libdir=$(ARCHLIBDIR) --includedir=$(PREFIX)/include
ARGS	     += --build=$(BUILDALIAS) --host=$(HOSTALIAS) --target=$(TARGETALIAS)
CC	      = diet -Os $(HOSTCC) -nostdinc
ARGS	     += --disable-shared --enable-werror=no

LOADER	      = $(PREFIX)/lib-$(ARCH)/libdl.so
STRIPPIT      = yes

FILES	= .$(PREFIX)/*


$(STAMP)-myprepare: Makefile
	(cd $(PACKAGE); \
		sed -i -e "s,#.*define.*ELF_DYNAMIC_INTERPRETER.*\".*\",\
		#define ELF_DYNAMIC_INTERPRETER \"$(LOADER)\",;" \
		`grep -lr ELF_DYNAMIC_INTERPRETER *`; \
		[ "$(VERBOSE)" != "y" ] && sed -i -e "s,-Wtraditional,," libiberty/configure; \
		CC='$(CC)' ./configure $(ARGS) );
	touch $(STAMP)-myprepare
