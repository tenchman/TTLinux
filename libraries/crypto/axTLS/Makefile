# $Id: Makefile 741 2006-09-17 20:33:57Z gernot $

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

NAME	    = axTLS
VERSION	    = 1.2.0
FORMAT	    = tar.gz
STRIPPIT    = yes
PATCHES     = axtls-config.patch
PATCHES    += axtls-install.patch
DO_PREPARE  =
DO_INSTALL  = $(STAMP)-myinstall
FILES	= /opt/diet/include /opt/diet/lib-$(ARCH) /opt/diet/bin

include $(TOPDIR)/rules.mk

$(STAMP)-myinstall: $(STAMP)-install
	mv $(TMPDIR)$(PREFIX)/lib/* $(TMPDIR)$(PREFIX)/lib-$(ARCH)
	touch $@
