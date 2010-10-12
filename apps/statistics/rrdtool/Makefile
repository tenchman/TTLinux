# $Id: Makefile 1658 2009-06-08 21:06:00Z gernot $

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

NAME	    = rrdtool
FORMAT	    = tar.gz
VERSION	    = 1.4.3
CC         += -D_BSD_SOURCE
PREFIX      = /opt/diet
STRIPPIT    = yes
PATCHES     = rrdtool-noxml.patch
PATCHES    += rrdtool-round.patch
PATCHES    += rrdtool-silent_rules.patch
DO_AUTOCONF = $(STAMP)-autoconf
DO_PREPARE  = $(STAMP)-prepare
FILES	    = /
CPPFLAGS   += -DRRD_TOOL_NOXML
#LDFLAGS    += -lm
ARGS        = --disable-perl --disable-python --disable-tcl --disable-ruby --enable-silent-rules
ARGS       += --quiet $(HOSTARGS)
ifneq ($(ARCH),i386)
  ARGS     += rd_cv_ieee_works=yes
endif
ARGS       += CPPFLAGS='$(CPPFLAGS)'

include $(TOPDIR)/rules.mk
