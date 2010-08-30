# $Id: Makefile 404 2005-02-08 19:08:24Z gernot $

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

NAME	    = xorg-x11
REALNAME    = xc
VERSION	    = 6.8.1
PATCHES     = xorg-6.8.1-diet.patch
FORMAT	    = tar.bz2
PREFIX	    = /opt/diet
DO_BUILD    = $(STAMP)-mybuild
DO_INSTALL  = $(STAMP)-myinstall

FILES 	    = /

include $(TOPDIR)/rules.mk

unexport

$(STAMP)-mybuild: $(DO_PREPARE)
	(cd $(PKGBUILDDIR); \
		PATH=$(PATH) make World \
		);
	touch $(STAMP)-mybuild

$(STAMP)-myinstall: $(DO_BUILD) $(DO_PREPARE)
	PATH=$(PATH) $(MAKE) -C $(PKGBUILDDIR) DESTDIR=$(TMPDIR) install
	touch $(STAMP)-myinstall

