# $Id: Makefile 223 2004-08-15 19:52:16Z gernot $

include $(TOPDIR)/.config

NAME	    = libminigui
VERSION	    = 1.3.3
FORMAT	    = tar.gz
PATCHES	    = libminigui-1.3.3-diet.patch
DO_PREPARE  = $(STAMP)-prepare
CFLAGS     += $(CFLAGS_S) -D_BSD_SOURCE 
STRIPPIT    = yes
ARGS	    = --prefix=/opt/diet --target=i386-dietlibc-linux --host=i386-dietlibc-linux
ARGS	   += --build=i386-linux --enable-kbddelatin1
# --disable-nativegal
ifeq ($(CONFIG_MINIGUI_LITE),y)
ARGS	   += --enable-lite
endif
FILES	= ./opt/diet/*

include $(TOPDIR)/rules.mk
