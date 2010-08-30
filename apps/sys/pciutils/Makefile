# $Id:$

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

NAME	    = pciutils
VERSION	    = 3.1.2
FORMAT	    = tar.gz
PATCHES     = pciutils-libresolv.patch
DO_PREPARE  = 
STRIPPIT    = yes
PREFIX      = /usr
CC         += $(TTL_KERNELINC) -D__KERNEL_STRICT_NAMES -DPCI_HAVE_STDINT_H -D__GLIBC__=2 -D__GLIBC_MINOR__=1 
MAKEARGS    = PREFIX=$(PREFIX) IDSDIR=$(PREFIX)/share/misc
INSTALLARGS = PREFIX=$(PREFIX) IDSDIR=$(PREFIX)/share/misc install

FILES	    = $(PREFIX)/share/misc/pci* /usr/sbin/*

include $(TOPDIR)/rules.mk
