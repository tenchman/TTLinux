# $Id: Makefile 170 2004-03-24 16:33:53Z gernot $

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

VERSION	    = 1.0.3
NAME	    = Sablot
FORMAT	    = tar.gz
DO_PREPARE  = $(STAMP)-prepare
PREFIX	    = /opt/diet
ARGS        = --disable-dom
STRIPPIT    = yes
FILES	    = $(PREFIX)/bin $(PREFIX)/lib-$(ARCH) $(PREFIX)/include

include $(TOPDIR)/rules.mk
