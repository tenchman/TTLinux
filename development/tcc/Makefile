# $Id: Makefile 208 2004-05-11 21:24:14Z gernot $

include $(TOPDIR)/.config

NAME	    = tcc
VERSION	    = 0.9.20
FORMAT	    = tar.gz
DO_PREPARE  = $(STAMP)-prepare
PATCHES	    = tcc-0.9.20-boundscheck.patch
PATCHES	   += tcc-0.9.20-cast.patch
PATCHES	   += tcc-0.9.20-diet2.patch
#PATCHES	   += tcc-0.9.20-fix-nostdlib.patch
#PATCHES	   += tcc-0.9.20-globl-doc-fix.patch
#PATCHES	   += tcc-0.9.20-globl_to_global.patch

ifneq ($(SHARED),y)
ARGS	    = --disable-shared
endif

CFLAGS	   += -D_NO_REGPARM
PREFIX	    = /opt/diet
MAKEARGS    = CFLAGS='$(CFLAGS)'
FILES	= ./opt/diet/*

include $(TOPDIR)/rules.mk
