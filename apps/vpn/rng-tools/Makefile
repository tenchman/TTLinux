# $Id: Makefile 249 2004-09-02 17:18:32Z gernot $

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

NAME	    = rng-tools
VERSION	    = 2
FORMAT	    = tar.gz
STRIPPIT    = yes
DO_PREPARE  = $(STAMP)-prepare
MAKEARGS    = LIBS="-largp -lcompat" LDFLAGS="-static"
FILES       = $(PREFIX)/bin/rngtest $(PREFIX)/sbin/rngd
FILES      += $(PREFIX)/share/man/man1/rngtest.1.bz2 $(PREFIX)/share/man/man8/rngd.8.bz2

include $(TOPDIR)/rules.mk
