# $Id: Makefile 1309 2008-03-17 23:59:09Z gernot $

include $(TOPDIR)/.config

NAME	    = skalibs
VERSION	    = 0.44
FORMAT	    = tar.gz
PATCHES	    = 
CC	   += -W -Wall -fomit-frame-pointer -pipe
CFLAGS	    = -I$(DIETINC) -I$(KERNELINC)
PREFIX	    = /opt/diet
DO_PREPARE  = $(STAMP)-myprepare
DO_INSTALL  = $(STAMP)-myinstall
DO_BUILD    = $(STAMP)-mybuild
DO_CLEAN    = .myclean

FILES	    = .$(PREFIX)/include/* .$(PREFIX)/lib-$(ARCH)/*

include $(TOPDIR)/rules.mk

PKG=prog/$(PACKAGE)

$(STAMP)-myprepare:
	(cd $(PKG); \
		echo "$(CC)" >conf-compile/conf-cc; \
		echo "$(CC) -static" >conf-compile/conf-ld; \
		echo > conf-compile/conf-egd; \
		echo > conf-compile/conf-stripbins; \
		echo > conf-compile/conf-striplibs; \
	);
	touch $(STAMP)-myprepare

$(STAMP)-mybuild: $(DO_PREPARE)
	(cd $(PKG); \
		package/compile \
	);
	touch $(STAMP)-mybuild

$(STAMP)-myinstall: $(DO_PREPARE) $(DO_BUILD)
	install -d $(TMPDIR)$(PREFIX)/lib-$(ARCH)
	install -d $(TMPDIR)$(PREFIX)/include/$(NAME)
	install -m 0644 $(PKG)/library/* $(TMPDIR)$(PREFIX)/lib-$(ARCH)
	install -m 0644 $(PKG)/include/* $(TMPDIR)$(PREFIX)/include/$(NAME)
	rm -rf $(PKG)
	touch $(STAMP)-myinstall

.myclean:
	@echo "==> cleaning $(PACKAGE)"
	@rm -rf $(PKG)
	@rm -f $(STAGES)
