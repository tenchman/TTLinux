# $Id: Makefile 1341 2008-04-14 14:27:42Z gernot $

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

NAME	    = libcom_err
VERSION	    = 1.40.8
FORMAT	    = tar.gz
REALNAME    = e2fsprogs-$(VERSION)
PKGSRC      = $(REALNAME).$(FORMAT)
PATCHES	    = e2fsprogs-1.32-printf.patch
PATCHES	    = e2fsprogs-1.40.8-diet.patch
CFLAGS	   += -D_BSD_SOURCE -D_GNU_SOURCE -DPR_GET_DUMPABLE=3 -U__NR_gettid
DO_PREPARE  = $(STAMP)-prepare
STRIPPIT    = yes
INSTALLARGS = install install-libs
ARGS	    = --prefix=/opt/diet --enable-htree=no --enable-compression=no
ARGS	   += --enable-dll-shlibs=no --disable-nls --disable-evms --enable-blkid-devmapper=no
ARGS	   += --enable-elf-shlibs=yes --enable-bsd-shlibs=no --disable-tls
ARGS       += --libdir=/opt/diet/lib-$(ARCH)

FILES	= /opt/diet/include/et/* /opt/diet/lib-$(ARCH)/libcom_err.*
FILES  += /opt/diet/bin/compile_et /opt/diet/share/et/*

include $(TOPDIR)/rules.mk
