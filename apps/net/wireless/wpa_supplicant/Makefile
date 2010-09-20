# $Id$

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

NAME	    = wpa_supplicant
FORMAT	    = tar.gz
VERSION	    = 0.7.3
PATCHES    += $(NAME)-make.patch
EXTRAFILES  = config
ifeq ($(CONFIG_WPA_SUPPLICANT_STATIC),y)
LDFLAGS    += -static
CC          = $(COMPILER)
endif
LDFLAGS    += -lcompat
CFLAGS     += -D_BSD_SOURCE -D_GNU_SOURCE -fno-builtin
PREFIX      = /usr
STRIPPIT    = yes
DO_PREPARE  = $(STAMP)-myprepare
DO_INSTALL  = $(STAMP)-myinstall
DO_BUILD    = $(STAMP)-mybuild
BINDIR      = $(PREFIX)/sbin
FILES	    = $(BINDIR)/* 

include $(TOPDIR)/rules.mk

$(STAMP)-myprepare:
	cp config $(PKGBUILDDIR)/$(NAME)/.config
	touch $@

$(STAMP)-mybuild:
	make -C $(PKGBUILDDIR)/$(NAME)
	touch $@

$(STAMP)-myinstall:
	make -C $(PKGBUILDDIR)/$(NAME) DESTDIR=$(TMPDIR) BINDIR=$(BINDIR) install
	touch $@
