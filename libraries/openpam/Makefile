# $Id: Makefile 1681 2009-06-24 18:37:49Z gernot $
include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

VERSION	    = 20071221
NAME	    = openpam
FORMAT	    = tar.gz
PATCHES	    = openpam-20030715-diet.patch
LDFLAGS	    =
ifneq ($(TTL_KERNELARCH), x86)
DO_PREPARE  = $(STAMP)-fixlibtool
endif
DO_PREPARE += $(STAMP)-prepare
ARGS	    = --with-pam-su --with-pam-unix
INSTALLARGS = install
MAKEARGS    = LDFLAGS="-lcompat"
FILES       = /

include $(TOPDIR)/rules.mk
