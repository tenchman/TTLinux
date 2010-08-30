# $Id$

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

NAME	    = rfkill
FORMAT	    = tar.bz2
VERSION	    = 0.4
LDFLAGS    += -static
CC          = $(COMPILER)
PREFIX      = /usr
STRIPPIT    = yes
DO_PREPARE  = # $(STAMP)-prepare
FILES	    = /

include $(TOPDIR)/rules.mk
