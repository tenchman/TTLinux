# $Id: Makefile 223 2004-08-15 19:52:16Z gernot $

include $(TOPDIR)/.config

NAME	    = mde
VERSION	    = 1.3.0
FORMAT	    = tar.gz
DO_PREPARE  = $(STAMP)-prepare
CFLAGS     += $(CFLAGS_S) -D_BSD_SOURCE 
STRIPPIT    = yes
ARGS	    = --prefix=/opt/diet --target=i386-dietlibc-linux --host=i386-dietlibc-linux
ARGS	   += --build=i386-linux
ifeq ($(CONFIG_MINIGUI_LITE),y)
MAKEARGS   += LIBS='-lminigui -lcompat -lm'
else
MAKEARGS   += LIBS='-lminigui -lcompat -lpthread -lm'
endif
FILES	= ./opt/diet/*

include $(TOPDIR)/rules.mk
