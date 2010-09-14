# $Id$

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

NAME	    = fontconfig
FORMAT	    = tar.gz
VERSION	    = 2.8.0
STRIPPIT    = yes
PATCHES     = fontconfig-freetype_guess.patch
DO_PREPARE  = $(STAMP)-prepare
DO_AUTOCONF = $(STAMP)-autoconf
FILES	    = /
ARGS       += --with-expat-includes=/opt/diet/include --with-expat-lib=/opt/diet/lib-$(ARCH)

include $(TOPDIR)/rules.mk
