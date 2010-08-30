# $Id: Makefile 503 2005-11-22 23:41:26Z gernot $

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

VERSION	      = 1.5
NAME	      = automake
FORMAT	      = tar.gz
DO_PREPARE    = $(STAMP)-prepare
CFLAGS        = $(CFLAGS_S)
PREFIX	      = /opt/diet
STRIPPIT      = yes
ARGS          = --program-suffix=-1.5

FILES	      = $(PREFIX)

include $(TOPDIR)/rules.mk
