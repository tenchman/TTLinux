# $Id: Makefile 1548 2009-01-15 22:03:48Z gernot $

include $(TOPDIR)/.config

VERSION	      = 1.2
NAME	      = bridge-utils
FORMAT	      = tar.gz
PATCHLEVEL    = 2
CFLAGS	     += -D_GNU_SOURCE -nostdinc -I$(DIETINC) $(TTL_KERNELINC) -Wno-deprecated-declarations
LDFLAGS       = -static
PATCHES       = bridge-utils-1.2-diet.patch
MAKEARGS      = CFLAGS='$(CFLAGS)'
PREFIX	      = /usr
STRIPPIT      = yes
DO_AUTOCONF   = $(STAMP)-autoconf
DO_PREPARE    = $(STAMP)-prepare
ARGS          = --with-linux-headers=/opt/diet/include

FILES	= .$(PREFIX)/sbin/brctl

include $(TOPDIR)/rules.mk
