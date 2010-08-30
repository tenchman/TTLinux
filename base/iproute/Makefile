# $Id: Makefile 1724 2009-07-21 07:35:23Z gernot $

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

NAME	      = iproute2
VERSION	      = 2.6.35
FORMAT	      = tar.bz2
PATCHLEVEL    = 1
PATCHES	      = patches/iproute2-diet.patch
PATCHES	     += patches/iproute2-2.6.8-ifstat.patch
PATCHES      += patches/iproute2-tcmod.patch
PATCHES      += patches/iproute2-2.6.19-filter.patch
PATCHES      += patches/iproute2-policy.patch
PATCHES      += patches/iproute2-xfrm_deleteall.patch
# http://news.gmane.org/find-root.php?message_id=%3c20100808193304.GA15380%40amd64.fatal.se%3e
PATCHES      += patches/iproute2-2.6.35-ip_r_get.patch
MAKEARGS      = KERNEL_INCLUDE='$(TTL_KERNELINC)' DBM_INCLUDE=$(DIETINC) HOSTCC='$(CC)'
STRIPPIT      = yes

DO_PREPARE    = $(STAMP)-myprepare
DO_INSTALL    = $(STAMP)-myinstall

FILES         = /sbin/* /usr/sbin/* /usr/lib/tc/* /opt/diet/*/*

include $(TOPDIR)/rules.mk

$(STAMP)-myprepare:
	echo "" > $(PKGBUILDDIR)/Config
	touch $(STAMP)-myprepare

$(STAMP)-myinstall: $(DO_BUILD) $(DO_PREPARE)
	install -d $(TMPDIR)/sbin
	install -d $(TMPDIR)/usr/sbin
	install -d $(TMPDIR)/etc/iproute2
	install -d $(TMPDIR)/opt/diet/lib-i386
	install -d $(TMPDIR)/opt/diet/include
	install -d $(TMPDIR)/usr/lib/tc
	
	install -m 755 \
	  $(PKGBUILDDIR)/ip/ip \
	  $(PKGBUILDDIR)/ip/ifcfg \
	  $(PKGBUILDDIR)/ip/rtmon \
	  $(PKGBUILDDIR)/tc/tc \
	  $(TMPDIR)/sbin
	install -m 755 $(PKGBUILDDIR)/misc/{arpd,ifstat,nstat,rtacct,ss} \
	  $(TMPDIR)/usr/sbin
	install -m 644 $(PKGBUILDDIR)/tc/*.so $(TMPDIR)/usr/lib/tc 
	install -m 644 $(PKGBUILDDIR)/etc/iproute2/rt_* $(TMPDIR)/etc/iproute2
	install -m 644 $(PKGBUILDDIR)/lib/libnetlink.a $(TMPDIR)/opt/diet/lib-$(ARCH)
	install -m 644 $(PKGBUILDDIR)/include/libnetlink.h $(TMPDIR)/opt/diet/include
	$(STRIP) $(TMPDIR)/usr/lib/tc/*.so
	touch $(STAMP)-myinstall
