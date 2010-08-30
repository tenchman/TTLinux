# $Id: Makefile 208 2004-05-11 21:24:14Z gernot $

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

NAME	    = fdlibm
VERSION	    = 53
FORMAT	    = tar.gz
DO_PREPARE  = $(STAMP)-prepare
PATCHES	    = fdlibm-53-dyn.patch
PATCHES	   += fdlibm-53-float.patch
LIBNAME	    = libm
ifneq ($(SHARED),y)
CC	    = diet -Os gcc
ARGS	    = --disable-shared
MAKEARGS    = LIBNAME=$(LIBNAME) $(LIBNAME).a
else
CC	    = diet-dyn -Os gcc
MAKEARGS    = LIBNAME=$(LIBNAME) $(LIBNAME).a $(LIBNAME).so
endif
INSTALLARGS = LIBNAME=$(LIBNAME) install
PREFIX	    = /opt/diet

FILES	= ./opt/diet/lib-$(ARCH)/$(LIBNAME).*

include $(TOPDIR)/rules.mk
