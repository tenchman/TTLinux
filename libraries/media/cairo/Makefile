# $Id$

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

NAME	    = cairo
FORMAT	    = tar.gz
VERSION	    = 1.8.10
CFLAGS     += -DPNG_SKIP_SETJMP_CHECK
STRIPPIT    = yes
ARGS        = --disable-xlib
DO_PREPARE  = $(STAMP)-prepare
FILES	    = /

include $(TOPDIR)/rules.mk
