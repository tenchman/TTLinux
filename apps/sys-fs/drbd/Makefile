# $Id$

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

KVER        = $(shell awk -F'[ \t=]*' '$$1~/^VERSION$$/{print$$2}' $(TOPDIR)/kernel/$(CONFIG_KERNELVER)/Makefile)
VERSION	    = $(shell awk -F'[ \t=]*' '$$1~/^DRBDVERSION$$/{print$$2}' $(TOPDIR)/kernel/$(CONFIG_KERNELVER)/Makefile)
PATCHLEVEL  = $(KVER)
NAME	    = drbd
PATCHES     = drbd-hsearch.patch
PATCHES    += drbd-diet.patch
PATCHES    += drbd-install.patch
PATCHES    += drbd-debug.patch
PATCHES    += drbd-getopt.patch
PATCHES    += drbd-env.patch
DO_PREPARE  =
FORMAT	    = tar.gz
INSTALLARGS = install-tools DESTDIR=$(TMPDIR)
CC	    = $(COMPILER) -static
MAKEARGS    = CPPFLAGS='-I$(KERNELINC) -D__KERNEL_STRICT_NAMES -D_LINUX_SOCKET_H' KDIR=$(KERNELINC) tools

FILES	    = /

include $(TOPDIR)/rules.mk
