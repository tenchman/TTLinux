# $Id: Makefile 280 2004-09-20 13:19:37Z gernot $

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

VERSION	    = 0.0.9
NAME	    = udns
FORMAT	    = tar.gz
DO_PREPARE  = $(STAMP)-myprepare
DO_INSTALL  = $(STAMP)-myinstall
PREFIX	    = /opt/diet
MAKEARGS   += static
FILES	    = $(PREFIX)/lib-$(ARCH)/*
FILES	   += $(PREFIX)/include/*
FILES      += $(PREFIX)/bin/*
STRIPPIT    = yes

include $(TOPDIR)/rules.mk

$(STAMP)-myprepare:
	(cd $(PACKAGE) && ./configure)
	touch $(STAMP)-myprepare

$(STAMP)-myinstall:
	mkdir -p $(TMPDIR)$(PREFIX)/{bin,lib-$(ARCH),include}
	cp $(PACKAGE)/udns.h $(TMPDIR)$(PREFIX)/include
	cp $(PACKAGE)/libudns.a $(TMPDIR)$(PREFIX)/lib-$(ARCH)
	cp $(PACKAGE)/{rblcheck,dnsget} $(TMPDIR)$(PREFIX)/bin
	touch $(STAMP)-myinstall
