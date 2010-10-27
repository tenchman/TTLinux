# $Id: Makefile 1678 2009-06-21 19:53:58Z gernot $

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

VERSION	    = 2.3.41
NAME	    = openldap
FORMAT	    = tar.gz
CPPFLAGS    = -D_BSD_SOURCE -D_GNU_SOURCE
ifneq ($(TTL_KERNELARCH), x86)
DO_PREPARE  = $(STAMP)-fixlibtool
endif
DO_PREPARE += $(STAMP)-prepare
ARGS	    = --enable-slapd=no --enable-slurpd=no --with-tls=no
ARGS       += --libdir=$(PREFIX)/lib-$(ARCH)/openldap --with-yielding_select=yes --with-threads=no
ARGS       += ac_cv_sizeof_wchar_t=0
INSTALLARGS = STRIP="" install
FILES       = $(PREFIX)/bin $(PREFIX)/lib-$(ARCH)/openldap $(PREFIX)/include

include $(TOPDIR)/rules.mk
