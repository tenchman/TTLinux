# $Id$

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

NAME	    = dhcprelay
FORMAT	    = tar.bz2
VERSION	    = 1.2
PATCHES     = dhcprelay-1.2-make.patch
PATCHES    += dhcprelay-1.2-foreground.patch
PATCHES    += dhcprelay-1.2-logname.patch
PATCHES    += dhcprelay-1.2-udphdr.patch
LDFLAGS    += -static
MAKEARGS   += CFLAGS="$(CPPFLAGS) -D_BSD_SOURCE -DHAVE_DUMB_UDPHDR"
INSTALLARGS = prefix=/usr install
STRIPPIT    = yes
DO_PREPARE  =
FILES	    = /usr/sbin/dhcprelay

include $(TOPDIR)/rules.mk
