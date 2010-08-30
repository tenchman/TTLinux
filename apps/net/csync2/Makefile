# $Id: Makefile 380 2005-01-12 11:08:30Z gernot $

include $(TOPDIR)/.config

VERSION		= 1.34
NAME		= csync2
FORMAT		= tar.gz
PATCHES		= diff-hack.patch
PATCHES        += csync2-diet.patch
PATCHES        += csync2-1.32-gnutls.patch
ARGS		= --sbindir=/usr/sbin --enable-gnutls=no DIFF_COMMAND="\"\\\"cat >%s\\\"\""
CFLAGS		= -static -Wl,-static
LDFLAGS		= -static
LIBS		= -lpthread
MAKEARGS	= 
DO_PREPARE	= $(STAMP)-autoconf $(STAMP)-prepare

STRIPPIT	= yes
FILES	        = /var/lib/csync2 /usr/sbin/csync2* /opt/diet/share/man/ /etc/csync2.cfg

include $(TOPDIR)/rules.mk
