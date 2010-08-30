# $Id: Makefile 190 2004-04-27 20:16:35Z gernot $

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

NAME	    = sysvinit
VERSION	    = 2.85
PATCHES	    = sysvinit-2.78-man.patch sysvinit-2.77-md5-be.patch
PATCHES	   += sysvinit-2.78-halt.patch sysvinit-2.78-autofsck.patch
PATCHES    += sysvinit-2.84-shutdownlog.patch sysvinit-2.84-diet.patch
PATCHES    += sysvinit-2.85-proclen-1.patch
PATCHES    += sysvinit-2.85-perms.patch
FORMAT	    = tar.gz
DO_PREPARE  =
DO_BUILD    = $(STAMP)-mybuild
DO_INSTALL  = $(STAMP)-myinstall

FILES	= ./usr/bin/*
FILES  += ./sbin/*
FILES  += ./bin/*

include $(TOPDIR)/rules.mk

$(STAMP)-mybuild: $(DO_PREPARE)
	(cd $(PACKAGE); \
	    make -C src LDFLAGS=-static; \
	    $(CC) $(CFLAGS) -o start-stop-daemon contrib/start-stop-daemon.c \
	);
	touch $(STAMP)-mybuild

$(STAMP)-myinstall: $(DO_BUILD)
	(cd $(PACKAGE); \
	    install -d $(TMPDIR)/{sbin,bin,usr/bin,usr/share/man/{man1,man5,man8}}; \
	    make -C src  ROOT=$(TMPDIR) install; \
	    install start-stop-daemon $(TMPDIR)/sbin; \
	);
	touch $(STAMP)-myinstall
