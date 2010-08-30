# $Id: Makefile 1302 2008-03-13 23:50:46Z gernot $

include $(TOPDIR)/.config

NAME	    = time
VERSION	    = 1.7
FORMAT	    = tar.gz
CFLAGS	   += -D_BSD_SOURCE -DHAVE_WAIT3
PATCHES     = time-1.7-install.patch
PREFIX	    = /usr
DO_PREPARE  = $(STAMP)-prepare
STRIPPIT    = yes
ARGS        = --disable-dependency-tracking

FILES       = /usr/bin/time /usr/share/info/time.info

include $(TOPDIR)/rules.mk
