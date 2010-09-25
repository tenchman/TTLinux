# $Id: Makefile 380 2005-01-12 11:08:30Z gernot $

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

VERSION		= 1.1.17
NAME		= keepalived
FORMAT		= tar.gz
ifeq ($(CONFIG_LISS),y)
PATCHES		= patches/default-hostname.patch
PATCHES	       += patches/keepalived-1.1.17-arp.patch
endif
PATCHES	       += patches/smtp-alert.patch
PATCHES	       += patches/keepalived-1.1.11-types.patch
PREFIX		= /usr
CFLAGS		= -D_GNU_SOURCE -D_BSD_SOURCE -D__GLIBC__=3 -D__KERNEL_STRICT_NAMES
ARGS            = --with-kernel-dir=$(KERNELDIR)
DO_PREPARE	= $(STAMP)-myprepare $(STAMP)-prepare
STRIPPIT	= yes

ifneq ($(CONFIG_KEEPALIVED_FRAMEWORK_ALL),y)
ifneq ($(CONFIG_KEEPALIVED_FRAMEWORK_LVS),y)
ARGS += --disable-lvs
endif
ifneq ($(CONFIG_KEEPALIVED_FRAMEWORK_VRRP),y)
ARGS += --disable-vrrp
endif
endif

ifeq ($(CONFIG_KEEPALIVED_STATIC),y)
LDFLAGS		= -static
endif

FILES	      = /etc/keepalived/* $(PREFIX)/sbin/* $(PREFIX)/bin/* /usr/share/man/man*/*

unexport CPPFLAGS

include $(TOPDIR)/rules.mk

$(STAMP)-myprepare:
	 sed -i -e "s:^CFLAGS.*:CFLAGS   = \\\$$(INCLUDES) \@CFLAGS\@ \@CPPFLAGS\@ \\\:" \
	   $(PACKAGE)/keepalived/*/Makefile.in $(PACKAGE)/genhash/Makefile.in
	 touch $@
