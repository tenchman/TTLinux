# $Id: Makefile 1678 2009-06-21 19:53:58Z gernot $

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

NAME	      = clamav
VERSION	      = 0.95.1
PATCHES	      = clamav-0.90-nameser.patch
FORMAT	      = tar.gz
CC	     += -D_BSD_SOURCE -O2 -g
DO_PREPARE    = $(STAMP)-prepare
ARGS	      = --disable-clamuko --with-dbdir=/var/lib/clamav --bindir=/usr/bin
ARGS         += --sbindir=/usr/sbin --disable-clamav --without-libcurl
ARGS         += ac_cv_c_restrict=__restrict__
FILES	      = /usr/bin/* /usr/sbin/* /etc/* $(PREFIX)/lib-$(ARCH)/*.a $(PREFIX)/include/*

ifeq ($(CONFIG_CLAMAV_STATIC),y)
LDFLAGS      += -static
MAKEARGS     += CCLD='$(COMPILER) -all-static'
else
FILES        += $(PREFIX)/lib-$(ARCH)/*.so*
endif

include $(TOPDIR)/rules.mk
