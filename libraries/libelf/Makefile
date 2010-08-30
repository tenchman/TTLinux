# $Id: Makefile 223 2004-08-15 19:52:16Z gernot $

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

NAME	    = libelf
VERSION	    = 0.8.6
FORMAT	    = tar.gz
DO_PREPARE  = $(STAMP)-prepare
CFLAGS     += $(CFLAGS_S) -D_BSD_SOURCE 
STRIPPIT    = yes
INSTALLARGS = instroot=$(TMPDIR) install

FILES	= /opt/diet/lib-$(ARCH) /opt/diet/include

include $(TOPDIR)/rules.mk
