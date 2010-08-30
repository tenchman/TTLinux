# $Id: Makefile 275 2004-09-19 17:49:20Z gernot $

include $(TOPDIR)/.config

NAME	    = sqlite3
FORMAT      = tar.gz
VERSION	    = 3.6.14.2
REALNAME    = sqlite-$(VERSION)
PKGSRC      = $(REALNAME).$(FORMAT)

PATCHLEVEL  = 1
DO_PREPARE  = $(STAMP)-myprepare
PREFIX	    = /opt/diet
CFLAGS     += -DNO_TCL=1 -D_REENTRANT -ffunction-sections -fdata-sections
LDFLAGS     = -lcompat
ARGS       += --disable-tcl --disable-threadsafe
MAKEARGS    = READLINE_FLAGS="" TCL_FLAGS=""

FILES	= $(PREFIX)/lib-$(ARCH)/*.[as]*
FILES  += $(PREFIX)/include
FILES  += $(PREFIX)/bin/*

include $(TOPDIR)/rules.mk

$(STAMP)-myprepare: $(STAMP)-prepare
	sed -i \
	  -e "s,/usr/include,$(PREFIX)/include,g" \
	  -e "s,/usr/lib,$(PREFIX)/lib-$(ARCH),g" \
	  -e "s,\(^LTLINK.*\),\1 -all-static," \
		$(PACKAGE)/Makefile
	touch $(STAMP)-myprepare
