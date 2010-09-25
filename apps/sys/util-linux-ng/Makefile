# $Id: Makefile 1636 2009-05-18 21:20:43Z gernot $

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

NAME	    = util-linux-ng
VERSION	    = 2.14.1
FORMAT	    = tar.bz2
PATCHES     = patches/util-linux-diet.patch
PREFIX      = /usr
CFLAGS	   += -D_BSD_SOURCE -D_PATH_VI=\\\"/bin/vi\\\" -I../lib
CFLAGS     += -D__user= -Wno-deprecated-declarations $(KERNELFLAGS) $(TTL_KERNELINC)
#LDFLAGS    += -lcompat
STRIPPIT    = yes
DO_PREPARE  = $(STAMP)-myprepare
STRIPPIT    = yes

FILES = /usr/bin /usr/sbin /bin /sbin

include $(TOPDIR)/rules.mk

$(STAMP)-myprepare: $(STAMP)-prepare
	sed -i -e "s/#define HAVE_WIDECHAR 1/#undef HAVE_WIDECHAR/g" $(PACKAGE)/config.h
	touch $@

