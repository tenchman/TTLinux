# $Id: Makefile 170 2004-03-24 16:33:53Z gernot $

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

NAME	    = libowfat
FORMAT	    = tar.bz2
VERSION	    = 0.27
DO_PREPARE  = $(STAMP)-myprepare
PREFIX	    = /opt/diet
MAKEARGS    = DIET=
CC 	    = $(COMPILER) -L$(TARGETLIBDIR)
INSTALLARGS = INCLUDEDIR=$(TMPDIR)/opt/diet/include/libowfat
INSTALLARGS+= LIBDIR=$(TMPDIR)/opt/diet/lib-$(ARCH)
INSTALLARGS+= MAN3DIR=$(TMPDIR)/opt/diet/share/man/man3
INSTALLARGS+= install

FILES	= /opt/diet/include/libowfat
FILES  += /opt/diet/lib-$(ARCH)

include $(TOPDIR)/rules.mk

$(STAMP)-myprepare:
	echo -n > $(PKGBUILDDIR)/havesl.h
	touch $@
