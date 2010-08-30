# $Id: Makefile 1516 2008-10-17 12:08:13Z gernot $

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

VERSION	      = 3.0.11b8
NAME	      = ez-ipupdate
FORMAT	      = tar.gz
PATCHLEVEL    = 3
PATCHES      += patches/001-debian_subset.patch
PATCHES      += patches/002-ez_ipupdate_everydns.patch
PATCHES      += patches/003-dnsexit.patch
PATCHES      += patches/004-noip.patch
PATCHES      += patches/005-gnudip.patch
DO_PREPARE    = $(STAMP)-prepare
PREFIX	      = /usr
CC           += -D_LIBC -D_GNU_SOURCE
STRIPPIT      = yes

FILES	= ./usr/bin/ez-ipupdate

include $(TOPDIR)/rules.mk
