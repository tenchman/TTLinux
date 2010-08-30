# $Id: Makefile 165 2004-03-05 14:12:29Z gernot $

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

VERSION	    = 4.3.2
NAME	    = gmp
FORMAT	    = tar.bz2
PATCHES     = gmp-nognu.patch
DO_PREPARE  = $(STAMP)-prepare
PREFIX	    = /opt/diet

FILES	    = ./opt/diet/include
FILES	   += ./opt/diet/lib-$(ARCH)

CFLAGS     += -DNO_ASM
ARGS	   += --with-pic --enable-alloca=yes
ifeq ($(TTL_KERNELARCH), x86)
ARGS       += ABI=32
endif

include $(TOPDIR)/rules.mk
