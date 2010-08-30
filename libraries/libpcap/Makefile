# $Id: Makefile 1710 2009-07-10 20:00:44Z gernot $

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

VERSION	    = 1.0.0
NAME	    = libpcap
FORMAT	    = tar.gz
PATCHES    += libpcap-cross.patch
CFLAGS	   += -nostdinc -D_BSD_SOURCE $(CFLAGS_S) -Wno-deprecated-declarations $(KERNELFLAGS) $(TTL_KERNELINC)
DO_PREPARE  = $(STAMP)-cleanheader
PREFIX	    = /opt/diet
ARGS       += --with-pcap=linux
FILES	    = $(PREFIX)/lib-$(ARCH)
FILES	   += $(PREFIX)/include $(PREFIX)/bin

include $(TOPDIR)/rules.mk

$(STAMP)-cleanheader: $(STAMP)-prepare
	test -f $(DISTDIR)$(PREFIX)/include/pcap* && rm -f $(DISTDIR)$(PREFIX)/include/pcap* || :
	touch $(STAMP)-cleanheader
