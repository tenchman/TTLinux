# $Id: Makefile 235 2004-08-26 10:24:04Z gernot $

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

VERSION	      = 2.2.9
NAME	      = indent
FORMAT	      = tar.gz
DO_PREPARE    = $(STAMP)-myprepare $(STAMP)-prepare
PATCHES       = indent-build.patch
PATCHES      += indent-case_ranges.patch
PREFIX	      = /opt/diet
CFLAGS        = $(CFLAGS_S)
STRIPPIT      = yes

FILES	      = /opt/diet/bin/indent

include $(TOPDIR)/rules.mk

$(STAMP)-myprepare:
	sed -i -e "s:extern FILE \*output;::" $(PACKAGE)/src/indent.h
	touch $@
