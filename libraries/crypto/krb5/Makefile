# $Id: Makefile 1681 2009-06-24 18:37:49Z gernot $

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

VERSION	    = 1.6.3
NAME	    = krb5
FORMAT	    = tar.gz
PKGSUBDIR   = src
PATCHLEVEL  = 1

DO_PREPARE  = $(STAMP)-myprepare $(STAMP)-prepare
PREFIX	    = /opt/diet
ARGS        = --without-krb4 --without-tcl
ifneq ($(TTL_KERNELARCH), x86)
  ARGS     += krb5_cv_attr_constructor_destructor=yes,yes
  ARGS     += ac_cv_func_regcomp=yes ac_cv_printf_positional=yes
  ARGS     += ac_cv_file__etc_environment=no ac_cv_file__etc_TIMEZONE=no
endif
PATCHES     = krb5-errno.patch
PATCHES    += krb5-noapps.patch
PATCHES    += krb5-dentry.patch
# http://www.heise.de/newsticker/
# Mehrere-Schwachstellen-in-Kerberos-Implementierung-des-MIT--/meldung/135934
PATCHES    += krb5-2009_001.patch
PATCHES    += krb5-2009_002.patch
CPPFLAGS   += -D_BSD_SOURCE -D_GNU_SOURCE -UDT_DIR
CFLAGS     += $(CFLAGS_S)
LDFLAGS    += -ldl
DO_INSTALL  = $(STAMP)-myinstall
STRIPPIT    = yes
UNINST      = libkrb5support libk5crypto libkrb5 libdes425 libgssapi_krb5
UNINST     += libgssrpc libkdb5 libkadm5clnt libkadm5srv
FILES	    = ./opt/diet/lib-$(ARCH)
FILES	   += ./opt/diet/include
FILES	   += ./opt/diet/bin

include $(TOPDIR)/rules.mk

$(STAMP)-myprepare:
	@for i in $(UNINST); do rm -f $(PREFIX)/lib-$(ARCH)/$$i.*; done
	@touch $@

$(STAMP)-myinstall: $(STAMP)-install
	@rm -f $(TMPDIR)/opt/diet/bin/compile_et
	@rm -f $(TMPDIR)/opt/diet/lib-$(ARCH)/libcom_err.*
	@rm -rf $(TMPDIR)/opt/diet/include/et
	@rm -rf $(TMPDIR)/opt/diet/share/et
	@touch $@

