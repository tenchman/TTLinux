# $Id: Makefile 1302 2008-03-13 23:50:46Z gernot $

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

NAME	    = httpauth
VERSION	    = 0.5.1
FORMAT	    = tar.gz
STRIPPIT    = yes
PATCHES     = httpauth-mutex.patch
DO_PREPARE  = $(STAMP)-prepare
PREFIX	    = /usr
CC	   += $(CFLAGS_S) -ffunction-sections -fdata-sections -DCONF_PREFIX=/etc/$(NAME)
LDFLAGS	   += -Wl,--gc-sections -lcompat

ifeq ($(CONFIG_HTTPAUTH_NTLM),y)
ARGS       += --enable-ntlm
else
ARGS       += --disable-ntlm
endif

ifeq ($(CONFIG_HTTPAUTH_STATIC),y)
MAKEARGS   += CCLD='--tag=CCLD $(COMPILER) -all-static'
endif

CFLAGS	    = $(CFLAGS_S)

FILES	    = .$(PREFIX)/sbin 

include $(TOPDIR)/rules.mk
