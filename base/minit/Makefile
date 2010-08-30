# $Id: Makefile 223 2004-08-15 19:52:16Z gernot $

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

NAME	    = minit
VERSION	    = 0.10
PATCHLEVEL  = 1
FORMAT	    = tar.bz2

DO_PREPARE  =
PATCHES     = minit-0.10-shutdown.patch
PATCHES    += minit-0.10-roswitch.patch
PATCHES    += minit-0.10-down.patch
PATCHES    += minit-0.10-sysV.patch
PATCHES    += minit-0.10-memleak.patch
STRIPPIT    = yes
PREFIX	    = /usr
MAKEARGS    = DIET= CFLAGS='$(CFLAGS_S) -I/opt/diet/include/libowfat'
CC	    = $(COMPILER) -static -DSHUTDOWN_CANCEL

FILES	    = /bin/* /sbin/* /etc/minit/*

include $(TOPDIR)/rules.mk
