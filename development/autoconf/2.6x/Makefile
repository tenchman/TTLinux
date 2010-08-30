# $Id: Makefile 503 2005-11-22 23:41:26Z gernot $

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

VERSION	      = 2.63
NAME	      = autoconf
FORMAT	      = tar.bz2
PATCHES       = autoconf-diet.patch
DO_PREPARE    = $(STAMP)-prepare
CFLAGS        = $(CFLAGS_S)
PREFIX	      = /opt/diet
STRIPPIT      = yes

FILES	      = $(PREFIX)

include $(TOPDIR)/rules.mk
