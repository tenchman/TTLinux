# $Id: Makefile 1309 2008-03-17 23:59:09Z gernot $

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

VERSION	    = 1.4.1
NAME	    = gnutls
FORMAT	    = tar.bz2

DO_PREPARE  = $(STAMP)-prepare
PREFIX	    = /opt/diet
CFLAGS      = $(CFLAGS_S)
PATCHES     = gnutls-subdir.patch
STRIPPIT    = yes
FILES	    = /opt/diet/lib-$(ARCH)
FILES	   += /opt/diet/include

ARGS        = $(HOSTARGS)
ARGS       += --disable-openssl-compatibility --disable-srp-authentication
ARGS       += --with-included-libtasn1 --disable-psk-authentication --disable-openpgp-authentication

ifeq ($(CONFIG_GNUTLS_STATIC),y)
LDFLAGS    += -static
MAKEARGS   += CCLD='--tag=CCLD $(COMPILER) -all-static'
endif

ifeq ($(CONFIG_GNUTLS_WITH_ZLIB),y)
ARGS	   += --with-zlib
else
ARGS       += --without-zlib
endif

ifeq ($(CONFIG_GNUTLS_WITH_LZO),y)
ARGS	   += --with-lzo
else
ARGS       += --without-lzo
endif

include $(TOPDIR)/rules.mk
