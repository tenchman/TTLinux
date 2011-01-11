# $Id$

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

NAME	    = libdnet
FORMAT	    = tar.gz
VERSION	    = 1.11
STRIPPIT    = yes
CFLAGS     += -D_GNU_SOURCE -D_BSD_SOURCE
DO_PREPARE  = $(STAMP)-prepare
FILES	    = /

include $(TOPDIR)/rules.mk
