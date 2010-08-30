# $Id: Makefile 1316 2008-03-20 22:05:36Z gernot $

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

NAME	    = dyndb
VERSION	    = 0.5.2
FORMAT	    = tar.gz
PATCHES	    = dyndb-regparm.patch
CC	   += -W -Os -Wall -fomit-frame-pointer -pipe
PKGBUILDDIR  = $(BUILDDIR)/data/$(PACKAGE)
PREFIX	    = /opt/diet
STRIPPIT    = yes
DO_PREPARE  =
DO_INSTALL  = $(STAMP)-myinstall
DO_BUILD    = $(STAMP)-mybuild
DO_CLEAN    = $(STAMP)-myclean

FILES	    = .$(PREFIX)/include/* .$(PREFIX)/lib-$(ARCH)/* $(PREFIX)/bin/*

include $(TOPDIR)/rules.mk

PKG=data/$(PACKAGE)

$(STAMP)-mybuild: $(DO_PREPARE)
	(cd $(PKG)/src; \
		make CC='$(CC)' clean all \
	);
	touch $(STAMP)-mybuild

$(STAMP)-myinstall: $(DO_PREPARE) $(DO_BUILD)
	install -d $(TMPDIR)$(PREFIX)/lib-$(ARCH)/$(NAME)
	install -d $(TMPDIR)$(PREFIX)/include/$(NAME)
	install -d $(TMPDIR)$(PREFIX)/bin
	install -m 0644 $(PKG)/src/*.a $(TMPDIR)$(PREFIX)/lib-$(ARCH)/$(NAME)
	install -m 0644 $(PKG)/src/*.h $(TMPDIR)$(PREFIX)/include/$(NAME)
	install -m 0755 $(PKG)/src/{dyndbadd,dyndbdel,dyndbdump,dyndbfdump,dyndbget,dyndbmake,dyndbstats,dyndbtree}  $(TMPDIR)$(PREFIX)/bin
	touch $(STAMP)-myinstall

$(STAMP)-myclean:
	@echo "==> cleaning $(PACKAGE)"
	@rm -rf $(PKG)
	@rm -f $(STAGES)
