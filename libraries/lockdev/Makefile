# $Id: Makefile 1617 2009-05-05 10:01:59Z gernot $

include $(TOPDIR)/.config

NAME	      = lockdev
VERSION	      = 1.0.0
FORMAT	      = tar.gz
PATCHES	      = lockdev-1.0.0-rh.patch lockdev-1.0.0-shared.patch
PATCHES	     += lockdev-1.0.0-signal.patch lockdev-1.0.0-cli.patch
CPPFLAGS      = $(KERNELFLAGS) $(TTL_KERNELINC)
DO_PREPARE    = 
PREFIX	      = /usr
STRIPPIT      = yes
MAKEARGS      = static lockdev
INSTALLARGS   = sbindir=$(TMPDIR)/usr/sbin libdir=$(TMPDIR)/opt/diet/lib-$(ARCH)
INSTALLARGS  += incdir=$(TMPDIR)/opt/diet/include mandir=$(TMPDIR)/usr/share/man
INSTALLARGS  += install_dev install_run

FILES	= ./usr/sbin/lockdev
FILES  += ./opt/diet/include
FILES  += ./opt/diet/lib-$(ARCH)

include $(TOPDIR)/rules.mk
