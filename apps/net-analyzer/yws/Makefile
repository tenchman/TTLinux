# $Id$

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

NAME	    = yws
FORMAT	    = tar.bz2
VERSION	    = 1.0.7
ifeq ($(CONFIG_PACKAGE_STATIC),y)
LDFLAGS    += -static
CC          = $(COMPILER)
endif
MAKEARGS    = CC='$(CC)' CXX='$(CXX)'
STRIPPIT    = yes
DO_PREPARE  = 
FILES	    = /var/lib/$(NAME)/* /usr/bin/* /var/log/*

include $(TOPDIR)/rules.mk
