# $Id: Makefile 1527 2008-11-03 12:39:04Z matthias $

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

NAME	    = linux
VERSION     = 2.6.28.4-rsbac
FORMAT	    = tar.bz2
# -- BEGIN HACK --
REALNAME    = $(NAME)-$(VERSION)-1.4.1
PKGSRC      = $(REALNAME).$(FORMAT)
PKGBINNAME  = kernel
# --- END HACK ---
RELEASE	    =
PREFIX	    = /usr
TOP         = $(shell if [ "$$PWD" != "" ]; then echo $$PWD; else pwd; fi)
KDIR        = $(TOP)/$(PACKAGE)

DO_BUILD    =
DO_PREPARE  = $(STAMP)-myprepare
DO_INSTALL  = $(STAMP)-myinstall
DO_PACKAGE  =

FILES	    = /etc /boot /lib/modules/$(VERSION)-* /sbin/ifenslave
FILES	   += /opt/diet/include/linux/version.h

# Application Layer Packet Classifier for Linux,
# see http://l7-filter.sourceforge.net/
L7PACKAGE   = netfilter-layer7-v2.17
L7PATCH     = kernel-2.6.22-2.6.24-layer7-2.17.patch

# DRBD support, see http://www.drbd.org/
DRBDVERSION = 8.3.1
DRBDSRC     = drbd-$(DRBDVERSION)

# ISDN support
# directly supported since 2.6.27

# build ifenslave against dietlibc
PATCHES     = patches/kernel-diet.patch

# http://www.geocities.com/mctiew/ffw/lzma.assorted6.tgz
# lzma-init-2.6.16.patch5 lzma-vmlinuz-2.6.16.patch5
ifeq ($(CONFIG_KERNEL26_COMPLZMA),y)
PATCHES    += patches/linux-2.6.16-lzma_vmlinuz.patch
PATCHES    += patches/linux-2.6.16-lzma_init.patch
endif

ifeq ($(CONFIG_LISS),y)
# add a marker for our firmware tag
PATCHES    += patches/kernel-firmwaretag.patch
# various GPIO drivers for blinken lights support
PATCHES    += patches/vt1211-generic.patch
PATCHES    += patches/vt1211-leds.patch
PATCHES    += patches/w83627dhg-generic.patch
PATCHES    += patches/w83627dhg-leds.patch
PATCHES    += patches/w83627hf-generic.patch
PATCHES    += patches/w83627hf-leds.patch
PATCHES    += patches/w83627thf-generic.patch
PATCHES    += patches/w83627thf-leds.patch
endif

# driver to support temperature and voltage sensors embedded inside
# the VIA C7 CPU.
#PATCHES    += patches/linux-c7temp.patch

ARCHS = $(STAMP)-$(ARCH).linux

unexport CC CFLAGS CPPFLAGS LINKER LD LDFLAGS PATH

include $(TOPDIR)/rules.mk

IFENSLAVEFLAGS = -static -D__GLIBC__=3 -D_BSD_SOURCE -D__KERNEL_STRICT_NAMES
IFENSLAVESRC   = Documentation/networking/ifenslave.c

domake = make ARCH=$(TTL_KERNELARCH) LOCALVERSION=$(RELEASE)-$*
ifeq ($(TTL_KERNELARCH), x86)
DODRIVER = $(STAMP)-%.drbd
else
domake += CROSS_COMPILE='$(TARGETALIAS)-' HOSTCC='$(HOSTCC)'
endif

$(STAMP)-%.drbd:
	rm -rf $(DRBDSRC)
	tar -xzf $(TOPDIR)/distfiles/$(DRBDSRC).tar.gz
	$(domake) -C $(DRBDSRC)/drbd KDIR=`pwd`/$(PACKAGE)
	touch $@

$(STAMP)-%.kernel: $(DOPATCH)
	@echo "------------------------------------------"
	@echo "---"
	@echo "---  Building kernel $(PACKAGE)$(RELEASE)-$*"
	@echo "---"
	@echo "------------------------------------------"
	cp configs/kernel-$(TTL_KERNELARCH)-$(ARCH).config $(PACKAGE)/.config
ifeq ($(CONFIG_KERNEL26_L7CLASSIFIER),y)
	echo "CONFIG_NETFILTER_XT_MATCH_LAYER7=m" >> $(PACKAGE)/.config
	echo "# CONFIG_NETFILTER_XT_MATCH_LAYER7_DEBUG is not set" >> $(PACKAGE)/.config
endif
	$(domake) -C $(PACKAGE) -s include/linux/version.h
	$(domake) -C $(PACKAGE) oldconfig bzImage
	$(domake) -C $(PACKAGE) modules KBUILD_MODPOST_WARN=1 && touch $@
	$(CC) $(IFENSLAVEFLAGS) $(TTL_KERNELINC) $(PACKAGE)/$(IFENSLAVESRC) -o $(PACKAGE)/ifenslave

$(STAMP)-%.linux: $(STAMP)-%.kernel $(DODRIVER)
	@echo "------------------------------------------"
	@echo "---"
	@echo "---  Installing $(PACKAGE)$(RELEASE)-$*"
	@echo "---"
	@echo "------------------------------------------"
	install -d $(TMPDIR)/boot
	install -d $(TMPDIR)/sbin
	install -d $(TMPDIR)/etc
	install -m 700 $(PACKAGE)/ifenslave $(TMPDIR)/sbin 
	install -m 644 $(PACKAGE)/arch/$(TTL_KERNELARCH)/boot/*zImage $(TMPDIR)/boot/vmlinuz-$(VERSION)$(RELEASE)-$*
	install -m 644 $(PACKAGE)/vmlinux $(TMPDIR)/boot/vmlinux-$(VERSION)$(RELEASE)-$*
	$(domake) -C $(PACKAGE) modules_install INSTALL_MOD_PATH=$(TMPDIR) INSTALL_MOD_STRIP=1
ifeq ($(TTL_KERNELARCH),arm)
	install -d $(TMPDIR)/lib/modules/$(VERSION)-generic/kernel/lib
	install -d $(TMPDIR)/etc/firmware
else
	$(domake) -C $(PACKAGE) modules_install INSTALL_MOD_PATH=$(TMPDIR) INSTALL_MOD_STRIP=1
	$(domake) -C $(DRBDSRC)/drbd PREFIX=$(TMPDIR) install
endif
	install -m 644 $(PACKAGE)/System.map $(TMPDIR)/boot/System.map-$(VERSION)$(RELEASE)-$*
	PATH=$(DISTDIR)/sbin:$(PATH) depmod -ae -F $(PACKAGE)/System.map -b $(TMPDIR) $(VERSION)$(RELEASE)-$*
	@echo "------------------------------------------"
	@echo "---"
	@echo "---  $(PACKAGE)$(RELEASE)-$* done"
	@echo "---"
	@echo "------------------------------------------"
	touch $@

$(STAMP)-myprepare: $(STAMP)-unpack
	[ -d $(TOPDIR)/include ] && rm -rf $(TOPDIR)/include || true
	[ -L $(TOPDIR)/include ] && rm -f $(TOPDIR)/include || true
	ln -sf kernel/2.6.28/$(PACKAGE)/include $(TOPDIR)/
	rm -f linux && ln -sf $(PACKAGE) linux
ifeq ($(CONFIG_KERNEL26_L7CLASSIFIER),y)
	tar -xzf $(DISTFILES)/$(L7PACKAGE).tar.gz
	cd $(PACKAGE) && patch -p1 < ../$(L7PACKAGE)/$(L7PATCH)
endif
	touch $@

$(STAMP)-myinstall: $(DO_PREPARE) $(ARCHS)
	install -d $(TMPDIR)/opt/diet/include/linux
	install $(PACKAGE)/include/linux/version.h $(TMPDIR)/opt/diet/include/linux
	touch $(STAMP)-myinstall

.PRECIOUS: $(STAMP)-%.kernel
