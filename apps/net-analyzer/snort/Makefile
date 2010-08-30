# $Id: Makefile 1572 2009-03-13 09:50:52Z andrey $
include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

NAME	    = snort
VERSION	    = 2.8.3.2

FORMAT	    = tar.gz
STRIPPIT    = yes
DO_PREPARE  = $(STAMP)-prepare
DO_INSTALL  = $(STAMP)-myinstall
PREFIX	    = /usr
CC	   += $(CFLAGS_S) -ffunction-sections -fdata-sections -D_GNU_SOURCE -D_BSD_SOURCE
# LDFLAGS	   += -static -Wl,--gc-sections
ARGS       += $(HOSTARGS)
ARGS       += --with-libpcre-includes=/opt/diet/include/pcre --sysconfdir=/etc/snort
FILES       = /etc/snort/* /usr/bin/snort

include $(TOPDIR)/rules.mk

$(STAMP)-myinstall: $(STAMP)-install
	mkdir -p $(TMPDIR)/etc/snort
	install $(PKGBUILDDIR)/etc/{*.conf*,*.map} $(TMPDIR)/etc/snort
	touch $(STAMP)-myinstall
