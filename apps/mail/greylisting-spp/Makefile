# $Id: Makefile 1302 2008-03-13 23:50:46Z gernot $

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

NAME	    = greylisting-spp
VERSION	    = 0.2
FORMAT	    = tar.gz
FILES 	    = /etc/qmail/plugins
PATCHES     = greylisting-spp-debug.patch
PATCHES    += greylisting-spp-make.patch
PATCHES    += greylisting-spp-sqlite3.patch
CC         += -D_GNU_SOURCE
STRIPPIT    = y
DO_INSTALL  = $(STAMP)-myinstall
ifeq ($(CONFIG_GREYLIST_SQLITE),y)
MAKEARGS    = DB_IMPL=sqlite3
else
 ifeq ($(CONFIG_GREYLIST_BDB),y)
 MAKEARGS   = DB_IMPL=bdb
 endif
endif

ifeq ($(CONFIG_GREYLIST_STATIC),y)
CC        += -static
endif

include $(TOPDIR)/rules.mk

$(STAMP)-myinstall:
	install -d $(TMPDIR)/etc/qmail/plugins
	install $(PACKAGE)/,,build/src/greylisting-spp $(TMPDIR)/etc/qmail/plugins
	touch $(STAMP)-myinstall
