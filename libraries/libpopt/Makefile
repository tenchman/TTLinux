# $Id: Makefile 223 2004-08-15 19:52:16Z gernot $

include $(TOPDIR)/.config

NAME	    = popt
VERSION	    = 1.14
FORMAT	    = tar.gz
DO_PREPARE  = $(STAMP)-myprepare
PATCHES    += popt-diet.patch
CFLAGS     += $(CFLAGS_S) -D_BSD_SOURCE
STRIPPIT    = yes
ARGS	    = --prefix=/opt/diet $(HOSTARGS)
ifneq ($(TTL_KERNELARCH), x86)
  ARGS += ac_cv_va_copy=yes
endif

FILES	= /opt/diet/include/* /opt/diet/lib-$(ARCH)/*.a

include $(TOPDIR)/rules.mk

$(STAMP)-myprepare: $(STAMP)-prepare
	perl -pi -e "s/stpcpy/_stpcpy/g" $(PACKAGE)/*.[hc]
	touch $@
