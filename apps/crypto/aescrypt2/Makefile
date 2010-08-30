# $Id: Makefile 1309 2008-03-17 23:59:09Z gernot $

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

NAME	    = aescrypt
VERSION	    = 2.1
FORMAT	    = tar.gz
PATCHES     = aescrypt-2.1-noUTF16.patch
PATCHES    += aescrypt-2.1-remove_BSD_crap.patch
PKGSRC      = aescrypt21b_source.tar.gz
DO_PREPARE  =
DO_INSTALL  = $(STAMP)-myinstall
FILES	    = /usr/bin/aescrypt
MAKEARGS    = CFLAGS="-DNO_UTF16"
STRIPPIT    = yes

include $(TOPDIR)/rules.mk

PKG=prog/$(PACKAGE)

$(STAMP)-myinstall: $(DO_PREPARE) $(DO_BUILD)
	install -d $(TMPDIR)/usr/bin
	install -m 0755 $(PACKAGE)/$(NAME) $(TMPDIR)/usr/bin
	touch $(STAMP)-myinstall
