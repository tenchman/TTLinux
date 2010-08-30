# $Id: Makefile 1486 2008-09-05 11:52:16Z gernot $

include $(TOPDIR)/.config

VERSION	    = 1.0.5
NAME	    = bzip2
FORMAT	    = tar.gz
PATCHES	    = bzip2-1.0.4-make.patch
DO_PREPARE  = 
PREFIX	    = /opt/diet
INSTALLARGS = PREFIX=/opt/diet LIBDIR=/opt/diet/lib-$(ARCH) install

ifeq ($(SHARED),y)
MAKEARGS    = -f Makefile-libbz2_so
else
MAKEARGS    = libbz2.a bzip2 bzip2recover
endif

FILES	    = /opt/diet/lib-$(ARCH)/*
FILES	   += /opt/diet/include/*
FILES	   += /opt/diet/bin/*

include $(TOPDIR)/rules.mk
