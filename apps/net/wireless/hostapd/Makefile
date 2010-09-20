# $Id$

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

NAME	    = hostapd
FORMAT	    = tar.gz
VERSION	    = 0.7.3
PATCHES     = hostapd-0.7.2-diet.patch
PATCHES    += hostapd-0.7.2-make.patch
PATCHES    += hostapd-0.7.2-ap_isolate.patch
PATCHES    += hostapd-0.7.2-debug.patch
EXTRAFILES  = config
ifeq ($(CONFIG_HOSTAPD_STATIC),y)
LDFLAGS    += -static
CC          = $(COMPILER)
endif
LDFLAGS    += -Wl,--gc-sections -lcompat
CFLAGS     += -D_BSD_SOURCE -D_GNU_SOURCE -fno-builtin
PREFIX      = /usr
STRIPPIT    = yes
DO_PREPARE  = $(STAMP)-myprepare
DO_INSTALL  = $(STAMP)-myinstall
DO_BUILD    = $(STAMP)-mybuild
FILES	    = $(PREFIX)/sbin/* $(PREFIX)/share/*

include $(TOPDIR)/rules.mk

$(STAMP)-myprepare:
	cp config $(PKGBUILDDIR)/hostapd/.config
	touch $@

$(STAMP)-mybuild:
	make -C $(PKGBUILDDIR)/hostapd
	touch $@

$(STAMP)-myinstall:
	make -C $(PKGBUILDDIR)/hostapd DESTDIR=$(TMPDIR) install
	touch $@
