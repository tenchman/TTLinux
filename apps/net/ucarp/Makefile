# $Id$

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

NAME	    = ucarp
FORMAT	    = tar.bz2
VERSION	    = 1.5.2
CFLAGS     += -D_BSD_SOURCE
PREFIX      = /usr
STRIPPIT    = yes
DO_PREPARE  = $(STAMP)-prepare $(STAMP)-fixtypo
FILES	    = /

include $(TOPDIR)/rules.mk

$(STAMP)-fixtypo:
	sed -i -e "s/ifndef HAVE_NET_IF_ARP_H/ifdef HAVE_NET_IF_ARP_H/" $(PKGBUILDDIR)/src/fillmac.c
	touch $@
