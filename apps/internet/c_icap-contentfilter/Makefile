# $Id: Makefile 809 2006-10-24 08:53:22Z gernot $
include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

NAME	    = c_icap-contentfilter
VERSION	    = 0.3.1
FORMAT	    = tar.gz
DO_PREPARE  = $(STAMP)-prepare
ARGS        = --libdir=$(PREFIX)/lib-$(ARCH)/c_icap
ARGS       += --enable-large-files
FILES       = $(PREFIX)/lib-$(ARCH)/c_icap/*.so $(PREFIX)/bin

include $(TOPDIR)/rules.mk
