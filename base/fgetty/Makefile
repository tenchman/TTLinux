# $Id: Makefile 223 2004-08-15 19:52:16Z gernot $

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

NAME	    = fgetty
VERSION	    = 0.6
FORMAT	    = tar.bz2
PATCHES	    = fgetty-0.6-make.patch
DO_PREPARE  =
STRIPPIT    = yes
PREFIX	    = /usr
MAKEARGS    = CFLAGS='$(CFLAGS_S)'
CC	    = $(COMPILER) -static

FILES	    = /bin/* /sbin/*

include $(TOPDIR)/rules.mk
