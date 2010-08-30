# $Id: Makefile 1302 2008-03-13 23:50:46Z gernot $

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

VERSION	    = 1.3
NAME	    = libgpg-error
FORMAT	    = tar.gz

DO_PREPARE  = $(STAMP)-prepare
PREFIX	    = /opt/diet

FILES	    = ./opt/diet/lib-$(ARCH)
FILES	   += ./opt/diet/include
FILES	   += ./opt/diet/bin

ifeq ($(SHARED),n)
ARGS	    = --disable-shared
endif

include $(TOPDIR)/rules.mk
