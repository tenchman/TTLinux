# $Id: Makefile 1302 2008-03-13 23:50:46Z gernot $

include $(TOPDIR)/.config

NAME	    = nsm
VERSION	    = 1.0.9
FORMAT	    = tar.gz
DO_AUTOCONF = .autoconf213
DO_PREPARE  = $(STAMP)-prepare
ARGS	    = --sysconfdir=/etc --enable-conf=/etc/nsm/nsm.conf --bindir=/bin
ARGS	   += --without-x --disable-nls i586-redhat-linux
ARGS	   += --localstatedir=/var/lib --enable-alternative-cc=$(COMPILER)
PREFIX	    = /usr
ifeq ($(CONFIG_NSM_OFCD),y)
ARGS	   += --enable-ofcd
endif
ifeq ($(CONFIG_NSM_VIRUSSCAN),y)
ARGS	   += --enable-virusscan
endif
CFLAGS	    = -g -D_BSD_SOURCE -DDISABLE_CVSID -DFINAL -DMICROLISS -DWITH_TINYAD

FILES	    = ./etc/nsm/* ./usr/sbin/nsm-httpd ./usr/sbin/httpd
FILES	   += ./var/lib/nsm

include $(TOPDIR)/rules.mk
