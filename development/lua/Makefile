# $Id: Makefile 838 2006-11-20 11:39:57Z gernot $
include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

NAME	    = lua
VERSION	    = 5.1.4
FORMAT	    = tar.gz
DO_PREPARE  =
MAKEARGS    = PLAT=generic CFLAGS='$(CFLAGS_S)'
INSTALLARGS = INSTALL_TOP=$(TMPDIR)/opt/diet install
FILES       = /opt/diet/bin/lua*

include $(TOPDIR)/rules.mk
