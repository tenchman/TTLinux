# $Id: Makefile 198 2004-05-03 18:44:33Z gernot $

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

NAME	    = coreutils
VERSION	    = 6.1
FORMAT	    = tar.bz2
PATCHES	    = coreutils-5.94-diet.patch
PATCHES    += coreutils-5.94-doc.patch
CC         += -std=gnu99
CFLAGS	   += -D_BSD_SOURCE # -I$(DIETINC) -I$(KERNELINC)
LDFLAGS     = -lcompat
PREFIX	    = /usr
DO_PREPARE  = $(STAMP)-prepare
DO_POSTINST = $(STAMP)-mypostinstall
DO_AUTOCONF = $(STAMP)-autoconf
STRIPPIT    = yes
MAKEARGS    = CC='$(CC)'

FILES	= ./bin ./usr/bin ./usr/sbin

include $(TOPDIR)/rules.mk

$(STAMP)-mypostinstall: $(STAMP)-install
	mkdir -p $(TMPDIR)/bin
	mkdir -p $(TMPDIR)/usr/sbin
	for f in basename cat chgrp chmod chown cp cut date dd df echo \
		env false link ln ls mkdir mknod mv nice pwd rm rmdir \
		sleep sort stty sync touch true uname unlink; do \
	    mv $(TMPDIR)/usr/bin/$$f $(TMPDIR)/bin; \
	done
	mv $(TMPDIR)/usr/bin/chroot $(TMPDIR)/usr/sbin
	touch $(STAMP)-mypostinstall
