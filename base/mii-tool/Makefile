# $Id: Makefile 223 2004-08-15 19:52:16Z gernot $

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

NAME	    = mii-tool
VERSION	    = 1.10
FORMAT	    = tar.gz
PKGSRC	    = mii-tool.tar.gz
PATCHES	    = mii-tool-ioctl.patch
PATCHES    += mii-tool-diet.patch
DO_PREPARE  =
CC+=-static

FILES	= ./sbin/mii-tool

include $(TOPDIR)/rules.mk
