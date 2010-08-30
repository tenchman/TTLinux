# $Id$

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

NAME        = mbsyslog
VERSION     = 0.98
FORMAT      = tar.bz2
PATCHES     = mbsyslog-0.98-liss.patch
DO_INSTALL  = $(STAMP)-myinstall

CFLAGS     += -D_BSD_SOURCE -D_GNU_SOURCE
DO_PREPARE  = $(STAMP)-myprepare

STRIPPIT    = yes

FILES   = /bin/klogd

include $(TOPDIR)/rules.mk

$(STAMP)-myprepare:
	(cd $(PKGBUILDDIR); \
		make clean; \
		make config; )
	touch $@

$(STAMP)-myinstall:
	mkdir -p $(TMPDIR)/bin/
	cp $(PACKAGE)/klogd $(TMPDIR)/bin/
	touch $@
