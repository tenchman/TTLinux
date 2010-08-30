# $Id: Makefile 1319 2008-03-26 15:23:14Z gernot $

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

NAME	    = daemontools
VERSION	    = 0.76
FORMAT	    = tar.gz
DO_PREPARE  = $(STAMP)-myprepare
DO_INSTALL  = $(STAMP)-myinstall
DO_BUILD    = $(STAMP)-mybuild
DO_CLEAN    = $(STAMP)-myclean
STRIPPIT    = yes
MAKEARGS    = prog
CC	    = $(COMPILER) -static
FILES	    = /usr/bin/*
PKGBUILDDIR = $(BUILDDIR)/admin/$(PACKAGE)

include $(TOPDIR)/rules.mk

$(STAMP)-myprepare:
	(cd $(PKGBUILDDIR); \
		echo $(CC) >src/conf-cc; \
		echo $(CC) >src/conf-ld; \
		perl -pi -e "s:\./chkshsgr.*::" src/Makefile; \
		perl -pi -e "s:env.*rts\.tests.*::" src/Makefile; \
	);
	touch $(STAMP)-myprepare

$(STAMP)-mybuild: $(DO_PREPARE)
	(cd $(PKGBUILDDIR); \
		package/compile \
	);
	touch $(STAMP)-mybuild

$(STAMP)-myinstall: $(DO_PREPARE) $(DO_BUILD)
	install -d $(TMPDIR)/usr/bin
	install $(PKGBUILDDIR)/command/* $(TMPDIR)/usr/bin
	touch $(STAMP)-myinstall

$(STAMP)-myclean:
	@echo "==> cleaning $(PACKAGE)"
	@rm -rf $(PKGBUILDDIR)
	@rm -f $(STAGES)
