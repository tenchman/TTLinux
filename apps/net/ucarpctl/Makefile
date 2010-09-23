# $Id$

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

NAME	    = ucarpctl
FORMAT	    = tar.gz
VERSION	    = 0.2
PREFIX      = /usr
STRIPPIT    = yes
DO_PREPARE  =
DO_BUILD    =
DO_INSTALL  = $(STAMP)-myinstall
FILES	    = $(PREFIX)/sbin/$(NAME)

include $(TOPDIR)/rules.mk

$(STAMP)-myinstall:
	mkdir -p $(TMPDIR)$(PREFIX)/sbin
	$(COMPILER) -Os -static -o $(TMPDIR)$(PREFIX)/sbin/$(NAME) $(PKGBUILDDIR)/ucarpctl.c
	touch $@
