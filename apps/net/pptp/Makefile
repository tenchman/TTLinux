# $Id: Makefile 1075 2007-06-08 22:12:20Z gernot $

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

VERSION	    = 1.7.1
NAME	    = pptp
FORMAT	    = tar.gz
PATCHES	    = pptp-diet.patch
CC	   += -D_BSD_SOURCE -D_GNU_SOURCE -Wno-deprecated-declarations 
MAKEARGS    = INCLUDE="-I$(DIETINC) -I$(KERNELINC)" LIBS="-lcompat" CFLAGS="$(CFLAGS)"
DO_PREPARE  =
PREFIX	    = /usr

FILES	    = ./usr/sbin/pptp

include $(TOPDIR)/rules.mk
