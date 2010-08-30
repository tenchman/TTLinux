# $Id: Makefile 1817 2010-02-10 15:53:26Z gernot $

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

NAME	    = ofcd
VERSION	    = 1.2.7
FORMAT	    = tar.gz
PATCHLEVEL  = 1
DO_AUTOCONF = $(STAMP)-autoconf
DO_PREPARE  = $(STAMP)-prepare
DO_POSTINST = $(STAMP)-postinst
STRIPPIT    = yes
PREFIX      = /usr
SERVICE     = /etc/minit/services/ofcd
ARGS        = --disable-warnings --localstatedir=/var LDFLAGS='-L$(TARGETLIBDIR) -static'

FILES 	    = /

include $(TOPDIR)/rules.mk

$(STAMP)-postinst:
	install -d $(TMPDIR)$(SERVICE)
	(cd $(TMPDIR)$(SERVICE); \
		ln -sf $(PREFIX)/sbin/ofcd run; \
		touch respawn \
	)
	touch $(STAMP)-postinst
