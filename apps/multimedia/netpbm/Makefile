# $Id:$

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

VERSION	    = 10.28
NAME	    = netpbm
FORMAT	    = tgz
DO_PREPARE  =
DO_INSTALL  = $(STAMP)-myinstall
PREFIX	    = /opt/diet
PATCHES     = patches/netpbm-10.28-legal.patch
PATCHES    += patches/netpbm-10.17-time.patch
PATCHES    += patches/netpbm-9.24-strip.patch
PATCHES    += patches/netpbm-10.18-manpath.patch
PATCHES    += patches/netpbm-10.19-message.patch
PATCHES    += patches/netpbm-10.22-security2.patch
PATCHES    += patches/netpbm-10.22-cmapsize.patch
PATCHES    += patches/netpbm-10.23-security.patch
PATCHES    += patches/netpbm-10.24-nodoc.patch
PATCHES    += patches/netpbm-10.28-gcc4.patch
PATCHES    += patches/netpbm-10.27-bmptopnm.patch
PATCHES    += patches/netpbm-10.27-libpm.patch
PATCHES    += patches/netpbm-10.27-pnmtojpeg.patch
PATCHES    += patches/netpbm-10.28-ndebug.patch
PATCHES    += patches/netpbm-10.28-diet.patch
FILES	    = /bin # /opt/diet/lib-i386 /opt/diet/include

include $(TOPDIR)/rules.mk

$(STAMP)-myinstall: $(DO_BUILD) $(DO_PREPARE)
	PATH=$(PATH) \
	$(MAKE) -C $(PKGBUILDDIR) CC='$(CC)' pkgdir=$(TMPDIR) package
	mkdir -p $(TMPDIR)/opt/diet/lib-i386
	mv $(TMPDIR)/include $(TMPDIR)/opt/diet
	mv $(TMPDIR)/link/* $(TMPDIR)/opt/diet/lib-i386
	touch $(STAMP)-myinstall
