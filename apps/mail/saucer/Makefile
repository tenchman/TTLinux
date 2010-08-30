# $Id: Makefile 404 2005-02-08 19:08:24Z gernot $

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

NAME	    = saucer
VERSION	    = 0.5.3
PATCHLEVEL  = 0
FORMAT	    = tar.bz2
PREFIX	    = /usr
FILES 	    = /
CFLAGS      = -Os -D_BSD_SOURCE -std=c99 -pipe -Wall -pedantic -fomit-frame-pointer -I$(DIETINC)
CC          = $(COMPILER)
MAKEARGS   += CFLAGS='$(CFLAGS)'
ifneq ($(CONFIG_SAUCER_STATIC),y)
MAKEARGS   += LDFLAGS=""
endif
STRIPPIT    = y


include $(TOPDIR)/rules.mk
