# $Id: Makefile 1309 2008-03-17 23:59:09Z gernot $

include $(TOPDIR)/.config

NAME	    = mm
VERSION	    = 1.4.2
FORMAT	    = tar.gz
PATCHES	    = mm-1.3.0-diet.patch
ARGS	    = --disable-shared ac_cv_maxsegsize=33554432 --with-sem=IPCSEM
CFLAGS	   += -DWITHOUT_INFO -D_BSD_SOURCE
DO_PREPARE  = $(STAMP)-prepare
PREFIX	    = /opt/diet

FILES	    = ./opt/diet/lib-$(ARCH)/*.a
FILES	   += ./opt/diet/include

include $(TOPDIR)/rules.mk
