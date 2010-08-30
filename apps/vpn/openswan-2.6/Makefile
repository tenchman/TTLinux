# $Id: Makefile 1540 2008-12-15 11:11:49Z gernot $

# WARNING: you have to define WANT_MALLOC_ZERO in
#	dietfeatures.h !!!!
#

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

NAME	    = openswan2
FORMAT      = tar.gz
VERSION	    = 2.6.19
REALNAME    = openswan-$(VERSION)
PKGSRC      = $(REALNAME).$(FORMAT)

PATCHES    += patches/openswan-2.6-diet.patch
PATCHES    += patches/openswan-2.6-status.patch
PATCHES    += patches/openswan-2.6-hookenv.patch
DO_PREPARE  =
STRIPPIT    = yes
CC          = $(COMPILER) $(CPPFLAGS) -DHOST_NAME_MAX=256 -D_GNU_SOURCE -D_BSD_SOURCE -DNET_21 -DBSD=199306 -Wno-deprecated-declarations
MAKEARGS    = INC_USRLOCAL=/usr CC='$(CC)' programs
MAKEARGS   += MODECFG=true HOSTCC='gcc'
INSTALLARGS = INC_USRLOCAL=/usr install
MAKEARGS   += USE_EXTRACRYPTO=true WERROR=""
ifeq ($(CONFIG_OPENSWAN_STATIC),y)
MAKEARGS   += LDFLAGS=-static
endif

FILES  = /usr/lib/ipsec/* /usr/sbin/ipsec /usr/libexec/ipsec/*
FILES += /etc/ipsec.d/* /etc/ipsec.conf /etc/rc.d/init.d/ipsec /var/run/pluto

include $(TOPDIR)/rules.mk

$(STAMP)-myprepare:
	rm -f $(PACKAGE)/include/arpa/nameser.h
	touch $(STAMP)-myprepare
