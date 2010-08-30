# $Id: Makefile 1056 2007-05-14 17:42:45Z gernot $

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

NAME	      = portsentry
VERSION	      = 1.2
REALNAME      = portsentry_beta
PATCHES       = portsentry-types.patch
PATCHES      += portsentry-config.patch
PATCHES      += portsentry-install.patch
FORMAT	      = tar.gz
MAKEARGS     += linux CFLAGS="-Os -s -DNODAEMON"
STRIPPIT      = yes

DO_PREPARE    =

FILES = /usr/sbin/portsentry /etc/portsentry

include $(TOPDIR)/rules.mk
