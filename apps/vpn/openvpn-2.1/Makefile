# $Id: Makefile 249 2004-09-02 17:18:32Z gernot $

include $(TOPDIR)/.config

NAME	    = openvpn
VERSION	    = 2.1_rc21
FORMAT	    = tar.gz
CC	   += -Os
MAKEARGS    = all
PREFIX	    = /usr
PATCHES     = openvpn-2.0-openssl.patch
#PATCHES    += openvpn-2.1-diet.patch

ARGS	    = --enable-iproute2 --disable-debug --enable-small
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
ifeq ($(CONFIG_OPENVPN_STATIC),y)
CC          = $(COMPILER)
LDFLAGS     = -static -Wl,--gc-sections
endif

CPPFLAGS   += -nostdinc -I$(DIETINC) -I$(KERNELINC)
CFLAGS     += -nostdinc -I$(DIETINC) -I$(KERNELINC)
LDFLAGS     = -ldl
STRIPPIT    = yes
DO_PREPARE  = $(STAMP)-prepare

include $(TOPDIR)/rules.mk
