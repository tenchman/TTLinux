# $Id$

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

NAME	    = dcron
FORMAT	    = tar.gz
VERSION	    = 3.2
PKGSRC      = dcron32.tgz
PATCHES     = dcron-diet.patch
PATCHES    += dcron-makefile.patch
PATCHES    += dcron-pidfile.patch
LDFLAGS    += -static -Wl,-z,now
CC          = $(COMPILER)
PREFIX      = /usr
STRIPPIT    = yes
DO_PREPARE  =
FILES	    = $(PREFIX)/sbin/crond

include $(TOPDIR)/rules.mk
