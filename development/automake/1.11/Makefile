# $Id: Makefile 503 2005-11-22 23:41:26Z gernot $

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

VERSION	      = 1.11.1
NAME	      = automake
FORMAT	      = tar.bz2
DO_PREPARE    = $(STAMP)-prepare
CFLAGS        = $(CFLAGS_S)
PREFIX	      = /opt/diet
STRIPPIT      = yes

FILES	      = $(PREFIX)

include $(TOPDIR)/rules.mk
