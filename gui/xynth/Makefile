# $Id: Makefile 1302 2008-03-13 23:50:46Z gernot $

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

NAME	    = xynth
VERSION	    = 0.8.40
FORMAT	    = tar.bz2
DO_PREPARE  =
DO_INSTALL  = $(STAMP)-myinstall
PATCHES     = xynth-0.8.40-config.patch
PATCHES    += xynth-0.8.40-diet.patch
PATCHES    += xynth-0.8.40-make.patch
CFLAGS     += -D_BSD_SOURCE 
MAKEARGS    = CXX='$(CXX)' _INSTALLDIR=$(PREFIX)/xynth
INSTALLARGS = CXX='$(CXX)' _INSTALLDIR=$(TMPDIR)$(PREFIX)/xynth install
FILES	    = /$(PREFIX)/xynth
ifneq ($(CONFIG_XYNTH_DEBUG),y)
STRIPPIT    = yes
endif

include $(TOPDIR)/rules.mk

$(STAMP)-myinstall: $(STAMP)-install
	mv $(TMPDIR)$(PREFIX)/xynth/lib $(TMPDIR)$(PREFIX)/xynth/lib-$(ARCH)
	install -m 0755 files/startxynth $(TMPDIR)$(PREFIX)/xynth/bin
	touch $(STAMP)-myinstall
