# $Id: Makefile 1302 2008-03-13 23:50:46Z gernot $

include $(TOPDIR)/.config

VERSION	    = 1.2.44
NAME	    = libpng
FORMAT	    = tar.bz2
ifeq ($(CONFIG_PNG_SMALL),y)
CFLAGS	    += -DPNG_NO_READ_SUPPORTED
CFLAGS	    += -DPNG_NO_READ_ANCILLARY_CHUNKS -DPNG_NO_READ_TRANSFORMS
CFLAGS	    += -DPNG_NO_WRITE_ANCILLARY_CHUNKS -DPNG_NO_WRITE_TRANSFORMS
CFLAGS	    += -DPNG_LEGACY_SUPPORTED -DPNG_NO_STDIO
endif
DO_PREPARE  = $(STAMP)-prepare
PREFIX	    = /opt/diet

FILES	    = ./opt/diet/lib-$(ARCH)
FILES	    += ./opt/diet/include

include $(TOPDIR)/rules.mk
