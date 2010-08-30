# $Id: Makefile 1354 2008-04-21 08:19:53Z gernot $

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

NAME	    = e2fsprogs
VERSION	    = 1.40.8
FORMAT	    = tar.gz
PATCHES	    = e2fsprogs-1.32-printf.patch
PATCHES	    = e2fsprogs-1.40.8-diet.patch
CFLAGS	   += -D_BSD_SOURCE -D_GNU_SOURCE -DPR_GET_DUMPABLE=3 -U__NR_gettid
DO_PREPARE  = $(STAMP)-prepare
DO_INSTALL  = $(STAMP)-myinstall
STRIPPIT    = yes
INSTALLARGS = root_sbindir=/sbin bindir=/usr/bin sbindir=/usr/sbin install install-libs
ARGS	    = --enable-htree=no --enable-compression=no --enable-blkid-devmapper=no
ARGS	   += --enable-dll-shlibs=no --disable-nls --disable-evms --disable-tls
ARGS	   += --enable-elf-shlibs=no --enable-bsd-shlibs=no
ARGS       += --libdir=/opt/diet/lib-$(ARCH) --include=/opt/diet/include
ifeq ($(CONFIG_E2FSPROGS_STATIC),y)
CC	    = $(COMPILER) -static
endif

FILES	= /sbin/* /usr/bin/* /usr/sbin/* /opt/diet/*

include $(TOPDIR)/rules.mk

$(STAMP)-myinstall: $(STAMP)-install
	rm -f $(TMPDIR)/opt/diet/bin/compile_et
	rm -f $(TMPDIR)/opt/diet/lib-$(ARCH)/libcom_err.so
	rm -f $(TMPDIR)/opt/diet/lib-$(ARCH)/libcom_err.a
	rm -rf $(TMPDIR)/opt/diet/include/et
	rm -rf $(TMPDIR)/opt/diet/share/et
	touch $(STAMP)-myinstall
