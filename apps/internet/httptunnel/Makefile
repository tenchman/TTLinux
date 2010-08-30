# $Id: Makefile 911 2007-02-15 22:34:15Z gernot $

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

NAME	    = httptunnel
VERSION	    = 0.8.1
FORMAT	    = tgz
STRIPPIT    = yes
DO_PREPARE  =
DO_INSTALL  = $(STAMP)-myinstall
PATCHES     = $(NAME)-mutex.patch
PKGSUBDIR   = src
PREFIX	    = /usr
CC	    = $(CXX) $(CFLAGS_S) -ffunction-sections -fdata-sections
LDFLAGS	   += -Wl,--gc-sections -lcompat
CFLAGS	    = $(CFLAGS_S)

FILES	    = $(PREFIX)/sbin /etc/httptunnel

include $(TOPDIR)/rules.mk

$(STAMP)-myinstall:
	install -d $(TMPDIR)$(PREFIX)/sbin
	install -d $(TMPDIR)/etc/httptunnel
	install -m 0755 $(PACKAGE)/src/httptunnel $(TMPDIR)$(PREFIX)/sbin
	install -m 0640 $(PACKAGE)/src/client-example.cfg $(TMPDIR)/etc/httptunnel/client.cfg
	install -m 0640 $(PACKAGE)/src/server-example.cfg $(TMPDIR)/etc/httptunnel/server.cfg
	touch $(STAMP)-myinstall
