# $Id: Makefile 368 2005-01-09 13:35:23Z gernot $

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

NAME	    = pigz
VERSION	    = 2.1.4
FORMAT	    = tar.gz
PATCHES     = pigz-make.patch
STRIPPIT    = yes
MAKEARGS   += LDFLAGS="-lcompat -static" CFLAGS="$(CPPFLAGS) -O3"

FILES	= /bin/pigz

include $(TOPDIR)/rules.mk

$(STAMP)-myprepare: $(STAMP)-prepare
	echo "#include <wchar.h>" >> $(PACKAGE)/config.h
	touch $(STAMP)-myprepare
