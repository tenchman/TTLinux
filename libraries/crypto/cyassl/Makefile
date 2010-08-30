# $Id: Makefile 1805 2010-01-05 19:30:20Z gernot $

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

NAME	    = cyassl
VERSION	    = 1.2.0
FORMAT	    = zip
STRIPPIT    = yes
ARGS       += --with-zlib=/opt/diet
ARGS       += --enable-opensslExtra
PATCHES     = patches/cyassl-install.patch
DO_PREPARE  = $(STAMP)-prepare
DO_INSTALL  = $(STAMP)-install
CC         += -D_POSIX_THREADS
FILES	    = /opt/diet/include /opt/diet/lib-$(ARCH)

include $(TOPDIR)/rules.mk
