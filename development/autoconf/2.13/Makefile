# $Id: Makefile 503 2005-11-22 23:41:26Z gernot $

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

VERSION	      = 2.13
NAME	      = autoconf
FORMAT	      = tar.gz
PATCHES      += autoconf-2.13-install.patch
DO_PREPARE    = $(STAMP)-prepare
CFLAGS        = $(CFLAGS_S)
PREFIX	      = /opt/diet
STRIPPIT      = yes
ARGS          = --program-suffix=-2.13

FILES	      = $(PREFIX)

include $(TOPDIR)/rules.mk
