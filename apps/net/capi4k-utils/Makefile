# $Id: Makefile 1548 2009-01-15 22:03:48Z gernot $

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

VERSION	    = 2005-07-18
NAME	    = capi4k-utils
FORMAT	    = tar.gz
PATCHES	    = capi4k-utils-ttlinux.patch
INSTALLARGS = install INSTALL_PREFIX=$(TMPDIR)
CC	   += -D_BSD_SOURCE -D_GNU_SOURCE -Wno-deprecated-declarations
CC         += -D__KERNEL_STRICT_NAMES -D__GLIBC__=2 $(TTL_KERNELINC) -g
MAKEARGS   += PPPVERSIONS=2.4.4
DO_PREPARE  = $(STAMP)-myprepare
DO_POSTINST = $(STAMP)-mypostinst

$(STAMP)-myprepare:
	( cd $(PKGBUILDDIR); \
	cp Makefile Makefile.tmp; \
	make -f Makefile.tmp subconfig; \
	rm -f Makefile.tmp; \
	rm -f pppdcapiplugin/pppd.h pppdcapiplugin/*.so; \
	cp -r pppdcapiplugin/ppp-2.4.3 pppdcapiplugin/ppp-2.4.4; \
	rm -f  pppdcapiplugin/ppp-2.4.4/pppd/*.ttlinux; )
	touch $@

$(STAMP)-mypostinst:
	cp $(TMPDIR)/usr/lib/libcapi20.so.3.0.4 $(TMPDIR)/opt/diet/lib-$(ARCH)/libcapi20.so
	touch $@

include $(TOPDIR)/rules.mk
