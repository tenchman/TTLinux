# $Id: Makefile 191 2004-05-02 19:41:10Z gernot $

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

NAME	    = db
VERSION	    = 4.1.25
FORMAT	    = tar.gz
CC	   += -D_BSD_SOURCE
PREFIX	    = /opt/diet
PATCHES    += db-machinetype.patch
ARGS	    = --enable-shared --enable-static --disable-posixmutexes --enable-compat185
ifneq ($(TTL_KERNELARCH), x86)
ARGS       += db_cv_alignp_t='unsigned int' db_cv_sprintf_count=yes
ifeq ($(ARCH),arm)
ARGS       += db_cv_mutex='ARM/gcc-assembly'
else
  ifeq ($(ARCH),armeb)
  ARGS     += db_cv_mutex='ARM/gcc-assembly'
  endif
endif
db_cv_fcntl_f_setfd=yes
endif
PKGSUBDIR   = dist
INSTALLARGS = prefix=$(TMPDIR)/opt/diet libdir=$(TMPDIR)/opt/diet/lib-$(ARCH) install
MAKEARGS    = LIBSO_LIBS=-lpthread

# STRIPPIT    = yes
DO_PREPARE += $(STAMP)-prepare
DO_BUILD    = $(STAMP)-mybuild

FILES	    = ./opt/diet/lib-$(ARCH) ./opt/diet/include

include $(TOPDIR)/rules.mk

$(STAMP)-mybuild: 
	(cd $(PKGBUILDDIR); \
		PATH=$(TARGETROOT)/bin:$$PATH; \
		$(MAKE) $(MAKEARGS) -C db.1.85/PORT/linux; \
		$(MAKE) $(MAKEARGS) \
		);
	touch $@
