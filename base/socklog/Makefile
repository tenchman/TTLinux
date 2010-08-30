# $Id: Makefile 424 2005-04-27 13:22:07Z gernot $

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

NAME	    = socklog
VERSION	    = 2.0.3
FORMAT	    = tar.gz
PREFIX	    = /usr
DO_PREPARE  = $(STAMP)-myprepare
DO_INSTALL  = $(STAMP)-myinstall
DO_BUILD    = $(STAMP)-mybuild
STRIPPIT    = yes
FILES	    = /bin/*

include $(TOPDIR)/rules.mk

PKG=admin/$(PACKAGE)

$(STAMP)-myprepare:
	patch -p0 < socklog-cross.patch
	(cd $(PKG); \
		echo "$(CC)" > src/conf-cc; \
		echo "$(CC) -static" > src/conf-ld \
	);
	touch $(STAMP)-myprepare

$(STAMP)-mybuild: $(DO_PREPARE)
	( unset LD_LIBRARY_PATH && cd $(PKG) && package/compile )
	touch $(STAMP)-mybuild

$(STAMP)-myinstall: $(DO_PREPARE) $(DO_BUILD)
	install -d $(TMPDIR)/bin
	install -m 755 $(PKG)/command/socklog $(TMPDIR)/bin
	install -m 755 $(PKG)/command/socklog-check $(TMPDIR)/bin
	install -m 755 $(PKG)/command/socklog-conf $(TMPDIR)/bin
	install -m 755 $(PKG)/command/tryto $(TMPDIR)/bin
	install -m 755 $(PKG)/command/uncat $(TMPDIR)/bin
	touch $(STAMP)-myinstall

clean:
	@rm -rf $(PKG)
	@rm -f $(STAGES)
