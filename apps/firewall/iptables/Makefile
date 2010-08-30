# $Id:$

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

NAME	    = iptables
VERSION	    = 1.4.4
FORMAT      = tar.bz2
PATCHLEVEL  = 2
PATCHES    += patches/iptables-argorder.patch
PATCHES    += patches/iptables-getopt.patch

CC	   += -D_GNU_SOURCE -D_BSD_SOURCE -D__KERNEL_STRICT_NAMES -D__GLIBC__=2
CC	   += -D__GNU_LIBRARY__ -Wno-deprecated-declarations -DUINT32_MAX=\(4294967295U\)
CC         += -DUINT8_MAX=\(255\) -DUINT16_MAX=\(65535\)
CC         += -DUINT64_MAX=\(18446744073709551615ULL\)
CC         += $(CPPFLAGS) -DNO_SHARED_LIBS=1 -g

DO_PREPARE  = $(STAMP)-autoconf $(STAMP)-prepare
DO_INSTALL  = $(STAMP)-myinstall
LDFLAGS     = -lcompat
ARGS        = --bindir=/usr/bin --sbindir=/sbin --quiet
ARGS       += --enable-devel --enable-libipq --disable-shared
STRIPPIT    = yes
MAKEARGS    = CCLD='$(COMPILER) -all-static' libxtables_la_LIBADD=-lcompat LIBS=-lcompat

FILES       = /sbin/* /usr/bin/* /opt/diet/include/* /opt/diet/lib-$(ARCH)/*

include $(TOPDIR)/rules.mk

$(STAMP)-myinstall: $(STAMP)-install
	mkdir -p $(TMPDIR)/opt/diet/include/libiptc
	cd $(PACKAGE) && cp include/libiptc/*.h $(TMPDIR)/opt/diet/include/libiptc || :
	cd $(PACKAGE) && cp libiptc/libiptc.a $(TMPDIR)/opt/diet/lib-$(ARCH) || :
	( cd $(TMPDIR)/sbin; \
	  for i in iptables iptables-restore iptables-save iptables-xml; do \
	  	ln -sf iptables-static $$i; \
	  done; \
	  for i in ip6tables ip6tables-restore ip6tables-save ip6tables-xml; do \
	  	ln -sf ip6tables-static $$i; \
	  done; \
	)
	touch $@
