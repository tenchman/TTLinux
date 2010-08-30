# $Id: Makefile 911 2007-02-15 22:34:15Z gernot $

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

NAME	    = tre
VERSION	    = 0.7.5
FORMAT	    = tar.bz2
PREFIX	    = /opt/diet
DO_PREPARE  = $(STAMP)-prepare

FILES 	    = /opt/diet/bin/* /opt/diet/lib-$(ARCH)/* /opt/diet/include/tre/*
ifeq ($(CONFIG_INSTALL_MANUALS),y)
FILES      += /opt/diet/share/man/*
endif

include $(TOPDIR)/rules.mk
