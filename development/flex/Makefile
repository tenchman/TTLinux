# $Id: Makefile 235 2004-08-26 10:24:04Z gernot $

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

VERSION	      = 2.5.35
NAME	      = flex
FORMAT	      = tar.bz2
DO_PREPARE    = $(STAMP)-prepare
CHECK         = check
PREFIX	      = /opt/diet
CFLAGS        = $(CFLAGS_S)
STRIPPIT      = yes
PATCHES       = flex-skel.patch

ARGS=ac_cv_func_malloc_0_nonnull=yes ac_cv_func_realloc_0_nonnull=yes

FILES	      = ./opt/diet/*

include $(TOPDIR)/rules.mk
