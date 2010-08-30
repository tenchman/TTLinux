# $Id: Makefile 280 2004-09-20 13:19:37Z gernot $

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

VERSION	    = 1.0.0-p5
NAME	    = libspf
FORMAT	    = tar.bz2
PATCHES     = libspf-1.0.0-p5-diet.patch
DO_PREPARE  = $(STAMP)-myprepare
PREFIX	    = /opt/diet
CC         += -D_GNU_SOURCE -D_BSD_SOURCE
ARGS 	    = --enable-static --enable-shared
ifneq ($(TTL_KERNELARCH), x86)
ARGS       += ac_cv_sizeof_int=4
endif
FILES	    = /opt/diet/lib-$(ARCH)
FILES	   += /opt/diet/include
FILES      += /opt/diet/bin

include $(TOPDIR)/rules.mk

$(STAMP)-fixperms: Makefile
	rm -f $(PKGBUILDDIR)/libtool $(PKGBUILDDIR)/build_tools/ltmain.sh
	chmod 755 $(PKGBUILDDIR)/configure
	touch $@

$(STAMP)-myprepare: $(STAMP)-patch $(STAMP)-fixperms $(STAMP)-autoconf259 $(STAMP)-prepare
	touch $@
