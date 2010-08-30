# $Id:$

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

NAME	    = smartmontools
VERSION	    = 5.37
FORMAT	    = tar.gz
DO_PREPARE  = $(STAMP)-prepare
STRIPPIT    = yes
PREFIX      = /usr
ARGS        = CPPFLAGS="$(TTL_KERNELINC) -D__KERNEL_STRICT_NAMES" LDFLAGS=-static

FILES	    = /usr/sbin/smart*

include $(TOPDIR)/rules.mk
