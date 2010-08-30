# $Id: Makefile 249 2004-09-02 17:18:32Z gernot $

include $(TOPDIR)/.config

NAME	    = checkpassword
VERSION	    = 0.90
FORMAT	    = tar.gz
PREFIX	    = /usr
ifneq ($(ARCH),i386)
PATCHES     = checkpassword-cross.patch
endif
MAKEARGS    = prog
DO_PREPARE  = $(STAMP)-myprepare
DO_INSTALL  = $(STAMP)-myinstall

FILES	    = ./bin

include $(TOPDIR)/rules.mk

$(STAMP)-myprepare:
	echo "$(COMPILER) -Os -fomit-frame-pointer -fno-builtin" >$(PACKAGE)/conf-cc
	echo "$(COMPILER) -static -s" >$(PACKAGE)/conf-ld
	touch $(STAMP)-myprepare

$(STAMP)-myinstall: $(DO_PREPARE) $(DO_BUILD)
	(cd $(PACKAGE); \
		install -d $(TMPDIR)/bin; \
		install checkpassword $(TMPDIR)/bin; \
	)
	touch $(STAMP)-myinstall
