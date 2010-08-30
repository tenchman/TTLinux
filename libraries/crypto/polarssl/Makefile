# $Id: Makefile 741 2006-09-17 20:33:57Z gernot $

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

NAME	    = polarssl
VERSION	    = 0.13.1
FORMAT	    = tgz
PKGSRC      = $(NAME)-$(VERSION)-gpl.tgz
STRIPPIT    = yes
PATCHES     = $(NAME)-config.patch
PATCHES    += $(NAME)-noprintf.patch
PATCHES    += $(NAME)-validator.patch
PATCHES    += $(NAME)-x509write.patch
DO_PREPARE  =
DO_INSTALL  = $(STAMP)-myinstall
FILES	    = /opt/diet/lib-$(ARCH)/* /opt/diet/include/polarssl/*.h
MAKEARGS    = DEFINES=-DHAVE_RDTSC OFLAGS='-Os -fomit-frame-pointer -ffunction-sections -fdata-sections'
CC          = $(COMPILER)

include $(TOPDIR)/rules.mk

$(STAMP)-myinstall: $(DO_BUILD)
	mkdir -p $(TMPDIR)$(PREFIX)/{lib,bin,include}
	PATH=$(PATH) \
	$(MAKE) -C $(PKGBUILDDIR) CC='$(CC)' DESTDIR=$(TMPDIR)$(PREFIX) install
	mv $(TMPDIR)$(PREFIX)/lib $(TMPDIR)$(PREFIX)/lib-$(ARCH)
	touch $(STAMP)-myinstall
