# $Id: Makefile 275 2004-09-19 17:49:20Z gernot $

include $(TOPDIR)/.config

NAME	    = pkg-config
VERSION	    = 0.21
FORMAT	    = tar.gz
DO_PREPARE  = $(STAMP)-prepare
PREFIX	    = /opt/diet

FILES	    = /opt/diet/bin/pkg-config
FILES      += /opt/diet/share/man/man1/pkg-config.1*
FILES      += /opt/diet/share/aclocal/pkg.m4

include $(TOPDIR)/rules.mk

$(STAMP)-myprepare: cvstrac.mk
	cp cvstrac.mk $(PACKAGE)/Makefile
	touch $(STAMP)-myprepare
