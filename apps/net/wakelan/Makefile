# $Id: Makefile 225 2004-08-18 10:51:51Z gernot $

include $(TOPDIR)/.config
VERSION	      = 1.1
NAME	      = wakelan
FORMAT	      = tar.gz
DO_PREPARE    = $(STAMP)-prepare
PATCHES       = wakelan-DESTDIR.patch
PREFIX	      = /usr
STRIPPIT      = yes
LDFLAGS	      = -static
ARGS	     += --sbindir=/sbin

FILES	     += ./*

include $(TOPDIR)/rules.mk
