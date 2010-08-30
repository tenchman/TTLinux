# $Id: Makefile 1632 2009-05-11 11:59:24Z gernot $

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

NAME	    = procps
VERSION	    = 3.2.8
FORMAT	    = tar.gz
PREFIX	    = /usr
PATCHES	    = procps-3.2.7-diet.patch
CC	   += -D_BSD_SOURCE
CFLAGS	    = $(CFLAGS_S)
DO_PREPARE  = 
STRIPPIT    = yes
INSTALLARGS = install="install -D" install

MAKEARGS    = includedir=$(DISTDIR)/opt/diet/include
MAKEARGS   += CPPFLAGS='-I/opt/diet/include -I/opt/diet/include/ncurses -D_BSD_SOURCE' CFLAGS='$(CFLAGS_S)'

FILES	= /

include $(TOPDIR)/rules.mk
