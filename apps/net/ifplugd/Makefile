# $Id$

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

NAME	    = ifplugd
FORMAT	    = tar.gz
VERSION	    = 0.28
ifeq ($(CONFIG_PACKAGE_STATIC),y)
LDFLAGS    += -static
CC          = $(COMPILER)
endif
PREFIX      = /usr
STRIPPIT    = yes
DO_PREPARE  = $(STAMP)-prepare
FILES	    = /

include $(TOPDIR)/rules.mk
