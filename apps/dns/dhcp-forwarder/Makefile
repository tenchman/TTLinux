# $Id: Makefile 198 2004-05-03 18:44:33Z gernot $

include $(TOPDIR)/.config

NAME	    = dhcp-forwarder
VERSION	    = 0.9
FORMAT	    = tar.bz2
PREFIX	    = /usr
DO_PREPARE  = $(STAMP)-prepare
STRIPPIT    = yes
ARGS	    = --enable-release --enable-logging --enable-dietlibc
MAKEARGS   += LDADD=-static
CC	    = i386-dietlibc-linux-gcc 

FILES	= ./usr/sbin/dhcp-fwd ./usr/share/man/man1/dhcp-fwd.1*

include $(TOPDIR)/rules.mk
