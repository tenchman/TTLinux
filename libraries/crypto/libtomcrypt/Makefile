# $Id: Makefile 511 2005-11-28 22:52:48Z gernot $

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

NAME	     = libtomcrypt
VERSION	     = 1.17
FORMAT	     = tar.bz2
PKGSRC       = crypt-$(VERSION).tar.bz2
LDFLAGS	     = -L/opt/diet/lib
PATCHES      = patches/libtomcrypt-1.16-wchar.patch
CFLAGS       = $(CFLAGS_S)
PREFIX       = /opt/diet
STRIPPIT     = yes
DO_PREPARE   = 
DO_INSTALL   = $(STAMP)-myinstall
MAKEARGS     = NODOCS=1
INSTALLARGS  = INCPATH=$(PREFIX)/include LIBPATH=$(PREFIX)/lib-$(ARCH)
INSTALLARGS += DATAPATH=$(PREFIX)/share NODOCS=1 install

FILES        = $(PREFIX)/include/*.h $(PREFIX)/lib-$(ARCH)/lib*

USER         = $(shell id -u)
GROUP        = $(shell id -g)

export INSTALL_GROUP = $(GROUP)
export INSTALL_USER = $(USER)

include $(TOPDIR)/rules.mk

$(STAMP)-myinstall: $(STAMP)-install
	chmod 0644 $(TMPDIR)$(PREFIX)/include/*.h
	touch $(STAMP)-myinstall
