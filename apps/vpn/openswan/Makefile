# $Id: Makefile 1737 2009-08-04 06:48:54Z gernot $

# WARNING: you have to define WANT_MALLOC_ZERO in
#	dietfeatures.h !!!!
#

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

NAME	    = openswan2
FORMAT      = tar.gz
VERSION	    = 2.4.12
REALNAME    = openswan-$(VERSION)
PKGSRC      = $(REALNAME).$(FORMAT)
PATCHLEVEL  = 3

PATCHES    += patches/openswan-2.4.10-diet.patch
#PATCHES    += patches/openswan-2.4.12-big-endian.patch
PATCHES    += patches/openswan-2.4.7-status.patch
PATCHES    += patches/openswan-2.4.7-strict.patch
PATCHES    += patches/openswan-2.4.7-hookenv.patch
## PATCHES    += patches/openswan-2.4.10-check_keymat.patch
# see http://popoludnica.pl/?id=10100110
PATCHES    += patches/openswan-2.4.7-modeconfig.patch
PATCHES    += patches/openswan-2.4.11-nocrypt.patch
## PATCHES    += patches/openswan-ipcomp.patch
PATCHES    += patches/openswan-bug0000771.patch
PATCHES    += patches/openswan-2.4.11-delete_cryptographic_continuation.patch
PATCHES    += patches/openswan-2.4.12-timeout.patch
PATCHES    += patches/openswan-2.x.x-dpd_null_state.patch
PATCHES    += patches/openswan-2.4.x-asn1.patch
# prevent segfault in addrtot
PATCHES    += patches/openswan-check_srcptr.patch

DO_PREPARE  = $(STAMP)-myprepare

ifeq ($(CONFIG_OPENSWAN_DEBUG),y)
DBG         = -DLEAK_DETECTIVE
else
STRIPPIT    = yes
endif

MAKEARGS   += INC_USRLOCAL=/usr WERROR="" CC="$(COMPILER) $(CPPFLAGS) $(DBG) -D_GNU_SOURCE -D_BSD_SOURCE -DNET_21 -DBSD=199306 -Wno-deprecated-declarations" programs
MAKEARGS   += MODECFG=true
INSTALLARGS = INC_USRLOCAL=/usr install

ifeq ($(CONFIG_OPENSWAN_EXTRACRYPTO),y)
MAKEARGS   += USE_EXTRACRYPTO=true
endif

ifeq ($(CONFIG_OPENSWAN_STATIC),y)
MAKEARGS   += LDFLAGS='-L$(TARGETLIBDIR)'
else
MAKEARGS   += LDFLAGS='-L$(TARGETLIBDIR) -static'
endif

FILES  = /usr/lib/ipsec/* /usr/sbin/ipsec /usr/libexec/ipsec/*
FILES += /etc/ipsec.d/* /etc/ipsec.conf /etc/rc.d/init.d/ipsec /var/run/pluto

include $(TOPDIR)/rules.mk

$(STAMP)-myprepare:
	rm -f $(PACKAGE)/include/arpa/nameser.h
	touch $(STAMP)-myprepare
