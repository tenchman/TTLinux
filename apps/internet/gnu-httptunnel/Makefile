# $Id: Makefile 911 2007-02-15 22:34:15Z gernot $

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

NAME	    = gnu-httptunnel
VERSION	    = 3.0.5
FORMAT	    = tar.gz
REALNAME    = httptunnel-3.0.5
PKGSRC      = httptunnel-3.0.5.tar.gz
DO_PREPARE  = $(STAMP)-prepare
STRIPPIT    = yes
PREFIX	    = /usr
LDFLAGS	   += -Wl,--gc-sections
CFLAGS	    = $(CFLAGS_S)

FILES	    = /

include $(TOPDIR)/rules.mk
