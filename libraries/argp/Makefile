# $Id: Makefile 165 2004-03-05 14:12:29Z gernot $
# required by rng-tools

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

VERSION	    = 1.3
NAME	    = argp-standalone
FORMAT	    = tar.gz

DO_PREPARE  = $(STAMP)-prepare
DO_INSTALL  = $(STAMP)-myinstall
PREFIX	    = /opt/diet

FILES	    = ./opt/diet/include
FILES	   += ./opt/diet/lib-$(ARCH)

CFLAGS      = $(CFLAGS_S)

FILES       = $(PREFIX)/lib-$(ARCH)/libargp.a $(PREFIX)/include/argp.h

include $(TOPDIR)/rules.mk

$(STAMP)-myinstall:
	install -d $(TMPDIR)/$(PREFIX)/include
	install -d $(TMPDIR)/$(PREFIX)/lib-$(ARCH)
	install -m 0644 $(PKGBUILDDIR)/libargp.a $(TMPDIR)/$(PREFIX)/lib-$(ARCH)
	install -m 0644 $(PKGBUILDDIR)/argp.h $(TMPDIR)/$(PREFIX)/include
	touch $(STAMP)-myinstall
