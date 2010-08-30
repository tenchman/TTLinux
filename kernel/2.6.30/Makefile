#$Id: Makefile 1527 2008-11-03 12:39:04Z matthias $

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

NAME	    = linux
VERSION     = 2.6.30-rsbac
FORMAT	    = tar.bz2
# -- BEGIN HACK --
REALNAME    = $(NAME)-$(VERSION)-1.4.2
PKGSRC      = $(REALNAME).$(FORMAT)
PKGBINNAME  = kernel
# --- END HACK ---
RELEASE	    =
PREFIX	    = /usr
#PATCHLEVEL  = 1
TOP         = $(shell if [ "$$PWD" != "" ]; then echo $$PWD; else pwd; fi)
KDIR        = $(TOP)/$(PACKAGE)

DO_BUILD    =
DO_PREPARE  = $(STAMP)-myprepare
DO_INSTALL  = $(STAMP)-myinstall
DO_PACKAGE  =

FILES	    = /etc /boot /lib/modules/$(VERSION)-* /sbin/ifenslave /lib/firmware/*
FILES	   += /opt/diet/include/linux/version.h

# build ifenslave against dietlibc
PATCHES     = patches/kernel-diet.patch

ARCHS = $(STAMP)-$(ARCH).linux


STAGES+=$(ARCHS)
unexport CC CFLAGS CPPFLAGS LINKER LD LDFLAGS PATH

include $(TOPDIR)/rules.mk

IFENSLAVEFLAGS = -static -D__GLIBC__=3 -D_BSD_SOURCE -D__KERNEL_STRICT_NAMES
IFENSLAVESRC   = Documentation/networking/ifenslave.c

domake = make ARCH=$(TTL_KERNELARCH) LOCALVERSION=$(RELEASE)-$*
ifeq ($(TTL_KERNELARCH), x86)
DODRIVER =
else
domake += CROSS_COMPILE='$(TARGETALIAS)-' HOSTCC='$(HOSTCC)'
endif

$(STAMP)-%.kernel: $(DOPATCH)
	@echo "------------------------------------------"
	@echo "---"
	@echo "---  Building kernel $(PACKAGE)$(RELEASE)-$*"
	@echo "---"
	@echo "------------------------------------------"
	cp configs/kernel-$(TTL_KERNELARCH)-$(ARCH).config $(PKGBUILDDIR)/.config
	$(domake) -C $(PKGBUILDDIR) -s include/linux/version.h
	$(domake) -C $(PKGBUILDDIR) oldconfig bzImage
	$(domake) -C $(PKGBUILDDIR) modules KBUILD_MODPOST_WARN=1 && touch $@
	$(CC) $(IFENSLAVEFLAGS) $(TTL_KERNELINC) $(PKGBUILDDIR)/$(IFENSLAVESRC) -o $(PKGBUILDDIR)/ifenslave

$(STAMP)-%.linux: $(STAMP)-%.kernel 
	@echo "------------------------------------------"
	@echo "---"
	@echo "---  Installing $(PACKAGE)$(RELEASE)-$*"
	@echo "---"
	@echo "------------------------------------------"
	install -d $(TMPDIR)/boot
	install -d $(TMPDIR)/sbin
	install -d $(TMPDIR)/etc
	install -m 700 $(PKGBUILDDIR)/ifenslave $(TMPDIR)/sbin 
	install -m 644 $(PKGBUILDDIR)/arch/$(TTL_KERNELARCH)/boot/*zImage $(TMPDIR)/boot/vmlinuz-$(VERSION)$(RELEASE)-$*
	install -m 644 $(PKGBUILDDIR)/vmlinux $(TMPDIR)/boot/vmlinux-$(VERSION)$(RELEASE)-$*
	$(domake) -C $(PKGBUILDDIR) modules_install INSTALL_MOD_PATH=$(TMPDIR) INSTALL_MOD_STRIP=1
	$(domake) -C $(PKGBUILDDIR) firmware_install INSTALL_FW_PATH=$(TMPDIR)/lib/firmware 
ifeq ($(TTL_KERNELARCH),arm)
	install -d $(TMPDIR)/lib/modules/$(VERSION)-generic/kernel/lib
	install -d $(TMPDIR)/etc/firmware
else
	$(domake) -C $(PKGBUILDDIR) modules_install INSTALL_MOD_PATH=$(TMPDIR) INSTALL_MOD_STRIP=1
endif
	install -m 644 $(PKGBUILDDIR)/System.map $(TMPDIR)/boot/System.map-$(VERSION)$(RELEASE)-$*
	PATH=$(DISTDIR)/sbin:$(PATH) depmod -ae -F $(PKGBUILDDIR)/System.map -b $(TMPDIR) $(VERSION)$(RELEASE)-$*
	#@cd $(TMPDIR) && tar -cjf $(TOPDIR)/packages/kernel-$(VERSION)$(RELEASE)-$*-$(ARCH).tar.bz2 *
	@echo "------------------------------------------"
	@echo "---"
	@echo "---  $(PACKAGE)$(RELEASE)-$* done"
	@echo "---"
	@echo "------------------------------------------"
	touch $@

$(STAMP)-myprepare: $(STAMP)-unpack
	[ -d $(TOPDIR)/include ] && rm -rf $(TOPDIR)/include || true
	[ -L $(TOPDIR)/include ] && rm -f $(TOPDIR)/include || true
	ln -sf $(PKGBUILDDIR)/include $(TOPDIR)/
	rm -f linux && ln -sf $(PKGBUILDDIR) linux
	touch $@

$(STAMP)-myinstall: $(DO_PREPARE) $(ARCHS)
	install -d $(TMPDIR)/opt/diet/include/linux
	install $(PKGBUILDDIR)/include/linux/version.h $(TMPDIR)/opt/diet/include/linux
	touch $(STAMP)-myinstall

.PRECIOUS: $(STAMP)-%.kernel
