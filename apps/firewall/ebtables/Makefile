# $Id:$

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

NAME	    = ebtables
VERSION	    = v2.0.9-1
FORMAT      = tar.gz
CC	   += -D_GNU_SOURCE -D_BSD_SOURCE -O2 -g
CC	   += -Wno-deprecated-declarations -fno-builtin -ffreestanding -w
PATCHES     = ebtables-diet.patch
CFLAGS      = -nostdinc $(TTL_KERNELINC)
MAKEARGS    = KERNEL_INCLUDES=$(KERNELINC) CFLAGS='$(CFLAGS)' static
DO_PREPARE  = $(STAMP)-myprepare
DO_INSTALL  = $(STAMP)-myinstall
STRIPPIT    = yes
FILES      += /sbin/ebtables /etc/ethertypes

include $(TOPDIR)/rules.mk

$(STAMP)-myprepare:
	cp $(PACKAGE)/include/linux/netfilter_bridge/ebt_arp.h \
	   $(KERNELINC)/linux/netfilter_bridge/
	touch $(STAMP)-myprepare

$(STAMP)-myinstall:
	mkdir -p $(TMPDIR)/{sbin,etc}
	cp $(PACKAGE)/static $(TMPDIR)/sbin/ebtables
	cp $(PACKAGE)/ethertypes $(TMPDIR)/etc
	touch $(STAMP)-myinstall
