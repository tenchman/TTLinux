# $Id: Makefile 1302 2008-03-13 23:50:46Z gernot $

include $(TOPDIR)/.config

NAME	    = libgt
VERSION	    = 0.0.4
FORMAT	    = tar.gz
DO_PREPARE  = $(STAMP)-prepare
PREFIX	    = /opt/diet
ARGS	    = --enable-dietlibc
INSTALLARGS = ARCH=$(ARCH) install

FILES	    = ./opt/diet/lib-$(ARCH)
FILES	   += ./opt/diet/include

include $(TOPDIR)/rules.mk

