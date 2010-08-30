# $Id: Makefile 1621 2009-05-05 14:13:59Z matthias $

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

NAME	    = linux
VERSION	    = 2.6.22.18
FORMAT	    = tar.bz2
RELEASE	    =
PREFIX	    = /usr
PATCHLEVEL  = 3
TOP         = $(shell if [ "$$PWD" != "" ]; then echo $$PWD; else pwd; fi)
KDIR        = $(TOP)/$(PACKAGE)

DO_BUILD    =
DO_PREPARE  = $(STAMP)-myprepare
DO_INSTALL  = $(STAMP)-myinstall
DO_PACKAGE  =

ifeq ($(ARCH),armeb)
  KARCH=arm
else
  KARCH=$(ARCH)
endif

FILES	    = /etc /boot /lib/modules/$(VERSION)$(RELEASE)-* /sbin/ifenslave
FILES	   += /opt/diet/include/linux/version.h

# Application Layer Packet Classifier for Linux,
# see http://l7-filter.sourceforge.net/
L7PACKAGE   = netfilter-layer7-v2.17
L7PATCH     = kernel-2.6.22-2.6.24-layer7-2.17.patch

# http://www.balabit.com/downloads/files/tproxy/linux-2.6/cttproxy-2.6.20-2.0.6.tar.gz
TPPACKAGE   = tproxy-4.0.2-2.6.22
TPPATCH    += patches/tproxy.diff

# DRBD support, see http://www.drbd.org/
DRBDVERSION = 8.2.6
DRBDSRC     = drbd-$(DRBDVERSION)

# ISDN support
MISDN       = mISDN-1_1_5
MISDNVER    = 1_1_5
MISDNDIR    = `pwd`/$(MISDN)
MISDNSRC    = $(MISDNDIR)/drivers/isdn/hardware/mISDN
MISDNCONF   = CONFIG_MISDN_DRV=m 
MISDNCONF  += CONFIG_MISDN_HFCPCI=m

# http://www.intel.com/design/network/products/npfamily/download_ixp400.htm
IXP_ACCESSLIBDIR       = $(TOP)/$(PACKAGE)/modules/ixp425/ixp400-2.4
IXP_ACCESSLIB_PKG      = BSD_ixp400AccessLibrary-2_4.zip
IXP_NETDRIVERPATCH     = GPL_ixp400LinuxEthernetDriverPatch-1_7.zip
IXP_FIRMWARE           = IPL_ixp400NpeLibrary-2_4.zip

# support zero length keys as needed null encryption
# see here: http://linux.derkeiler.com/Mailing-Lists/Kernel/2008-05/msg10144.html
PATCHES     = patches/linux-2.6.22-xfrm_zero_length_keys.patch

# build ifenslave against dietlibc
PATCHES    += patches/kernel-diet.patch

# connlimit support for netfilter
PATCHES    += patches/linux-2.6.22-connlimit.patch

# `br_fdb_fini' referenced in section `.init.text' of net/built-in.o: defined
# in discarded section `.exit.text' of net/built-in.o 
PATCHES    += patches/linux-2.6.22.xx-br_fdb_fini.patch

# http://www.geocities.com/mctiew/ffw/lzma.assorted6.tgz
# lzma-init-2.6.16.patch5 lzma-vmlinuz-2.6.16.patch5
ifeq ($(CONFIG_KERNEL26_COMPLZMA),y)
PATCHES    += patches/linux-2.6.16-lzma_vmlinuz.patch
PATCHES    += patches/linux-2.6.16-lzma_init.patch
endif

ifeq ($(CONFIG_LISS),y)
PATCHES    += patches/linux-2.6.17.7-firmware.patch
endif
PATCHES    += patches/vt1211-generic.patch
PATCHES    += patches/vt1211-leds.patch
PATCHES    += patches/w83627dhg-generic.patch
PATCHES    += patches/w83627dhg-leds.patch
PATCHES    += patches/w83627hf-generic.patch
PATCHES    += patches/w83627hf-leds.patch
PATCHES    += patches/w83627thf-generic.patch
PATCHES    += patches/w83627thf-leds.patch
PATCHES    += patches/linux-c7temp.patch

ARCHS = $(STAMP)-generic.linux

ifeq ($(ARCH), i386)
ifeq ($(CONFIG_KERNEL26_SMP),y)
ARCHS += $(STAMP)-smp.linux
endif
endif

STAGES+=$(ARCHS)

unexport AS CC CFLAGS CPPFLAGS LINKER LD LDFLAGS PATH

include $(TOPDIR)/rules.mk

IFENSLAVEFLAGS = -static -D__GLIBC__=3 -D_BSD_SOURCE -D__KERNEL_STRICT_NAMES
IFENSLAVESRC   = Documentation/networking/ifenslave.c

domake = make ARCH=$(KARCH) LOCALVERSION=$(RELEASE)-$* KBUILD_VERBOSE=1 HOSTCC='$(HOSTCC)' CC='$(HOSTCC)'
ifeq ($(KARCH),i386)
DODRIVER = $(STAMP)-%.drbd $(STAMP)-%.misdn
else
DOPATCH = $(STAMP)-%.ixp42x
domake += CROSS_COMPILE='$(TARGETALIAS)-' HOSTCC='$(HOSTCC)'
endif

$(STAMP)-%.ixp42x: $(STAMP)-myprepare
	rm -rf ixp400.work
	mkdir ixp400.work
	cd ixp400.work && unzip -o $(DISTFILES)/$(IXP_NETDRIVERPATCH)
	( cd $(PACKAGE); \
	  if [ ! -f drivers/net/ixp400_eth.c.ixp42x ]; then \
	    cp ../ixp400.work/ixp400_eth.c      drivers/net ; \
	    patch -p1 -b -z .ixp400driver < ../patches/linux-2.6.22-ixp400driver.patch; \
	  fi \
	)
	cd $(PACKAGE)/include/linux && ln -sf autoconf.h config.h
	tar -C $(PACKAGE) -xzf $(DISTFILES)/ixp400lib-2.4.tar.gz
	cd $(PACKAGE) && patch -p1 -b -z .ixp400lib < \
	  $(TOP)/patches/linux-2.6.22-ixp400lib.patch
	cd $(PACKAGE) && patch -p1 -b -z .fixup < \
	  $(TOP)/patches/linux-2.6.22-ixp42x_fixup.patch
	cd $(PACKAGE) && patch -p1 -b -z .patchit < \
	  $(TOP)/patches/linux-2.6.22-ixp-gpio.patch
	cd $(PACKAGE) && patch -p1 -b -z .ocf < \
	  $(TOP)/patches/linux-2.6.22-ocf.patch
	cd $(PACKAGE) && patch -p1 -b -z .dmz < \
	  $(TOP)/patches/linux-2.6.22-ixp400_dmz.patch
	cd $(PACKAGE) && patch -p1 -b -z .rtc < \
	  $(TOP)/patches/linux-2.6.22-rtc-x1205.patch
	touch $@

$(STAMP)-%.drbd:
	rm -rf $(DRBDSRC)
	tar -xzf $(TOPDIR)/distfiles/$(DRBDSRC).tar.gz
	$(domake) -C $(DRBDSRC)/drbd KDIR=`pwd`/$(PACKAGE)
	touch $@

$(STAMP)-%.misdn:
	rm -rf $(MISDN)
	tar -xzf $(TOPDIR)/distfiles/$(MISDN).tar.gz
	cp $(MISDN)/drivers/isdn/hardware/mISDN/Makefile.v2.6 $(MISDN)/drivers/isdn/hardware/mISDN/Makefile
	export MINCLUDES=$(MISDNDIR)/include ; export MISDNVERSION=$(MISDNVER); $(domake) -C $(PACKAGE) SUBDIRS=$(MISDNSRC) modules $(MISDNCONF)
	touch $@

$(STAMP)-%.kernel: $(DOPATCH)
	@echo "------------------------------------------"
	@echo "---"
	@echo "---  Building kernel $(PACKAGE)$(RELEASE)-$*"
	@echo "---"
	@echo "------------------------------------------"
	touch $@

$(STAMP)-%.drbd:
	rm -rf $(DRBDSRC)
	tar -xzf $(TOPDIR)/distfiles/$(DRBDSRC).tar.gz
	$(domake) -C $(DRBDSRC)/drbd KDIR=`pwd`/$(PACKAGE)
	touch $@

$(STAMP)-%.misdn:
	rm -rf $(MISDN)
	tar -xzf $(TOPDIR)/distfiles/$(MISDN).tar.gz
	cp $(MISDN)/drivers/isdn/hardware/mISDN/Makefile.v2.6 $(MISDN)/drivers/isdn/hardware/mISDN/Makefile
	export MINCLUDES=$(MISDNDIR)/include ; export MISDNVERSION=$(MISDNVER); $(domake) -C $(PACKAGE) SUBDIRS=$(MISDNSRC) modules $(MISDNCONF)
	touch $@

$(STAMP)-%.kernel: $(DOPATCH)
	@echo "------------------------------------------"
	@echo "---"
	@echo "---  Building kernel $(PACKAGE)$(RELEASE)-$*"
	@echo "---"
	@echo "------------------------------------------"
	cp configs/kernel-$(KARCH)-$*.config $(PACKAGE)/.config
ifeq ($(CONFIG_KERNEL26_L7CLASSIFIER),y)
	echo "CONFIG_NETFILTER_XT_MATCH_LAYER7=m" >> $(PACKAGE)/.config
	echo "# CONFIG_NETFILTER_XT_MATCH_LAYER7_DEBUG is not set" >> $(PACKAGE)/.config
endif
ifeq ($(CONFIG_KERNEL26_TPROXY),y)
	cat configs/tproxy-support >> $(PACKAGE)/.config
endif
	$(domake) -C $(PACKAGE) -s include/linux/version.h
	$(domake) -C $(PACKAGE) oldconfig bzImage
	$(domake) -C $(PACKAGE) modules KBUILD_MODPOST_WARN=1 && touch $@
	$(CC) $(IFENSLAVEFLAGS) -I$(KERNELINC) $(PACKAGE)/$(IFENSLAVESRC) -o $(PACKAGE)/ifenslave

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
	install -m 644 $(PACKAGE)/arch/$(KARCH)/boot/*zImage $(TMPDIR)/boot/vmlinuz-$(VERSION)$(RELEASE)-$*
	install -m 644 $(PACKAGE)/vmlinux $(TMPDIR)/boot/vmlinux-$(VERSION)$(RELEASE)-$*
	$(domake) -C $(PACKAGE) modules_install INSTALL_MOD_PATH=$(TMPDIR) INSTALL_MOD_STRIP=1
ifeq ($(KARCH),arm)
	install -d $(TMPDIR)/lib/modules/$(VERSION)-generic/kernel/lib
	install -d $(TMPDIR)/etc/firmware
#	install $(IXP_ACCESSLIBDIR)/ixp400_xscale_sw/lib/linuxbe/ixp400.ko \
#	  $(TMPDIR)/lib/modules/$(VERSION)-generic/kernel/lib/
#	install $(IXP_ACCESSLIBDIR)/ixp400_xscale_sw/lib/linuxbe/IxNpeMicrocode.dat \
#	  $(TMPDIR)/etc/firmware
endif
ifeq ($(KARCH),i386)
	$(domake) -C $(DRBDSRC)/drbd PREFIX=$(TMPDIR) install
	$(domake) -C $(PACKAGE) modules_install INSTALL_MOD_PATH=$(TMPDIR) SUBDIRS=$(MISDNSRC) INSTALL_MOD_STRIP=1
endif
	install -m 644 $(PACKAGE)/System.map $(TMPDIR)/boot/System.map-$(VERSION)$(RELEASE)-$*
	PATH=$(DISTDIR)/sbin:$(PATH) depmod -ae -F $(PACKAGE)/System.map -b $(TMPDIR) $(VERSION)$(RELEASE)-$*
	@cd $(TMPDIR) && tar -cjf $(TOPDIR)/packages/kernel-$(VERSION)$(RELEASE)-$*-$(ARCH).tar.bz2 *
	@echo "------------------------------------------"
	@echo "---"
	@echo "---  $(PACKAGE)$(RELEASE)-$* done"
	@echo "---"
	@echo "------------------------------------------"
	touch $@

$(STAMP)-myprepare: $(STAMP)-unpack
	[ -d $(TOPDIR)/include ] && rm -rf $(TOPDIR)/include || true
	[ -L $(TOPDIR)/include ] && rm -f $(TOPDIR)/include || true
	ln -sf kernel/2.6.22/$(PACKAGE)/include $(TOPDIR)/
	rm -f linux && ln -sf $(PACKAGE) linux
ifeq ($(KARCH),arm)
	cd $(PACKAGE) && patch -p1 -b -z .squashfs < ../patches/squashfs3.3-patch
endif
ifeq ($(CONFIG_KERNEL26_L7CLASSIFIER),y)
	tar -xzf $(DISTFILES)/$(L7PACKAGE).tar.gz
	cd $(PACKAGE) && patch -p1 < ../$(L7PACKAGE)/$(L7PATCH)
endif
ifeq ($(CONFIG_KERNEL26_TPROXY),y)
	tar -xzf $(DISTFILES)/$(TPPACKAGE).tgz
	(cd $(PACKAGE); \
	  for i in $(TPPATCH); do patch -p1 < ../$(TPPACKAGE)/$$i || exit; done; \
	)
endif
	touch $@

$(STAMP)-myinstall: $(DO_PREPARE) $(ARCHS)
	install -d $(TMPDIR)/opt/diet/include/linux
	install $(PACKAGE)/include/linux/version.h $(TMPDIR)/opt/diet/include/linux
	touch $(STAMP)-myinstall

.PRECIOUS: $(STAMP)-%.kernel
