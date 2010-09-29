# $Id: Makefile 1310 2008-03-18 17:12:06Z gernot $

include $(TOPDIR)/.config

NAME	    = ucspi-tcp
VERSION	    = 0.88
FORMAT	    = tar.gz
PATCHES	    = ucspi-tcp-matrixssl.patch
PATCHES    += ucspi-tcp-0.88-ipv6-diff15.patch
PATCHES    += ucspi-tcp-0.88-int32.patch
PATCHES    += ucspi-tcp-cross.patch
STRIPPIT    = yes
MAKEARGS    = prog
PREFIX	    = /usr
DO_PREPARE  = $(STAMP)-myprepare
DO_INSTALL  = $(STAMP)-myinstall
DFLAGS	    = $(CFLAGS_S) $(CPPFLAGS)
PROGS       = tcpserver tcprules tcprulescheck recordio tcpclient tcpcat
PROGS      += mconnect mconnect-io addcr delcr fixcrio rblsmtpd

FILES	= $(PREFIX)/bin

include $(TOPDIR)/rules.mk

$(STAMP)-myprepare:
	echo $(PREFIX) > $(PKGBUILDDIR)/conf-home
	echo "$(COMPILER) $(DFLAGS)" > $(PKGBUILDDIR)/conf-cc
	echo $(COMPILER) -static > $(PKGBUILDDIR)/conf-ld
	touch $@

$(STAMP)-myinstall:
	echo $(TMPDIR)$(PREFIX) > $(PKGBUILDDIR)/conf-home
	install -d $(TMPDIR)$(PREFIX)/bin
	( cd $(PKGBUILDDIR); install -m 755 $(PROGS) $(TMPDIR)$(PREFIX)/bin )
	touch $@
