# $Id$

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

NAME	    = usbutils
FORMAT	    = tar.gz
VERSION	    = 0.86
CFLAGS     += -D_GNU_SOURCE
# static linking doesn't worky :-)
#LDFLAGS    += -static
#CC          = $(COMPILER)
ARGS       += --datadir=$(PREFIX)/share/hwdata
PREFIX      = /usr
STRIPPIT    = yes
DO_PREPARE  = $(STAMP)-prepare
FILES	    = /

include $(TOPDIR)/rules.mk
