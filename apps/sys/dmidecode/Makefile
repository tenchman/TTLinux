# $Id:$

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

NAME	    = dmidecode
VERSION	    = 2.10
FORMAT	    = tar.bz2
CFLAGS	   += -D_BSD_SOURCE -D_GNU_SOURCE
DO_PREPARE  = 
MAKEARGS    = LDFLAGS=-static
INSTALLARGS = prefix=$(PREFIX) install
STRIPPIT    = yes

FILES	    = $(PREFIX)/sbin

include $(TOPDIR)/rules.mk
