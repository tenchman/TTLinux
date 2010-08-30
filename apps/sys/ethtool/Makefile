# $Id: Makefile 225 2004-08-18 10:51:51Z gernot $

include $(TOPDIR)/.config
VERSION	      = 6
NAME	      = ethtool
FORMAT	      = tar.gz
DO_PREPARE    = $(STAMP)-autoconf $(STAMP)-prepare
PREFIX	      = /usr
STRIPPIT      = yes
PATCHES	      = ethtool-diet.patch
PATCHES      += ethtool-ixp4xx.patch
LDFLAGS	      = -static
ARGS	     += --sbindir=/sbin

FILES	     += ./*

include $(TOPDIR)/rules.mk
