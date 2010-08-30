# $Id: Makefile 273 2004-09-19 12:55:26Z gernot $

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

NAME	    = libnetfilter_log
VERSION	    = 0.0.13
FORMAT	    = tar.bz2
CC	   += -Os $(KERNELFLAGS)
MAKEARGS    = all
DO_PREPARE  = $(STAMP)-prepare
PREFIX	    = /opt/diet
ARGS 	    =  --with-kernel=$(KERNELINC)

FILES	    = ./opt/diet/lib-$(ARCH)
FILES	   += ./opt/diet/include

include $(TOPDIR)/rules.mk

CPPFLAGS     = -Wno-deprecated-declarations
LDFLAGS      = -lnfnetlink
export CPPFLAGS LDFLAGS

