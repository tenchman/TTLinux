# $Id: Makefile 911 2007-02-15 22:34:15Z gernot $

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

NAME	    = dovecot
VERSION	    = 2.0.8
FORMAT	    = tar.gz
CFLAGS     += -D_BSD_SOURCE
PATCHES     = dovecot-dontknow.patch
PATCHES    += dovecot-auth_ntlm.patch
DO_PREPARE  = $(STAMP)-prepare
ARGS	    = --with-included-gsl $(HOSTARGS)
ifneq ($(HOST),i386)
  ARGS     += inotify_works=yes
  ARGS     += signed_size_t=no
endif
STRIPPIT    = yes
HOSTVER	    =

FILES	= /

include $(TOPDIR)/rules.mk

$(STAMP)-myprepare: $(STAMP)-prepare
	sed -i -e "s/caddr_t/char */g" $(PACKAGE)/src/plugins/quota/quota-fs.c
	touch $(STAMP)-myprepare
