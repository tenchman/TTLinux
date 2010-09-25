# $Id: Makefile 1302 2008-03-13 23:50:46Z gernot $

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

NAME	      = havp
VERSION	      = 0.82
FORMAT	      = tar.gz
CC	     += -D_BSD_SOURCE -Os -s
DO_PREPARE    = $(STAMP)-myprepare
STRIPPIT      = yes
FILES	      = /
PATCHES       = havp-install.patch
PREFIX        = /usr

include $(TOPDIR)/rules.mk

$(STAMP)-myprepare: $(STAMP)-prepare
	find $(PACKAGE) -type f -exec sed -i -e "s,/usr/local/etc,/etc,g" {} \;
	touch $(STAMP)-myprepare
