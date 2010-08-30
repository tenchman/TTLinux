# $Id: Makefile 1316 2008-03-20 22:05:36Z gernot $

include $(TOPDIR)/.config

VERSION	      = 1.1.30
NAME	      = mgetty
FORMAT	      = tar.gz
PATCHES	      = mgetty-1.1.26-policy.patch
PATCHES      += mgetty-1.1.25-faxprint.patch mgetty-1.1.21-giftopnm.patch
PATCHES      += mgetty-1.1.25-voiceconfig.patch mgetty-1.1.26-issue.patch
PATCHES      += mgetty-1.1.26-issue-doc.patch mgetty-1.1.29-helper.patch
PATCHES	     += mgetty-1.1.30-mktemp.patch mgetty-1.1.30-diet.patch
PATCHES	     += mgetty-1.1.30-cross.patch
CFLAGS	     += -nostdinc -I$(DISTDIR)/opt/diet/include -I$(KERNELINC)
PREFIX	      = /usr
MAKEARGS      = CFLAGS='$(CFLAGS)' LDFLAGS='$(LDFLAGS)' prefix=$(PREFIX)
MAKEARGS     += spool=/var/lib/spool sysconfdir=/etc
MAKEARGS     += mandir=/usr/share/man infodir=/usr/share/info
INSTALLARGS   = prefix=$(PREFIX)
INSTALLARGS  += spool=/var/lib/spool sysconfdir=/etc
INSTALLARGS  += mandir=/usr/share/man infodir=/usr/share/info install
STRIPPIT      = yes
DO_PREPARE    = $(STAMP)-myprepare

FILES	      = ./sbin/mgetty

include $(TOPDIR)/rules.mk

$(STAMP)-myprepare:
	cp $(PACKAGE)/policy.h-dist $(PACKAGE)/policy.h
	touch $(STAMP)-myprepare
