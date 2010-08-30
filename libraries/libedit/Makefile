# $Id: Makefile 1305 2008-03-17 06:50:59Z gernot $

include $(TOPDIR)/.config

VERSION	    = 0.3
NAME	    = libedit
FORMAT	    = tar.gz
PATCHES	    = $(NAME)-$(VERSION)-diet.patch
PATCHES	   += $(NAME)-$(VERSION)-awkpath.patch
DO_PREPARE  = $(STAMP)-prepare
PREFIX	    = /opt/diet
ARGS	    = --disable-shared
MAKEARGS    = .depend libedit.a CFLAGS='$(CFLAGS_S) -I/opt/diet/include -Wno-deprecated-declarations -D_BSD_SOURCE -I.'
INSTALLARGS = install-static

FILES	    = ./opt/diet/lib-$(ARCH)/libedit.a
FILES	    += ./opt/diet/include

include $(TOPDIR)/rules.mk
