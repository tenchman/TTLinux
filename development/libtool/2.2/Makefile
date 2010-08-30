# $Id: Makefile 503 2005-11-22 23:41:26Z gernot $

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

VERSION	      = 2.2.4
NAME	      = libtool
FORMAT	      = tar.bz2
DO_PREPARE    = $(STAMP)-prepare
DO_INSTALL    = $(STAMP)-myinstall
CFLAGS        = $(CFLAGS_S)
PREFIX	      = /opt/diet
STRIPPIT      = yes

FILES	      = $(PREFIX)

include $(TOPDIR)/rules.mk

$(STAMP)-myinstall: $(STAMP)-install
	perl -pi -e "s,^sys_lib_search_path_spec.*,sys_lib_search_path_spec=\"/opt/diet/$(TARGETALIAS)/lib /opt/diet/lib-$(ARCH)/gcc/$(TARGETALIAS)/$(GCCVER) /opt/diet/lib-$(ARCH)\",g" $(TMPDIR)/opt/diet/bin/libtool
	perl -pi -e "s,^sys_lib_dlsearch_path_spec.*,sys_lib_dlsearch_path_spec=\"/opt/diet/lib-$(ARCH) /opt/diet/lib-$(ARCH)/gcc/$(TARGETALIAS)/$(GCCVER)\",g" $(TMPDIR)/opt/diet/bin/libtool
	touch $(STAMP)-myinstall
