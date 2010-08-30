# $Id: Makefile 275 2004-09-19 17:49:20Z gernot $

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

NAME	    = svntrac
VERSION	    = 2.0.1
FORMAT      = tar.gz
REALNAME    = cvstrac-$(VERSION)
PKGSRC      = $(REALNAME).$(FORMAT)

PATCHES     = cvstrac-install.patch
PATCHES    += cvstrac-diet.patch
DO_PREPARE  = $(STAMP)-myprepare
LDFLAGS    += -lpthread
PREFIX	    = /opt/diet
STRIPPIT    = yes
CC          = $(COMPILER) $(CPPFLAGS)
MAKEARGS    = APPNAME=svntrac
INSTALLARGS = $(MAKEARGS) install

FILES	= /

include $(TOPDIR)/rules.mk

$(STAMP)-myprepare: cvstrac.mk
	perl -pi -e "s/sqlite3StrNICmp/strncasecmp/g" $(PACKAGE)/*.c
	perl -pi -e "s/sqlite3StrICmp/strcasecmp/g" $(PACKAGE)/*.c
	cp cvstrac.mk $(PACKAGE)/Makefile
	touch $(STAMP)-myprepare
