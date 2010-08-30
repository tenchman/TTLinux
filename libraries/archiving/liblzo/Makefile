# $Id: Makefile 1350 2008-04-16 21:37:33Z gernot $

include $(TOPDIR)/.config

NAME	    = lzo
VERSION	    = 2.02
FORMAT	    = tar.gz
CC	   += -Os
MAKEARGS    = all
DO_PREPARE  = $(STAMP)-prepare
PREFIX	    = /opt/diet

FILES	    = ./opt/diet/lib-$(ARCH)
FILES	   += ./opt/diet/include

ifeq ($(SHARED),y)
ARGS	    = --enable-shared
endif

include $(TOPDIR)/rules.mk
