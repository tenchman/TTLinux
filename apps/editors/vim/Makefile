# $Id: Makefile 276 2004-09-19 20:28:28Z gernot $

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

VERSION	      = 7.1
NAME	      = vim
REALNAME      = vim71
FORMAT	      = tar.bz2
PATCHES       = vim-7.1-syntax.patch
DO_PREPARE    = $(STAMP)-prepare
CFLAGS	      = $(CFLAGS_S)
PREFIX	      = /usr
ARGS	      = --bindir=/bin --without-x --disable-gui --disable-nls --disable-gpm
ARGS         += --disable-acl $(HOSTARGS)
STRIPPIT      = yes

ifeq ($(CONFIG_VIM_STATIC),y)
CC	      = $(COMPILER)
LDFLAGS	      = -static -Wl,--gc-sections
endif

FILES	= ./bin/vim ./usr/share/vim

include $(TOPDIR)/rules.mk
