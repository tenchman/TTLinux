# $Id: Makefile 424 2005-04-27 13:22:07Z gernot $

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

NAME	    = socklog
VERSION	    = 2.0.3
FORMAT	    = tar.gz
PKGBUILDDIR = $(BUILDDIR)/admin/$(PACKAGE)
PATCHES     = socklog-cross.patch
PREFIX	    = /usr
DO_PREPARE  = $(STAMP)-myprepare
DO_INSTALL  = $(STAMP)-myinstall
DO_BUILD    = $(STAMP)-mybuild
STRIPPIT    = yes
FILES	    = /bin/*

include $(TOPDIR)/rules.mk

$(STAMP)-myprepare:
	echo "$(CC)" >         $(PKGBUILDDIR)/src/conf-cc
	echo "$(CC) -static" > $(PKGBUILDDIR)/src/conf-ld
	touch $@

$(STAMP)-mybuild: $(DO_PREPARE)
	( unset LD_LIBRARY_PATH && cd $(PKGBUILDDIR) && package/compile )
	touch $@

$(STAMP)-myinstall: $(DO_PREPARE) $(DO_BUILD)
	install -d $(TMPDIR)/bin
	install -m 755 $(PKGBUILDDIR)/command/socklog $(TMPDIR)/bin
	install -m 755 $(PKGBUILDDIR)/command/socklog-check $(TMPDIR)/bin
	install -m 755 $(PKGBUILDDIR)/command/socklog-conf $(TMPDIR)/bin
	install -m 755 $(PKGBUILDDIR)/command/tryto $(TMPDIR)/bin
	install -m 755 $(PKGBUILDDIR)/command/uncat $(TMPDIR)/bin
	touch $(STAMP)-myinstall

clean:
	@rm -rf $(PKG)
	@rm -f $(STAGES)
