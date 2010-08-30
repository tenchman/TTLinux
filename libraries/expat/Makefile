# $Id: Makefile 419 2005-04-27 08:01:50Z gernot $

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

VERSION	    = 2.0.1
NAME	    = expat
FORMAT	    = tar.gz
# PATCHES	    = expat-1.95.8-diet.patch
# DO_AUTOCONF = $(STAMP)-autoconf
DO_PREPARE  = $(STAMP)-prepare
CC         += -D_BSD_SOURCE

FILES	= ./opt/diet/lib-$(ARCH)
FILES  += ./opt/diet/include

include $(TOPDIR)/rules.mk
