# $Id: Makefile 1302 2008-03-13 23:50:46Z gernot $

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

NAME	    = qsf
VERSION	    = 1.1.13
FORMAT	    = tar.bz2
DO_PREPARE  = $(STAMP)-prepare
PREFIX	    = /usr
STRIPPIT    = yes
ARGS        = --without-mysql --without-gdbm --without-obtree --without-sqlite

FILES	    = /usr/bin/qsf /usr/share/man/man1/qsf.1.gz

include $(TOPDIR)/rules.mk
