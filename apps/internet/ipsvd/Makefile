# $Id: Makefile 1302 2008-03-13 23:50:46Z gernot $

include $(TOPDIR)/.config

NAME	    = ipsvd
VERSION	    = 0.12.1
FORMAT	    = tar.gz
PATCHES	    = 
CC	   += -W -Wall -fomit-frame-pointer -pipe
PREFIX	    = /usr
DO_PREPARE  = $(STAMP)-myprepare
DO_INSTALL  = $(STAMP)-myinstall
DO_BUILD    = $(STAMP)-mybuild
DO_CLEAN    = .myclean
STRIPPIT    = yes

FILES	    = $(PREFIX)/bin

include $(TOPDIR)/rules.mk

PKG=net/$(PACKAGE)

$(STAMP)-myprepare:
	(cd $(PKG); \
		echo "$(CC) $(CFLAGS_S)" > src/conf-cc; \
		echo "$(CC) -static" > src/conf-ld; \
		cp $(DISTFILES)/matrixssl-1-7-3-open.tar.gz src/matrixssl.tar.gz \
	);
	touch $(STAMP)-myprepare

$(STAMP)-mybuild: $(DO_PREPARE)
	(cd $(PKG); \
		package/compile \
	);
	touch $(STAMP)-mybuild

$(STAMP)-myinstall: $(DO_PREPARE) $(DO_BUILD)
	install -d $(TMPDIR)$(PREFIX)/bin
	install -m 0755 $(PKG)/command/* $(TMPDIR)$(PREFIX)/bin
	touch $(STAMP)-myinstall

.myclean:
	@echo "==> cleaning $(PACKAGE)"
	@rm -rf $(PKG)
	@rm -f $(STAGES)
