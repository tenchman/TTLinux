# $Id: Makefile 223 2004-08-15 19:52:16Z gernot $

include $(TOPDIR)/.config

NAME	    = minigui-res
VERSION	    = 1.3.3
FORMAT	    = tar.gz
DO_PREPARE  = 
STRIPPIT    = yes
INSTALLARGS = prefix=$(TMPDIR)/opt/diet resdir=$(TMPDIR)/opt/diet/lib-$(ARCH)/minigui install

FILES	= ./opt/diet/*

include $(TOPDIR)/rules.mk
