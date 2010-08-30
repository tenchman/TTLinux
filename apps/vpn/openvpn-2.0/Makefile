# $Id: Makefile 249 2004-09-02 17:18:32Z gernot $

include $(TOPDIR)/.config

NAME	    = openvpn
VERSION	    = 2.0.9
FORMAT	    = tar.gz
CC	   += -Os
MAKEARGS    = all
PREFIX	    = /usr
PATCHES     = openvpn-2.0-openssl.patch

ARGS	    = --enable-iproute2 --disable-debug --enable-small --disable-pthread $(HOSTARGS)
ifeq ($(CONFIG_LZO),y)
ARGS	   += --enable-lzo
else
ARGS	   += --disable-lzo
endif
ifeq ($(CONFIG_OPENVPN_STATIC),y)
CC          = $(COMPILER)
LDFLAGS     = -static -Wl,--gc-sections
endif

#CPPFLAGS   += -nostdinc -I$(DIETINC) -I$(KERNELINC)
#CFLAGS     += -nostdinc -I$(DIETINC) -I$(KERNELINC)
STRIPPIT    = yes
DO_PREPARE  = $(STAMP)-prepare

include $(TOPDIR)/rules.mk
