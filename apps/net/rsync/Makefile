# $Id: Makefile 380 2005-01-12 11:08:30Z gernot $

include $(TOPDIR)/.config

VERSION		= 3.0.3
NAME		= rsync
PREFIX          = /usr
FORMAT		= tar.gz
ARGS		= --disable-iconv --disable-acl-support --disable-xattr-support
DO_PREPARE      = $(STAMP)-prepare
CFLAGS          = $(CFLAGS_S)

STRIPPIT	= yes
FILES	        = /usr/bin/rsync

include $(TOPDIR)/rules.mk
