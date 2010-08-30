# $Id: Makefile 165 2004-03-05 14:12:29Z gernot $
# required by rng-tools

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

VERSION	    = 2.16
NAME	    = libcap
FORMAT	    = tar.bz2

PATCHES     = libcap-prctl.patch
PREFIX	    = /opt/diet

FILES	    = $(PREFIX)/include
FILES	   += $(PREFIX)/lib-$(ARCH)

CC         += $(CPPFLAGS)
CFLAGS     += $(CFLAGS_S)
MAKEARGS    = PAM_CAP=no
INSTALLARGS = PAM_CAP=no prefix=$(PREFIX) lib=lib-$(ARCH) install 

include $(TOPDIR)/rules.mk
