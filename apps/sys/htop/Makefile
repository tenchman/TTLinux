# $Id: Makefile 1652 2009-06-02 20:53:50Z gernot $

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

NAME	    = htop
VERSION	    = 0.8.2
FORMAT	    = tar.gz
PATCHES     = htop-ncurses.patch
DO_PREPARE  = $(STAMP)-prepare
STRIPPIT    = yes
CFLAGS      = -Os -DDEBUG
CPPFLAGS   += -I/opt/diet/include/ncurses
ARGS       += $(HOSTARGS) --enable-unicode=no
ARGS       += ac_cv_file__proc_stat=yes
ARGS       += ac_cv_file__proc_meminfo=yes

FILES	= /

include $(TOPDIR)/rules.mk
