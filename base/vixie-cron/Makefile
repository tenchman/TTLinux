# $Id: Makefile 281 2004-09-23 15:39:24Z gernot $

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

NAME	    = vixie-cron
VERSION	    = 3.0.1
FORMAT	    = tar.gz
PATCHES	    = vixie-cron-rh.patch
CC	   += -static $(CFLAGS_S)
DO_PREPARE  =
STRIPPIT    = yes

FILES	= ./usr/sbin/crond

include $(TOPDIR)/rules.mk
