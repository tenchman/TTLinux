# $Id: Makefile 1302 2008-03-13 23:50:46Z gernot $

include $(TOPDIR)/.config

VERSION	    = 0.9.7
NAME	    = librsync
FORMAT	    = tar.gz

DO_PREPARE  = $(STAMP)-prepare
PREFIX	    = /opt/diet
# MAKEARGS    = libpng.a
INSTALLARGS = install LIBPATH=/opt/diet/lib-$(ARCH)

FILES	    = ./opt/diet/lib-$(ARCH)
FILES	   += ./opt/diet/include
FILES      += ./opt/diet/bin 

include $(TOPDIR)/rules.mk

