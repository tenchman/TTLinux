# $Id: Makefile 1469 2008-08-20 18:26:06Z gernot $

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

NAME	    = ipsec-tools
VERSION	    = 0.7
PATCHES     = ipsec-tools-diet.patch
FORMAT      = tar.bz2
DO_AUTOCONF = $(STAMP)-autoconf
DO_PREPARE  = $(STAMP)-myprepare $(STAMP)-prepare
STRIPPIT    = yes
MAKEARGS    = CC='$(CC) -D_LINUX_TYPES_H -D_LINUX_SOCKET_H'
ARGS        = --enable-security-context=no --with-kernel-headers=$(KERNELINC) LDFLAGS='-lcompat'
ARGS       += --enable-natt --enable-dpd --enable-frag --enable-stats --enable-fastquit --enable-adminport


include $(TOPDIR)/rules.mk

$(STAMP)-myprepare:
	sed -i -e "s/-Werror//g" $(PACKAGE)/configure*
	touch $@
