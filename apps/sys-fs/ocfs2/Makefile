# $Id$

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

KVER        = $(shell awk -F'[ \t=]*' '$$1~/^VERSION$$/{print$$2}' $(TOPDIR)/kernel/$(CONFIG_KERNELVER)/Makefile)
VERSION	    = 1.2.7
PATCHLEVEL  = $(KVER)
NAME	    = ocfs2-tools
PATCHES     = env-drbd_nodename.patch
PATCHES    += ocfs2-configure.patch
PATCHES    += ocfs2-memalign.patch
PATCHES    += ocfs2-tools-uint64.patch
PATCHES    += ocfs2-tools-realpath.patch
DO_PREPARE  = $(STAMP)-myprepare $(STAMP)-prepare
FORMAT	    = tar.gz
ARGS       += --enable-ocfs2console=no CFLAGS='$(CFLAGS)'
CC	    = $(COMPILER)

FILES	    = /

include $(TOPDIR)/rules.mk

$(STAMP)-myprepare: $(STAMP)-patch
	(cd $(PKGBUILDDIR); \
		perl -pi -e "s/-lreadline/-ledit/g" configure; \
		perl -pi -e "s/tunefs.ocfs2//"  Makefile; \
		perl -pi -e "s/debugfs.ocfs2//" Makefile; \
	);
	touch $(STAMP)-myprepare
