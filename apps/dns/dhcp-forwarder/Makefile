# $Id: Makefile 198 2004-05-03 18:44:33Z gernot $

include $(TOPDIR)/.config

NAME	    = dhcp-forwarder
VERSION	    = 0.8
FORMAT	    = tar.bz2
PATCHES	    = dhcp-forwarder-0.7-malloc.patch
PREFIX	    = /usr
DO_PREPARE  = $(STAMP)-prepare
STRIPPIT    = yes
ARGS	    = --enable-release --disable-logging --enable-dietlibc
CC	    = i386-dietlibc-linux-gcc 

FILES	= ./usr/sbin/dhcp-fwd ./usr/share/man/man1/dhcp-fwd.1*

include $(TOPDIR)/rules.mk
