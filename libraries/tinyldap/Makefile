include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

VERSION		= 20080311
NAME		= tinyldap
FORMAT		= tar.bz2
PATCHES		= tinyldap-fixes.patch
PATCHES        += tinyldap-SearchResultReference.patch
PATCHES	       += tinyldap-paged.patch
PATCHES        += tinyldap-present-bug.patch
MAKEARGS	= DIET="" CFLAGS="-pipe -I. -I/opt/diet/include/libowfat -Wall -W"
PREFIX		= /opt/diet
LIBS		= -llatin1
DO_INSTALL	= $(STAMP)-myinstall

FILES	= .$(PREFIX)/lib-$(ARCH)/tinyldap/*
FILES  += .$(PREFIX)/include/tinyldap/*

include $(TOPDIR)/rules.mk

$(STAMP)-myinstall:
	install -d $(TMPDIR)$(PREFIX)/lib-$(ARCH)/tinyldap
	install -d $(TMPDIR)$(PREFIX)/include/tinyldap
	install $(PACKAGE)/*.h $(TMPDIR)$(PREFIX)/include/tinyldap
	( cd $(PACKAGE); \
	    for file in *.a; do \
		install $$file $(TMPDIR)$(PREFIX)/lib-$(ARCH)/tinyldap/lib$$file; \
	    done )
	touch $(STAMP)-myinstall
