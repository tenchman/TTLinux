# $Id: Makefile 355 2005-01-06 15:42:39Z gernot $

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

NAME	     = sysklogd
VERSION	     = 1.4.1rh
FORMAT	     = tar.gz
PATCHES	     = sysklogd-1.4.1-querymodules.patch
PATCHES	    += sysklogd-1.4.1-microliss.patch
CC	    += -D_BSD_SOURCE -I$(DIETINC) -I$(KERNELINC) -static
DO_PREPARE   =
STRIPPIT     = yes
INSTALLARGS  = install MANDIR=/usr/share/man BINDIR=/sbin
FILES	= ./sbin/syslogd
FILES  += ./sbin/klogd

include $(TOPDIR)/rules.mk
