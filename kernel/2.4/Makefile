# $Id: Makefile 1302 2008-03-13 23:50:46Z gernot $

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

NAME	    = linux
VERSION	    = 2.4.29
FORMAT	    = tar.bz2
RELEASE	    = test
PREFIX	    = /usr

UML_PATCH   = patches/linux-2.4.27-1-uml.patch
TSC_PATCH   = patches/linux-2.4.25-pkt_sched-tsc.patch

DAZUKOVER   = 2.0.4
DAZUKO	    = dazuko-$(DAZUKOVER)
DAZUKOPATCH = patches/kernel-2.4.27-$(DAZUKOVER)-dazuko.patch
PATCHES	    = patches/linux-2.4.25-microliss.patch
PATCHES	   += patches/linux-2.4.29-1.0.9-openswan.patch

# http://belnet.dl.sourceforge.net/sourceforge/ebtables/ebtables-brnf-5_vs_2.4.25.diff.gz
# See: http://ebtables.sourceforge.net/
ifeq ($(CONFIG_KERNEL_BRIDGE),y)
PATCHES	   += patches/linux-2.4.29-ebtables_brnf_9.patch
endif

# http://www.xmailserver.org/linux-patches/epoll-lt-2.4.24-0.20.diff
# See: http://www.xmailserver.org/linux-patches/nio-improve.html
PATCHES	   += patches/linux-2.4.25-2.4.2-ppp.patch
# XXX XXX XXX #
# this patch modifies the struct ip_conntrack_tuple so we have to
# recompile iptables
# XXX XXX XXX #
PATCHES	   += patches/linux-2.4.29-netfilter.patch
PATCHES    += patches/linux-2.4.29-netfilter-layer7.patch
PATCHES    += patches/linux-2.4.29-iptables-warn.patch
PATCHES	   += patches/linux-2.4.25-pre6-intel.patch

# http://belnet.dl.sourceforge.net/sourceforge/user-mode-linux/uml-patch-2.4.24-1.bz2
# See: http://user-mode-linux.sourceforge.net/
# don't use it on archs < i686
# don't use it with APM enabled !
# See: http://www.docum.org/stef.coene/qos/faq/cache/40.html

ifeq ($(CONFIG_KERNEL_CAPI),y)
PATCHES	   += patches/kernel-2.4.24-dsl-kversion.patch
PATCHES	   += patches/kernel-2.4.25-capi-config.patch
PATCHES	   += patches/linux-2.4.xx-isdn_build.patch
PATCHES	   += patches/linux-2.4.xx-dsl_build.patch
endif

DO_BUILD    =
DO_PREPARE  = $(STAMP)-myprepare
DO_INSTALL  = $(STAMP)-myinstall

FILES	    = ./boot ./lib/modules
EXTRASTAGES = *.linux *.kernel *.dazuko *.isdndriver *.dsldriver

ARCHS  =
ifeq ($(CONFIG_KERNEL_UML),y)
ARCHS += um.linux
endif
ifeq ($(CONFIG_KERNEL_I486),y)
ARCHS += i486.linux
endif
ifeq ($(CONFIG_KERNEL_PIII),y)
ARCHS += pIII.linux
endif
ifeq ($(CONFIG_KERNEL_PIV),y)
ARCHS += pIV.linux
endif

STAGES+=$(ARCHS)

include $(TOPDIR)/rules.mk
unexport CC LD STRIP
export PATH=/bin:/usr/bin:/sbin:/usr/sbin
CC = $(HOSTCC)
LD = ld
STRIP = strip

%.isdndriver: %.kernel
	make -C $(PACKAGE)/fritz-isdn/src.drv \
		CC=$(CC) CARD=fcpci \
		BUILDROOT=$(TMPDIR) \
		KVER=$(VERSION)-$(RELEASE)-$* clean all install
	touch $@

%.dsldriver: %.kernel
	make -C $(PACKAGE)/fritz-dsl/src.drv \
		CC=$(CC) CARD=fcdsl2 \
		BUILDROOT=$(TMPDIR) \
		KVER=$(VERSION)-$(RELEASE)-$* clean all install
	touch $@

%.dazuko: %.kernel
	if [ "$*" = "um" ]; then (cd $(PACKAGE)/include && ln -sf ../arch/um/include/sysdep-i386 sysdep;); fi
	( cd $(PACKAGE)/$(DAZUKO) && ./configure --kernelsrcdir=$(TOPDIR)/kernel24/$(PACKAGE) --disable-event-exec; )
	make -C $(PACKAGE)/$(DAZUKO) CC=$(CC) \
		ARCHFLAGS="\
			-I$(TOPDIR)/kernel24/$(PACKAGE)/arch/um/include \
			-I$(TOPDIR)/kernel24/$(PACKAGE)/arch/um/kernel/skas/include \
			-I$(TOPDIR)/kernel24/$(PACKAGE)/arch/um/kernel/tt/include" \
			clean all
	rm -f $(PACKAGE)/include/sysdeps
	touch $@

%.kernel:
	@echo "------------------------------------------"
	@echo "---"
	@echo "---  Building kernel $(PACKAGE)-$(RELEASE)-$*"
	@echo "---"
	@echo "------------------------------------------"
	make -C $(PACKAGE) mrproper
	cp configs/kernel-$*.config $(PACKAGE)/.config
	perl -p -i -e "s/^EXTRAVERSION.*/EXTRAVERSION = -$(RELEASE)-$*/" $(PACKAGE)/Makefile
	
	if [ "$*" = "um" ]; \
	then \
		cd $(PACKAGE) && patch -p1 < ../$(UML_PATCH); \
		make CC="$(CC)" HOSTCC="$(CC)" \
		      oldconfig dep clean linux modules ARCH=um && touch $@; \
	else \
		make CC="$(CC)" HOSTCC="$(CC)" -C $(PACKAGE) -s include/linux/version.h; \
		make CC="$(CC)" HOSTCC="$(CC)" -C $(PACKAGE) \
		      oldconfig dep clean bzImage modules && touch $@; \
	fi

%.linux: %.kernel %.dazuko
	@echo "------------------------------------------"
	@echo "---"
	@echo "---  Installing $(PACKAGE)-$(RELEASE)-$*"
	@echo "---"
	@echo "------------------------------------------"
	install -d $(TMPDIR)/boot
	@if [ "$*" = "um" ]; \
	then \
		install -m 755 $(PACKAGE)/linux $(TMPDIR)/boot; 			\
		make -C $(PACKAGE) modules_install ARCH=um INSTALL_MOD_PATH=$(TMPDIR);	\
		cd $(PACKAGE) && patch -p1 -R < ../$(UML_PATCH);			\
		make symlinks;						\
	else \
		install -m 644 $(PACKAGE)/arch/i386/boot/bzImage $(TMPDIR)/boot/vmlinuz-$(VERSION)-$(RELEASE)-$*; \
		install -m 644 $(PACKAGE)/vmlinux $(TMPDIR)/boot/vmlinux-$(VERSION)-$(RELEASE)-$*; \
		make -C $(PACKAGE) modules_install INSTALL_MOD_PATH=$(TMPDIR); \
	fi
	install -m 644 $(PACKAGE)/System.map $(TMPDIR)/boot/System.map-$(VERSION)-$(RELEASE)-$*
	install -d $(TMPDIR)/lib/modules/$(VERSION)-$(RELEASE)-$*/misc
	install -m 0644 $(PACKAGE)/$(DAZUKO)/dazuko.o $(TMPDIR)/lib/modules/$(VERSION)-$(RELEASE)-$*/misc
	depmod -ae -F $(PACKAGE)/System.map -b $(TMPDIR) $(VERSION)-$(RELEASE)-$*
	@echo "------------------------------------------"
	@echo "---"
	@echo "---  $(PACKAGE)-$(RELEASE)-$* done"
	@echo "---"
	@echo "------------------------------------------"
	touch $@

$(STAMP)-myprepare: .unpack
	(cd $(PKGBUILDDIR);						 \
		tar -xzf $(TOPDIR)/distfiles/$(DAZUKO).tar.gz;		 \
		patch -b -z .dazuko -p1 < $(TOPDIR)/kernel24/$(DAZUKOPATCH); \
	);
	touch $(STAMP)-myprepare

$(STAMP)-myinstall: $(DO_PREPARE) $(ARCHS)
	[ -f $(TOPDIR)/include ] && rm -rf $(TOPDIR)/include || true
	ln -sf kernel/2.4/$(PACKAGE)/include $(TOPDIR)/
	touch $(STAMP)-myinstall

.PRECIOUS: %.kernel %.dsldriver %.isdndriver %.dazuko

