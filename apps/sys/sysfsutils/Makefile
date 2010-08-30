# $Id: Makefile 1379 2008-04-30 12:53:19Z gernot $

include $(TOPDIR)/.config

NAME	    = sysfsutils
VERSION	    = 2.1.0
FORMAT	    = tar.gz
ifneq ($(ARCH),i386)
DO_PREPARE  = $(STAMP)-autoconf
endif
DO_PREPARE += $(STAMP)-prepare

FILES  += /

include $(TOPDIR)/rules.mk
