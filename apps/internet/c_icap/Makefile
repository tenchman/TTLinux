# $Id: Makefile 603 2006-04-04 12:51:49Z gernot $
include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

NAME	    = c_icap
VERSION	    = 180407
FORMAT	    = tar.gz
STRIPPIT    = yes
PATCHLEVEL  = 1
DO_PREPARE  = $(STAMP)-autoconf $(STAMP)-prepare
PATCHES    += patches/c_icap-gt.patch
PATCHES    += patches/c_icap-cached_file_flush.patch
PATCHES    += patches/c_icap-install.patch
PATCHES    += patches/c_icap-mime.patch
PATCHES    += patches/c_icap-msg.patch
ARGS        = --bindir=/usr/bin --without-clamav --localstatedir=/var $(HOSTARGS)
ARGS       += --enable-large-files
FILES       = /usr/bin/* /etc/* /opt/diet/lib-$(ARCH)/*.*
FILES      += /opt/diet/include/c_icap/*.h /opt/diet/lib-$(ARCH)/c_icap/*.so

CC         += -O2 -g -ldl

include $(TOPDIR)/rules.mk
