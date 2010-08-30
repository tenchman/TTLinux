# $Id: Makefile 1309 2008-03-17 23:59:09Z gernot $

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

NAME	    = aescrypt
VERSION	    = 0.7
FORMAT	    = tar.gz
PATCHES     = aescrypt-keysize.patch
DO_PREPARE  = $(STAMP)-autoconf $(STAMP)-prepare
DO_INSTALL  = $(STAMP)-myinstall
FILES	    = /usr/bin/
STRIPPIT    = yes

include $(TOPDIR)/rules.mk

$(STAMP)-myinstall: $(DO_PREPARE) $(DO_BUILD)
	install -d $(TMPDIR)/usr/bin
	install -m 0755 $(PACKAGE)/aescrypt $(TMPDIR)/usr/bin
	install -m 0755 $(PACKAGE)/aesget $(TMPDIR)/usr/bin
	touch $@
