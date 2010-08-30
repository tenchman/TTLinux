# $Id: Makefile 1349 2008-04-16 06:46:48Z gernot $

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

VERSION	     = 5.6
NAME	     = ncurses
FORMAT	     = tar.gz
PATCHES	     = ncurses-5.3-diet.patch
CC	    += -D_BSD_SOURCE
CFLAGS       =
ARGS	     = --without-cxx --without-debug --without-profile $(HOSTARGS)
ARGS	    += --without-progs --without-ada --enable-sigwinch --enable-hard-tabs
ARGS	    += --disable-big-core --with-terminfo-dirs=/usr/share/terminfo 
ARGS	    += --with-default-terminfo-dir=/usr/share/terminfo --with-ospeed='unsigned int'
ARGS        += --disable-widec HOSTCC='gcc' HOSTCPPFLAGS='' CFLAGS=''
DO_PREPARE   = $(STAMP)-prepare
PREFIX	     = /opt/diet
INSTALLARGS  = install.libs
STRIPPIT     = yes
MAKEARGS     = libs HOSTCC='gcc' CFLAGS=''

ifeq ($(CONFIG_NCURSES_STATIC),y)
ARGS        += --without-shared
else
ARGS        += --with-shared
endif

FILES	    = $(PREFIX)/lib-$(ARCH)
FILES	   += $(PREFIX)/include

unexport LDFLAGS LD LINKER CPPFLAGS
LINKER=
LD=
LDFLAGS=
CPPFLAGS=

include $(TOPDIR)/rules.mk
