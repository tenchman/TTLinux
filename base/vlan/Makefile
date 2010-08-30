# $Id: Makefile 1310 2008-03-18 17:12:06Z gernot $

include $(TOPDIR)/.config

NAME	      = vlan
VERSION	      = 1.9
FORMAT	      = tar.gz

CFLAGS	     += -D_GNU_SOURCE -nostdinc -I$(DIETINC) -I$(KERNELINC)
MAKEARGS     += CCFLAGS='$(CFLAGS)' STRIP='$(STRIP)'
STRIPPIT      = yes

DO_PREPARE    = $(STAMP)-myprepare
DO_INSTALL    = $(STAMP)-myinstall

FILES	= sbin/vconfig

include $(TOPDIR)/rules.mk

$(STAMP)-myprepare:
	(cd $(PKGBUILDDIR); \
	make clean; )
	touch $(STAMP)-myprepare

$(STAMP)-myinstall: $(DO_BUILD) $(DO_PREPARE)
	mkdir -p $(TMPDIR)/sbin
	cp $(PKGBUILDDIR)/vconfig $(TMPDIR)/sbin
	touch $(STAMP)-myinstall
