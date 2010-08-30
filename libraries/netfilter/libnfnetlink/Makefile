# $Id: Makefile 273 2004-09-19 12:55:26Z gernot $

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

NAME	    = libnfnetlink
VERSION	    = 0.0.40
FORMAT	    = tar.bz2
CC	   += -Os $(KERNELFLAGS) $(TTL_KERNELINC)
PATCHES    += libnfnetlink-types.patch
MAKEARGS    = all
DO_PREPARE  = $(STAMP)-prepare
PREFIX	    = /opt/diet

FILES	    = ./opt/diet/lib-$(ARCH)
FILES	   += ./opt/diet/include

CPPFLAGS    = $(TTL_KERNELINC)
export CPPFLAGS

include $(TOPDIR)/rules.mk


