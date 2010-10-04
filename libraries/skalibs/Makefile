# $Id: Makefile 1309 2008-03-17 23:59:09Z gernot $

include $(TOPDIR)/.config

NAME	    = skalibs
VERSION	    = 0.44
FORMAT	    = tar.gz
PKGBUILDDIR = $(BUILDDIR)/prog/$(PACKAGE)
CC	   += -W -Wall -fomit-frame-pointer -pipe
CFLAGS	    = -I$(DIETINC) -I$(KERNELINC)
PREFIX	    = /opt/diet
DO_PREPARE  = $(STAMP)-myprepare
DO_INSTALL  = $(STAMP)-myinstall
DO_BUILD    = $(STAMP)-mybuild
DO_CLEAN    = .myclean

FILES	    = $(PREFIX)/include/* $(PREFIX)/lib-$(ARCH)/*

include $(TOPDIR)/rules.mk

$(STAMP)-myprepare:
	echo "$(CC)" > $(PKGBUILDDIR)/conf-compile/conf-cc
	echo "$(CC) -static" > $(PKGBUILDDIR)/conf-compile/conf-ld
	echo > $(PKGBUILDDIR)/conf-compile/conf-egd
	echo > $(PKGBUILDDIR)/conf-compile/conf-stripbins
	echo > $(PKGBUILDDIR)/conf-compile/conf-striplibs
	touch $@

$(STAMP)-mybuild: $(DO_PREPARE)
	(cd $(PKGBUILDDIR); \
		package/compile \
	);
	touch $@

$(STAMP)-myinstall: $(DO_PREPARE) $(DO_BUILD)
	install -d $(TMPDIR)$(PREFIX)/lib-$(ARCH)
	install -d $(TMPDIR)$(PREFIX)/include/$(NAME)
	install -m 0644 $(PKGBUILDDIR)/library/* $(TMPDIR)$(PREFIX)/lib-$(ARCH)
	install -m 0644 $(PKGBUILDDIR)/include/* $(TMPDIR)$(PREFIX)/include/$(NAME)
	touch $@

$(STAMP)-myclean:
	@echo "==> cleaning $(PACKAGE)"
	@rm -rf $(PKGBUILDDIR)
	@rm -f $(STAGES)
