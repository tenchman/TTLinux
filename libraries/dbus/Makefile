# $Id: Makefile 1681 2009-06-24 18:37:49Z gernot $

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

VERSION	    = 0.50
NAME	    = dbus
FORMAT	    = tar.gz
CFLAGS      = $(CFLAGS_S)
STRIPPIT    = yes
ARGS        =  --enable-qt=no --enable-glib=no --enable-gtk=no --enable-tests=no --enable-xml-docs=no
ARGS       +=  --enable-doxygen-docs=no --enable-gcov=no --enable-gcj=no --enable-mono=no 
ARGS       +=  --enable-mono-docs=no --enable-python=no --enable-selinux=no --with-x=no
ARGS       +=  --enable-abstract-sockets=no
ifneq ($(TTL_KERNELARCH), x86)
  ARGS     += ac_cv_func_posix_getpwnam_r=yes
endif
DO_PREPARE  = $(STAMP)-prepare
CC         += -D_BSD_SOURCE

FILES	= /

include $(TOPDIR)/rules.mk

