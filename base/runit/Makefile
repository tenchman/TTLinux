# $Id: Makefile 424 2005-04-27 13:22:07Z gernot $

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

NAME	    = runit
VERSION	    = 1.7.2
FORMAT	    = tar.gz
# CFLAGS	    = -I$(DIETINC) -I$(KERNELINC)
PREFIX	    = /usr
DO_PREPARE  = $(STAMP)-myprepare
DO_INSTALL  = $(STAMP)-myinstall
DO_BUILD    = $(STAMP)-mybuild

FILES	    = /bin/* /usr/bin/*

include $(TOPDIR)/rules.mk

PKG=admin/$(PACKAGE)

$(STAMP)-myprepare:
	patch -p0 < runit-cross.patch
	(cd $(PKG); \
		echo "$(CC)" > src/conf-cc; \
		echo "$(CC) -static" > src/conf-ld \
	);
	touch $(STAMP)-myprepare

$(STAMP)-mybuild: $(DO_PREPARE)
	(cd $(PKG); \
		package/compile \
	);
	touch $(STAMP)-mybuild

$(STAMP)-myinstall: $(DO_PREPARE) $(DO_BUILD)
	install -d $(TMPDIR)/{bin,usr/bin}
	install -m 755 $(PKG)/command/* $(TMPDIR)/bin
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
	@rm -rf $(PKG)
	@rm -f $(STAGES)
