# $Id: Makefile 223 2004-08-15 19:52:16Z gernot $

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

NAME	    = gsclu
VERSION	    = 0.5.1
FORMAT	    = tar.bz2
MAKEARGS    = KERNELINC=$(KERNELINC) all
ifeq ($(ARCH),i386)
  MAKEARGS += strip
  STRIPPIT  = no
else
  STRIPPIT  = yes
endif
DO_PREPARE  =
INSTALLARGS = install
STRIPPIT    = yes
CC          = $(COMPILER)
FILES	    = /etc/gtget /bin/*

include $(TOPDIR)/rules.mk
