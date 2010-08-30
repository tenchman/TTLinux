# $Id: Makefile 1558 2009-02-17 11:15:51Z gernot $

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

VERSION	      = s20071127
NAME	      = iputils
FORMAT	      = tar.bz2
PATCHLEVEL = 1
PATCHES += patches/iputils-20020927-rh.patch
PATCHES += patches/iputils-20020124-countermeasures.patch
PATCHES += patches/iputils-20020927-addrcache.patch
PATCHES += patches/iputils-20020927-ping-subint.patch
PATCHES += patches/iputils-ping_cleanup.patch
PATCHES += patches/iputils-20020927-arping-infiniband.patch
PATCHES += patches/iputils-20070202-open-max.patch
PATCHES += patches/iputils-20070202-traffic_class.patch
PATCHES += patches/iputils-20070202-arping_timeout.patch
PATCHES += patches/iputils-20071127-output.patch
PATCHES += patches/iputils-20070202-ia64_align.patch
PATCHES += patches/iputils-20071127-warnings.patch
PATCHES += patches/iputils-20071127-typing_bug.patch
PATCHES	+= patches/iputils-diet.patch
MAKEARGS      = KERNEL_INCLUDE=$(KERNELINC) LDLIBS=""
override CC   = $(COMPILER) -static $(CFLAGS_S) -D_GNU_SOURCE -D_BSD_SOURCE $(TTL_KERNELINC)
STRIPPIT      = yes

DO_PREPARE    = 
DO_INSTALL    = $(STAMP)-myinstall

FILES	= /usr/sbin/* /bin/*

include $(TOPDIR)/rules.mk

CPPFLAGS    += $(KERNELFLAGS) -DNDEBUG

$(STAMP)-myinstall: $(DO_BUILD) $(DO_PREPARE)
	install -d $(TMPDIR)/bin
	install -d $(TMPDIR)/usr/sbin
	install -m 755 \
	  $(PACKAGE)/arping $(PACKAGE)/clockdiff \
	  $(PACKAGE)/ping6 $(PACKAGE)/rarpd $(PACKAGE)/tftpd \
	  $(PACKAGE)/rdisc  $(PACKAGE)/tracepath \
	  $(PACKAGE)/tracepath6 $(PACKAGE)/traceroute6 \
	  $(TMPDIR)/usr/sbin
	install -m 755 $(PACKAGE)/ping $(TMPDIR)/bin
	touch $(STAMP)-myinstall

