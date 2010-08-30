# $Id$

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

NAME	    = strace
FORMAT	    = tar.bz2
VERSION	    = 4.5.19
PATCHES     = strace-diet.patch
# PATCHES    += strace-arm.patch
PATCHES    += strace-tgkill.patch
LDFLAGS    += -static
CC          = $(COMPILER)
CC         += -D_BSD_SOURCE -D_LINUX_SOURCE -D_LFS64_LARGEFILE
STRIPPIT    = yes
DO_PREPARE  = $(STAMP)-myprepare
FILES	    = $(PREFIX)/bin/strace $(PREFIX)/share/man/man1/strace.1*

include $(TOPDIR)/rules.mk

$(STAMP)-myprepare: $(STAMP)-prepare
	cd $(PACKAGE)/linux && ln -sf arm armeb || true
	touch $@
