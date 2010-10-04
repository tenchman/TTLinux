# $Id: Makefile 424 2005-04-27 13:22:07Z gernot $

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

NAME	    = runit
VERSION	    = 1.7.2
FORMAT	    = tar.gz
PKGBUILDDIR = $(BUILDDIR)/admin/$(PACKAGE)
PATCHES     = runit-cross.patch
PREFIX	    = /usr
DO_PREPARE  = $(STAMP)-myprepare
DO_INSTALL  = $(STAMP)-myinstall
DO_BUILD    = $(STAMP)-mybuild

FILES	    = /bin/* /usr/bin/*

include $(TOPDIR)/rules.mk


$(STAMP)-myprepare:
	echo "$(CC)" > $(PKGBUILDDIR)/src/conf-cc
	echo "$(CC) -static" > $(PKGBUILDDIR)/src/conf-ld
	touch $@

$(STAMP)-mybuild: $(DO_PREPARE)
	(cd $(PKGBUILDDIR); \
		package/compile \
	);
	touch $(STAMP)-mybuild

$(STAMP)-myinstall: $(DO_PREPARE) $(DO_BUILD)
	install -d $(TMPDIR)/{bin,usr/bin}
	install -m 755 $(PKGBUILDDIR)/command/* $(TMPDIR)/bin
	(cd $(TMPDIR)/usr/bin; \
	  ln -sf /bin/chpst envdir; \
	  ln -sf /bin/chpst envuidgid; \
	  ln -sf /bin/chpst pgrphack; \
	  ln -sf /bin/chpst setlock; \
	  ln -sf /bin/chpst setuidgid; \
	  ln -sf /bin/chpst softlimit; \
	)
	touch $(STAMP)-myinstall

clean:
	@rm -rf $(PKGBUILDDIR)
	@rm -f $(STAGES)
