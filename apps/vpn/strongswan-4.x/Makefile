# $Id: Makefile 1302 2008-03-13 23:50:46Z gernot $

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

NAME	    = strongswan
VERSION	    = 4.1.4
FORMAT      = tar.bz2
PATCHES     = strongswan-4.1.4-diet.patch
DO_PREPARE  = $(STAMP)-prepare
STRIPPIT    = yes
MAKEARGS    = CC="$(COMPILER) -D_GNU_SOURCE -D_BSD_SOURCE -DBSD=199306 -Wno-deprecated-declarations"
# INSTALLARGS = INC_USRLOCAL=/usr install
ifeq ($(CONFIG_STRONGSWAN_STATIC),y)
MAKEARGS   += LDFLAGS=-static
else
MAKEARGS   += LDFLAGS=-ldl
endif

FILES  = /usr/lib/ipsec/* /usr/sbin/ipsec /usr/libexec/ipsec/*
FILES += /etc/ipsec.d/* /etc/ipsec.conf

include $(TOPDIR)/rules.mk

$(STAMP)-myprepare:
	mkdir -p $(TMPDIR)/etc/rc.d/init.d/ipsec
	touch $(STAMP)-myprepare
