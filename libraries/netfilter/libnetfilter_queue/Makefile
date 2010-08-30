# $Id: Makefile 273 2004-09-19 12:55:26Z gernot $

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

NAME	    = libnetfilter_queue
VERSION	    = 0.0.16
FORMAT	    = tar.bz2
CC	   += -Os $(KERNELFLAGS) $(TTL_KERNELINC)
MAKEARGS    = all
DO_PREPARE  = $(STAMP)-prepare
PREFIX	    = /opt/diet

FILES	    = ./opt/diet/lib-$(ARCH)
FILES	   += ./opt/diet/include

include $(TOPDIR)/rules.mk

CPPFLAGS     = -Wno-deprecated-declarations
LDFLAGS      = -lnfnetlink
export CPPFLAGS LDFLAGS

