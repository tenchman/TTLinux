# $Id: Makefile 280 2004-09-20 13:19:37Z gernot $

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

VERSION	    = 1.12
NAME	    = libiconv
FORMAT	    = tar.gz
DO_PREPARE  = $(STAMP)-prepare
# DO_AUTOCONF = $(STAMP)-autoconf
PREFIX	    = /opt/diet/lib-$(ARCH)/iconv
CC	   += $(CFLAGS_S) -ffunction-sections -fdata-sections
ARGS        = --enable-shared --libdir=$(PREFIX)/lib
STRIPPIT    = yes
FILES	    = $(PREFIX)/lib $(PREFIX)/include

include $(TOPDIR)/rules.mk


