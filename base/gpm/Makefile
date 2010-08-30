# $Id: Makefile 368 2005-01-09 13:35:23Z gernot $

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

NAME	    = gpm
VERSION	    = 1.20.1
FORMAT	    = tar.bz2
CFLAGS	    = $(CFLAGS_S) -D_BSD_SOURCE -D_GNU_SOURCE -D__KERNEL_STRICT_NAMES $(TTL_KERNELINC)
PATCHES     = gpm-1.20.1-diet.patch
CC         += -static $(CFLAGS)
DO_PREPARE  = $(STAMP)-prepare
STRIPPIT    = yes
PREFIX      = /usr
ARGS        = --disable-shared --without-curses
MAKEARGS    = LIBS=-lm
INSTALLARGS = ROOT=$(TMPDIR) install

FILES	= /usr/sbin/gpm

include $(TOPDIR)/rules.mk
