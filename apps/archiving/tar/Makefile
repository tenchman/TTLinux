# $Id: Makefile 368 2005-01-09 13:35:23Z gernot $

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

NAME	    = tar
VERSION	    = 1.17
FORMAT	    = tar.bz2
CC         += -static 
DO_PREPARE  = $(STAMP)-myprepare
STRIPPIT    = yes
ARGS        = $(HOSTARGS) --bindir=/bin --libexecdir=/usr/libexec
ifneq ($(ARCH),i386)
  ARGS     += gl_cv_func_gettimeofday_clobber=no
endif
I18N        = yes

FILES	= /bin/tar /opt/diet/share/locale/de*

include $(TOPDIR)/rules.mk

$(STAMP)-myprepare: $(STAMP)-prepare
	echo "#include <wchar.h>" >> $(PACKAGE)/config.h
	touch $(STAMP)-myprepare
