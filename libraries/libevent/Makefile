# $Id: Makefile 1532 2008-11-19 15:46:39Z andrey $

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

NAME	    = libevent
VERSION	    = 1.4.13-stable
FORMAT	    = tar.gz
# PATCHES	    = libevent-1.1-diet.patch
PATCHES    += libevent-fd_mask.patch
PREFIX	    = /opt/diet
CC         += -DNO_PRINTF -D_GNU_SOURCE -D_BSD_SOURCE -DNDEBUG
DO_AUTOCONF = $(STAMP)-autoconf
DO_PREPARE  = $(STAMP)-myprepare
ARGS       += --enable-silent-rules --silent

FILES	    = ./opt/diet/lib-$(ARCH)
FILES	   += ./opt/diet/include

include $(TOPDIR)/rules.mk

$(STAMP)-myprepare: $(STAMP)-prepare
	find $(PKGBUILDDIR) -name "*.[ch]" -exec perl -pi \
	  	-e "s/u_(char|short|int)/unsigned $$1/g" {} \;
	touch $(STAMP)-myprepare
