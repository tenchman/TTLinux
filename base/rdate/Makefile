# $Id: Makefile 1302 2008-03-13 23:50:46Z gernot $

include $(TOPDIR)/.config

NAME	    = rdate
VERSION	    = 1.3
FORMAT	    = tar.gz
PATCHES	    = rdate-1.3-diet.patch
MAKEARGS    = CFLAGS='$(CFLAGS_S) -static'
STRIPPIT    = yes
DO_PREPARE  = 
DO_INSTALL  = $(STAMP)-myinstall

FILES	    = ./usr/sbin/rdate

include $(TOPDIR)/rules.mk

$(STAMP)-myinstall: $(DO_BUILD) $(DO_PREPARE)
	(cd $(PKGBUILDDIR); \
		install -d $(TMPDIR)/usr/sbin; \
		install rdate $(TMPDIR)/usr/sbin; \
	);
	touch $(STAMP)-myinstall

