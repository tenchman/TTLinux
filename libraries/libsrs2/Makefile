# $Id: Makefile 280 2004-09-20 13:19:37Z gernot $

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

VERSION	    = 1.0.18
NAME	    = libsrs2
FORMAT	    = tar.gz
ifneq ($(TTL_KERNELARCH), x86)
DO_PREPARE  = $(STAMP)-fixlibtool
endif
DO_PREPARE += $(STAMP)-prepare
DO_BUILD    = $(STAMP)-build $(STAMP)-mybuild
PREFIX	    = /usr
CC         += -D_GNU_SOURCE -D_BSD_SOURCE -static
LDFLAGS     = -lcompat -static
ARGS 	    = --enable-static
ifeq ($(SHARED),y)
ARGS       += --enable-shared
endif
FILES	    = $(PREFIX)/lib-$(ARCH)
FILES	   += $(PREFIX)/include
FILES      += $(PREFIX)/bin

include $(TOPDIR)/rules.mk

$(STAMP)-mybuild: $(STAMP)-build
	(cd $(PKGBUILDDIR)/tools; $(CC) -D_GNU_SOURCE -D_BSD_SOURCE -static -s -o srs  srs.o -L../libsrs2 -lsrs2 -lcompat);
	touch $(STAMP)-mybuild
