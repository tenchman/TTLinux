# $Id: Makefile 1302 2008-03-13 23:50:46Z gernot $

include $(TOPDIR)/.config

VERSION	    = 2.0.8
NAME	    = termcap
PRENAME	    = lib
FORMAT	    = tar.bz2
PATCHES	    = 
DO_PREPARE  = 
DO_INSTALL  = $(STAMP)-myinstall
PREFIX	    = /opt/diet
MAKEARGS    = TARGETS=libtermcap.a CFLAGS="$(CFLAGS_S) -I."

FILES	    = ./opt/diet/lib-$(ARCH)/libtermcap.a
FILES	   += ./opt/diet/include/termcap.h

include $(TOPDIR)/rules.mk

$(STAMP)-myinstall:
	mkdir -p $(TMPDIR)/$(PREFIX)/lib-$(ARCH)
	mkdir -p $(TMPDIR)/$(PREFIX)/include
	cp $(PKGBUILDDIR)/libtermcap.a $(TMPDIR)/$(PREFIX)/lib-$(ARCH)
	cp $(PKGBUILDDIR)/termcap.h $(TMPDIR)/$(PREFIX)/include
	touch $(STAMP)-myinstall
