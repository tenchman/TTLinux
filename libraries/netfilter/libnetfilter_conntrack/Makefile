# $Id: Makefile 273 2004-09-19 12:55:26Z gernot $

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

NAME	    = libnetfilter_conntrack
VERSION	    = 0.0.99
FORMAT	    = tar.bz2
MAKEARGS    = all
DO_PREPARE  = $(STAMP)-myprepare
PREFIX	    = /opt/diet

FILES	   += /opt/diet/lib-$(ARCH)/*.*
FILES	   += /opt/diet/lib-$(ARCH)/pkgconfig/*
FILES	   += /opt/diet/include

include $(TOPDIR)/rules.mk

CPPFLAGS     = -Wno-deprecated-declarations $(KERNELFLAGS) $(TTL_KERNELINC)
LDFLAGS      = -lnfnetlink
export CPPFLAGS LDFLAGS

$(STAMP)-myprepare: $(STAMP)-prepare
	rm -rf $(DISTDIR)$(PREFIX)/include/$(NAME)
	touch $(STAMP)-myprepare
