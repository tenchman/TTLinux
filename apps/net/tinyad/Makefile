# $Id: Makefile 1792 2009-11-20 12:06:18Z gernot $

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

VERSION		= 1.2.1
NAME		= tinyad
FORMAT		= tar.bz2
PREFIX		= /usr
DO_PREPARE	=
DO_INSTALL	= $(STAMP)-myinstall
STRIPPIT	= yes

FILES	      = /usr/sbin/tinyad /usr/bin/tinyadctl

include $(TOPDIR)/rules.mk

$(STAMP)-myinstall:
	install -d $(TMPDIR)/usr/{bin,sbin}
	install $(PACKAGE)/tinyad $(TMPDIR)/usr/sbin
	install $(PACKAGE)/tinyadctl $(TMPDIR)/usr/bin
	$(STRIP) -s -R .comment -R .note $(TMPDIR)/usr/sbin/tinyad
	$(STRIP) -s -R .comment -R .note $(TMPDIR)/usr/bin/tinyadctl
	touch $(STAMP)-myinstall
