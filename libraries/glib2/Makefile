# $Id: Makefile 273 2004-09-19 12:55:26Z gernot $

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

NAME	    = glib
VERSION	    = 2.24.2
FORMAT	    = tar.bz2
PATCHES     = glib-diet.patch
DO_PREPARE  = $(STAMP)-prepare
PREFIX	    = /opt/diet
ARGS        = --with-libiconv=no --enable-static

ifneq ($(TTL_KERNELARCH), x86)
# disable some checks which can't performed while cross compiling
ARGS       += glib_cv_stack_grows=no glib_cv_uscore=no
ARGS       += ac_cv_func_posix_getpwuid_r=yes
endif

FILES	    = ./opt/diet/lib-$(ARCH)
FILES	   += ./opt/diet/include

include $(TOPDIR)/rules.mk
