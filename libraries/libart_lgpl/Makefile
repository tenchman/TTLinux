# $Id: Makefile 1310 2008-03-18 17:12:06Z gernot $

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

VERSION	     = 2.3.20
NAME	     = libart_lgpl
PATCHES      = libart_lgpl-cross.patch
FORMAT	     = tar.bz2
DO_AUTOCONF  = $(STAMP)-autoconf
DO_PREPARE   = $(STAMP)-prepare
DO_BUILD     = $(STAMP)-build
PREFIX	     = /opt/diet
STRIPPIT     = yes
ARGS        += $(HOSTARGS)

FILES	    = $(PREFIX)/lib-$(ARCH)
FILES	   += $(PREFIX)/include

include $(TOPDIR)/rules.mk
