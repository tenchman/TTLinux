# $Id$

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

NAME	    = package
FORMAT	    = tar.bz2
VERSION	    = 0.0.0
ifeq ($(CONFIG_PACKAGE_STATIC),y)
LDFLAGS    += -static
CC          = $(COMPILER)
endif
PREFIX      = /usr
STRIPPIT    = yes
DO_PREPARE  = $(STAMP)-prepare
FILES	    = /

include $(TOPDIR)/rules.mk
