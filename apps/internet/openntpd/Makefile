# $Id: Makefile 425 2005-04-27 14:10:39Z gernot $

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

NAME	    = openntpd
FORMAT	    = tar.gz
VERSION	    = 3.9p1
PATCHES	   += openntpd-diet.patch
PATCHES	   += openntpd-3.9p1-settime.patch
PATCHES    += openntpd-3.9p1-silent.patch
PATCHES    += openntpd-3.9p1-daemon.patch
PATCHLEVEL  = 4
CC	   += -D_BSD_SOURCE $(CFLAGS) -ffunction-sections -fdata-sections
LDFLAGS	    = -Wl,--gc-sections -static
ARGS	   += --with-builtin-arc4random --with-privsep-user=ntp
DO_INSTALL  = $(STAMP)-myinstall
DO_PREPARE  = $(STAMP)-myprepare
INSTALLARGS = STRIP_OPT= install
PREFIX	    = /usr
INITDIR     = $(TMPDIR)/etc/minit/services/ntpd

FILES	    = /etc/ntpd.conf /usr/share/man/man5/ntpd.conf.5*
FILES      += /usr/share/man/man8/ntpd.8* /usr/sbin/ntpd /var/empty/
FILES      += /etc/minit/services/ntpd

include $(TOPDIR)/rules.mk

$(STAMP)-myprepare: $(STAMP)-prepare $(PATCHES)
	# dietlibc's getaddrinfo seems to be broken
	sed -i -e "s,.*BROKEN_GETADDRINFO.*,#define BROKEN_GETADDRINFO 1," $(PACKAGE)/config.h
	touch $(STAMP)-myprepare

$(STAMP)-myinstall: $(STAMP)-install
	$(STRIP) -s -R .comment -R .note $(TMPDIR)/usr/sbin/ntpd
	install -d $(INITDIR)/log
	cd $(INITDIR) && ln -sf /usr/sbin/ntpd run && touch respawn
	printf -- "-D\n-s\n" > $(INITDIR)/params
	printf -- "network\n" > $(INITDIR)/depends
	cd $(INITDIR)/log && ln -sf /usr/bin/logger run && touch respawn
	printf -- "-t\nntpd\n-p\ndaemon.notice\n" > $(INITDIR)/log/params
	touch $(STAMP)-myinstall
