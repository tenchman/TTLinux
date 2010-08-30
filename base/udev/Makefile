# $Id: Makefile 417 2005-04-19 19:25:52Z gernot $

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

NAME	    = udev
VERSION	    = 106
FORMAT	    = tar.bz2
DO_PREPARE  =
PATCHES     = udev-make.patch
PATCHES    += udev-diet.patch
STRIPPIT    = yes
CC	   += -static -D_BSD_SOURCE -D_GNU_SOURCE -isystem /opt/diet/include
CFLAGS 	   += -I$(KERNELINC)
MAKEARGS    = HOSTCC='$(CC)' LD='$(CC)' etcdir="/etc" udevdir="/dev" LDFLAGS='-lcompat'
INSTALLARGS = $(MAKEARGS) install
PREFIX      =

FILES = /etc /sbin /usr/bin

include $(TOPDIR)/rules.mk
