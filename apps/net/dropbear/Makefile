# $Id: Makefile 1589 2009-04-01 18:52:27Z gernot $

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

NAME	    = dropbear
FORMAT	    = tar.bz2
VERSION	    = 0.52
PATCHLEVEL  = 1
PATCHES	    = patches/dropbear-options.patch
PATCHES	   += patches/dropbear-make.patch
PATCHES	   += patches/dropbear-0.43-pty.patch
PATCHES	   += patches/dropbear-scp.patch
LDFLAGS	    = -Wl,--gc-sections -lcompat

ifeq ($(CONFIG_DROPBEAR_BLACKLIST),y)
PATCHES    += patches/dropbear-0.47-blacklist.patch
endif

ifeq ($(CONFIG_DROPBEAR_ONETIME),y)
PATCHES    += patches/dropbear-onetime.patch
endif

ifeq ($(CONFIG_DROPBEAR_STATIC),y)
LDFLAGS    += -static
CC          = $(COMPILER)
endif

CC	   += -D_BSD_SOURCE -DUSE_DEV_PTMX $(CFLAGS_S) -ffunction-sections -fdata-sections
MAKEARGS    = all scp SCPPROGRESS=1
ARGS	    = --disable-zlib --disable-lastlog --disable-shadow $(HOSTARGS)
ARGS	   += --disable-utmp --disable-utmpx --disable-wtmp --disable-wtmpx
ARGS	   += --disable-libutil --disable-pututline --disable-pututxline
ifneq ($(CONFIG_DROPBEAR_SYSLOG),y)
ARGS       += --disable-syslog
PATCHES    += patches/dropbear-logging.patch
endif
STRIPPIT    = yes
DO_PREPARE  = $(STAMP)-prepare
DO_INSTALL  = $(STAMP)-myinstall
PREFIX	    = /usr
FILES	    = ./usr/sbin/* ./etc/* ./usr/bin/*

include $(TOPDIR)/rules.mk
unexport LD

$(STAMP)-myinstall: $(DO_BUILD) $(DO_PREPARE)
	install -d $(TMPDIR)/usr/sbin
	install -d $(TMPDIR)/usr/bin
	install -d $(TMPDIR)/etc/dropbear
	install -m 755 $(PACKAGE)/dropbear	$(TMPDIR)/usr/sbin/sshd
	install -m 755 $(PACKAGE)/dropbearkey	$(TMPDIR)/usr/bin/ssh-keygen
	install -m 755 $(PACKAGE)/dbclient	$(TMPDIR)/usr/bin/
	install -m 755 $(PACKAGE)/scp		$(TMPDIR)/usr/bin/
ifeq ($(ARCH),i386)
	$(PACKAGE)/dropbearkey -t dss -f $(TMPDIR)/etc/dropbear/dropbear_dss_host_key
endif
	touch $(STAMP)-myinstall

