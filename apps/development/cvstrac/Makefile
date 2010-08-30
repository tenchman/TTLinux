# $Id: Makefile 275 2004-09-19 17:49:20Z gernot $

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

NAME	    = cvstrac
VERSION	    = 2.0.1
FORMAT	    = tar.gz
PATCHES     = $(NAME)-diet.patch
PATCHES    += $(NAME)-install.patch
DO_PREPARE  = $(STAMP)-myprepare
LDFLAGS    += -lpthread
PREFIX	    = /opt/diet
STRIPPIT    = yes
CC          = $(COMPILER) $(CPPFLAGS)

FILES	= /usr/bin/cvstrac

include $(TOPDIR)/rules.mk

$(STAMP)-myprepare: cvstrac.mk
	sed -i -e "s/sqlite3StrNICmp/strncasecmp/g" $(PKGBUILDDIR)/*.c
	sed -i -e "s/sqlite3StrICmp/strcasecmp/g" $(PKGBUILDDIR)/*.c
	cp cvstrac.mk $(PKGBUILDDIR)/Makefile
	touch $(STAMP)-myprepare
