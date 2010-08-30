# $Id: Makefile 1302 2008-03-13 23:50:46Z gernot $

include $(TOPDIR)/.config

NAME	    = openvpn
VERSION	    = 1.5.0
FORMAT	    = tar.gz
CC	   += -Os
MAKEARGS    = all
PREFIX	    = /usr

ARGS	    = --enable-mtu-dynamic
ifeq ($(CONFIG_LZO),y)
ARGS	   += --enable-lzo
else
ARGS	   += --disable-lzo
endif
ifeq ($(CONFIG_OPENSSL_THREADS),y)
ARGS	   += --enable-pthread
else
ARGS	   += --disable-pthread
endif

CPPFLAGS   += -nostdinc -I$(DIETINC) -I$(KERNELINC)
CFLAGS     += -nostdinc -I$(DIETINC) -I$(KERNELINC)
STRIPPIT    = yes
DO_PREPARE  = $(STAMP)-prepare

FILES	    = ./*

include $(TOPDIR)/rules.mk
