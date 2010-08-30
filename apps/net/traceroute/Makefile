# $Id: Makefile 1056 2007-05-14 17:42:45Z gernot $

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

NAME	      = traceroute
VERSION	      = 2.0.3
PATCHES      += traceroute-2.0.3-diet.patch
FORMAT	      = tar.gz
MAKEARGS      = CROSS=$(TARGETALIAS)- LDFLAGS='-static'
INSTALLARGS   = ROOT=$(TMPDIR) prefix=/ install
STRIPPIT      = yes

DO_PREPARE    =

FILES = /bin/traceroute

include $(TOPDIR)/rules.mk
