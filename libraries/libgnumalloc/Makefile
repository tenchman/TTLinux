# $Id: Makefile 282 2004-09-24 16:05:11Z gernot $

include $(TOPDIR)/.config

VERSION	    = 0.3
PKGSRC	    = malloc.tar.gz
NAME	    = malloc
FORMAT	    = tar.gz
DO_PREPARE  =
DO_INSTALL  = $(STAMP)-myinstall
PREFIX	    = /opt/diet
MAKEARGS    = 

FILES	    = ./opt/diet/lib-$(ARCH)/libgnumalloc.a
FILES	    += ./opt/diet/include/gnumalloc.h

include $(TOPDIR)/rules.mk

$(STAMP)-myinstall:
	install -d $(TMPDIR)$(PREFIX)/lib-$(ARCH)
	install -d $(TMPDIR)$(PREFIX)/include
	install $(PACKAGE)/libmalloc.a $(TMPDIR)$(PREFIX)/lib-$(ARCH)/libgnumalloc.a
	install $(PACKAGE)/malloc.h    $(TMPDIR)$(PREFIX)/include/gnumalloc.h
	touch $(STAMP)-myinstall
