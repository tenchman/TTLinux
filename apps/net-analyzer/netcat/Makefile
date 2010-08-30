# $Id: Makefile 1379 2008-04-30 12:53:19Z gernot $
include $(TOPDIR)/.config

NAME	    = netcat
VERSION	    = 0.7.1
FORMAT	    = tar.bz2
STRIPPIT    = yes
ifneq ($(ARCH),i386)
DO_PREPARE  = $(STAMP)-autoconf
endif
DO_PREPARE += $(STAMP)-prepare
PREFIX	    = /usr
CC	   += $(CFLAGS_S) -ffunction-sections -fdata-sections
LDFLAGS	   += -static -Wl,--gc-sections
FILES       = /usr/bin

include $(TOPDIR)/rules.mk
