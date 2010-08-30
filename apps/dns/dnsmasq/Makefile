# $Id: Makefile 1617 2009-05-05 10:01:59Z gernot $

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

NAME	    = dnsmasq
VERSION	    = 2.55
FORMAT	    = tar.gz
PATCHES	    = dnsmasq-2.55-diet.patch
DO_PREPARE  =
STRIPPIT    = yes
PREFIX      = /usr
INSTALLARGS = install PREFIX=$(PREFIX)
MAKEARGS   += AWK=awk
DO_INSTALL  = $(STAMP)-myinstall

ifeq ($(CONFIG_DNSMASQ_STATIC),y)
CC          = $(COMPILER) $(CPPFLAGS)
MAKEARGS   += LDFLAGS='-static -Wl,--gc-sections'
endif

ifneq ($(CONFIG_DNSMASQ_DBUS),y)
endif
ifneq ($(CONFIG_DNSMASQ_TFTP),y)
CC         += -DNO_TFTP
endif

CC         += -Os
FILES	    = $(PREFIX)/sbin/$(NAME) $(PREFIX)/share/man/*/* $(PREFIX)/share/doc/$(PACKAGE)/*

include $(TOPDIR)/rules.mk

$(STAMP)-myinstall: $(STAMP)-install
	@mkdir -p $(TMPDIR)$(PREFIX)/share/doc/$(PACKAGE)
	@cp $(PKGBUILDDIR)/dnsmasq.conf.example $(TMPDIR)$(PREFIX)/share/doc/$(PACKAGE)
	touch $@
