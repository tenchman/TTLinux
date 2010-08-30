# $Id: Makefile 835 2006-11-08 21:11:07Z gernot $

include $(TOPDIR)/.config

NAME	    = pth
VERSION	    = 2.0.7
FORMAT	    = tar.gz
ARGS        = --enable-syscall-hard
ifeq ($(CONFIG_PTH_PTHREADS),y)
ARGS	   += --enable-pthread
endif
DO_PREPARE  = $(STAMP)-prepare
PREFIX	    = /opt/diet

FILES	    = ./opt/diet/lib-$(ARCH)/*.*
FILES	   += ./opt/diet/include

include $(TOPDIR)/rules.mk
