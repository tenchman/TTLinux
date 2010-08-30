# $Id: Makefile 1440 2008-07-17 13:50:18Z gernot $

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

VERSION	      = 1.11
NAME	      = minised
FORMAT	      = tar.gz
PATCHES       = minised-install.patch
DO_PREPARE    =
STRIPPIT      = yes
MAKEARGS      = PROGRAM=sed
INSTALLARGS   = PREFIX=/ PROGRAM=sed install
CC            = $(COMPILER) $(CFLAGS_S) -static

FILES	= /bin/sed

include $(TOPDIR)/rules.mk
