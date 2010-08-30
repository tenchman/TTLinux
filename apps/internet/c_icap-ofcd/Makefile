# $Id: Makefile 1656 2009-06-08 14:06:26Z gernot $
include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

NAME	    = c_icap-ofcd
VERSION	    = 0.1.4
FORMAT	    = tar.gz
DO_PREPARE  = $(STAMP)-prepare
ARGS        = --libdir=$(PREFIX)/lib-$(ARCH)/c_icap --enable-silent-rules --quiet
FILES       = $(PREFIX)/lib-$(ARCH)/c_icap/*.so $(PREFIX)/lib-$(ARCH)/c_icap/*.txt

include $(TOPDIR)/rules.mk
