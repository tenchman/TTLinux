# $Id: Makefile 1309 2008-03-17 23:59:09Z gernot $

include $(TOPDIR)/.config

NAME	    = qdbm
VERSION	    = 1.8.49
# PATCHES	    = qdbm-ldrun.patch
FORMAT	    = tar.gz
DO_PREPARE  = $(STAMP)-prepare
ARGS	    = --enable-nolock
MAKE_ARGS   = static
PREFIX	    = /opt/diet
MAKEARGS    = LD='$(LD)'

FILES	= ./opt/diet/lib-$(ARCH)/*.[as]*
FILES  += ./opt/diet/include

export HOME=/opt/diet

include $(TOPDIR)/rules.mk
