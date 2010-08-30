# $Id$

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

NAME	    = dhcp
FORMAT	    = tar.gz
VERSION	    = 4.2.0
CFLAGS     += -D_BSD_SOURCE -D_GNU_SOURCE
LDFLAGS    += -lcompat -static
PREFIX      = /opt/diet
STRIPPIT    = yes
DO_PREPARE  = $(STAMP)-myprepare
FILES	    = /usr/*bin/* $(PREFIX)/include/* $(PREFIX)/lib-$(ARCH)/* $(PREFIX)/share/* /etc/*
ARGS        = --enable-failover=no --enable-execute=no --enable-dhcpv6=no --bindir=/usr/bin --sbindir=/usr/sbin

include $(TOPDIR)/rules.mk

$(STAMP)-myprepare: $(STAMP)-prepare
	@cd $(PKGBUILDDIR)/bind && tar -xf bind.tar.gz || :
	@sed -ie "s/(utimes(/(utime(/" $(PKGBUILDDIR)/bind/bind-9.7.1/lib/isc/unix/file.c
	touch $@
