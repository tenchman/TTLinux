# $Id$	
include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config
	
NAME        = strongswan
VERSION     = 2.8.7
FORMAT      = tar.bz2
PATCHES     = strongswan-diet.patch
DO_PREPARE  = $(STAMP)-myprepare
STRIPPIT    = yes
MAKEARGS    = INC_USRLOCAL=/usr CC="$(COMPILER) -D_GNU_SOURCE -D_BSD_SOURCE -DNET_21 -DBSD=199306 -Wno-deprecated-declarations" programs
INSTALLARGS = INC_USRLOCAL=/usr install
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
