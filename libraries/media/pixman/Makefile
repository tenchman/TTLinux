# $Id$

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

NAME	    = pixman
PATCHES     = pixman-disable_fvisibility_hidden.patch
FORMAT	    = tar.bz2
VERSION	    = 0.18.4
STRIPPIT    = yes
DO_AUTOCONF = $(STAMP)-autoconf
DO_PREPARE  = $(STAMP)-myprepare $(STAMP)-prepare
FILES	    = /

include $(TOPDIR)/rules.mk

$(STAMP)-myprepare:
	sed -i -e "s/SUBDIRS = pixman test/SUBDIRS = pixman/" $(PKGBUILDDIR)/Makefile.in
	touch $@
