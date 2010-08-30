# $Id: Makefile 273 2004-09-19 12:55:26Z gernot $

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

NAME	    = eventlog
VERSION	    = 0.2.5
FORMAT	    = tar.gz
DO_PREPARE  = $(STAMP)-prepare
PREFIX	    = /opt/diet

FILES	    = ./opt/diet/lib-$(ARCH)
FILES	   += ./opt/diet/include

include $(TOPDIR)/rules.mk
