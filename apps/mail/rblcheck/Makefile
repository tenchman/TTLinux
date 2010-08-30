# $Id: Makefile 1379 2008-04-30 12:53:19Z gernot $

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

NAME	    = rblcheck
VERSION	    = 1.5
FORMAT	    = tar.gz
CFLAGS      = -D_BSD_SOURCE -pipe
ifneq ($(ARCH),i386)
DO_PREPARE  = $(STAMP)-autoconf
endif
DO_PREPARE  = $(STAMP)-prepare
PREFIX	    = /usr
STRIPPIT    = yes
HOSTVER	    =

FILES	= /usr/bin/rblcheck

include $(TOPDIR)/rules.mk
