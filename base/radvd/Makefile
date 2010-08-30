# $Id: Makefile 368 2005-01-09 13:35:23Z gernot $

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

NAME	    = radvd
VERSION	    = 1.2
FORMAT	    = tar.gz
CFLAGS	   += -D_BSD_SOURCE -D__KERNEL_STRICT_NAMES $(TTL_KERNELINC)
ifeq ($(CONFIG_RADVD_STATIC),y)
CC         += -static
endif
MAKEARGS    = LIBS='-lc -lcompat'
DO_PREPARE  = $(STAMP)-prepare
ifneq ($(ARCH),i386)
DO_AUTOCONF = $(STAMP)-autoconf
endif
STRIPPIT    = yes
PREFIX      = /usr

FILES	= $(PREFIX)/sbin

include $(TOPDIR)/rules.mk
