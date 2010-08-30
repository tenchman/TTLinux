# $Id$

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

NAME	    = hddtemp
FORMAT	    = tar.bz2
VERSION	    = 0.3-beta15
PATCHES     = hddtemp-nofork.patch

ifeq ($(CONFIG_HDDTEMP_STATIC),y)
LDFLAGS    += -static
CC          = $(COMPILER)
endif

# CC         += -nostdinc $(TTL_KERNELINC) -I$(DIETINC) -D__KERNEL_STRICT_NAMES
STRIPPIT    = yes
ARGS        = --with-db-path=$(PREFIX)/share/hddtemp/hddtemp.db

ifneq ($(ARCH),i386)
DO_PREPARE  = $(STAMP)-autoconf
endif

DO_PREPARE += $(STAMP)-prepare
DO_INSTALL  = $(STAMP)-myinstall
FILES	    = $(PREFIX)/sbin/hddtemp
FILES      += $(PREFIX)/share/man/*/*
FILES      += $(PREFIX)/share/hddtemp/hddtemp.db

include $(TOPDIR)/rules.mk

$(STAMP)-myinstall: $(STAMP)-install
	mkdir -p $(TMPDIR)$(PREFIX)/share/hddtemp/
	cp hddtemp.db $(TMPDIR)$(PREFIX)/share/hddtemp/
	touch $(STAMP)-myinstall
