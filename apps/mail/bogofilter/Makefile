# $Id: Makefile 1302 2008-03-13 23:50:46Z gernot $

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

NAME	    = bogofilter
VERSION	    = 1.0.2
FORMAT	    = tar.bz2
DO_PREPARE  = $(STAMP)-prepare
ARGS	    = --with-included-gsl
PATCHES     = bogofilter-0.96.6-ushort.patch
# MAKE_ARGS   = static
PREFIX	    = /usr
STRIPPIT    = yes
HOSTVER	    =
ifeq ($(CONFIG_BOGOFILTER_QDBM),y)
ARGS	   += --with-database=qdbm
else
# we use the fucking sleepycat db
CC	   += -D_GNU_SOURCE
endif


FILES	= ./usr/bin/bogofilter

include $(TOPDIR)/rules.mk
