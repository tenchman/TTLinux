# $Id: Makefile 1071 2007-06-07 22:02:26Z gernot $

# WARNING: you have to define WANT_MALLOC_ZERO in
#	dietfeatures.h !!!!
#

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

NAME	    = openswan3
FORMAT      = tar.gz
VERSION	    = 3.0.06
REALNAME    = openswan-$(VERSION)
PKGSRC      = $(REALNAME).$(FORMAT)

PATCHES    += openswan-3.0.06-diet.patch
PATCHES    += openswan-3.0.06-make.patch

#PATCHES    += openswan-2.4.7-status.patch
ifeq ($(CONFIG_LISS),y)
#PATCHES    += openswan-2.4.7-liss.patch
endif
#PATCHES    += openswan-2.4.7-strict.patch
#PATCHES    += openswan-2.4.7-hookenv.patch
DO_PREPARE  =
STRIPPIT    = yes
MAKEARGS    = INC_USRLOCAL=/usr HOSTCC="$(CC)" CC="$(COMPILER) -D_GNU_SOURCE -D_BSD_SOURCE -DBSD=199306 -Wno-deprecated-declarations" programs
INSTALLARGS = INC_USRLOCAL=/usr install
ifeq ($(CONFIG_OPENSWAN_EXTRACRYPTO),y)
MAKEARGS   += USE_EXTRACRYPTO="true"
else
MAKEARGS   += USE_EXTRACRYPTO="false"
endif
ifeq ($(CONFIG_OPENSWAN_STATIC),y)
MAKEARGS   += LDFLAGS=-static
endif

FILES  = /usr/lib/ipsec/* /usr/sbin/ipsec /usr/libexec/ipsec/*
FILES += /etc/ipsec.d/* /etc/ipsec.conf /etc/rc.d/init.d/ipsec /var/run/pluto

include $(TOPDIR)/rules.mk
