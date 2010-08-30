# $Id: Makefile 1432 2008-07-08 21:41:22Z gernot $

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

NAME	    = mathopd
VERSION	    = 1.6b9
FORMAT	    = tar.gz
STRIPPIT    = yes
DO_PREPARE  =
PKGSUBDIR   = src
FILES       = $(PREFIX)/sbin/mathopd
PREFIX      = /usr
INSTALLARGS = PREFIX=$(PREFIX) install

include $(TOPDIR)/rules.mk
