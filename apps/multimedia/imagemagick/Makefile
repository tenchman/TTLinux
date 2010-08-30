# $Id: Makefile 276 2004-09-19 20:28:28Z gernot $

include $(TOPDIR)/.config
include $(TOPDIR)/$(SRCH).config

NAME	    = ImageMagick
VERSION	    = 6.2.9
FORMAT	    = tar.gz
# STRIPPIT    = yes
PREFIX	    = /opt/diet
DO_PREPARE  = $(STAMP)-prepare
CFLAGS	   += -g
MAKEARGS    = CXX='i386-dietlibc-linux-g++ -fPIC -pipe' CXXFLAGS='$(CFLAGS_S)'
MAKEARGS   += LDFLAGS=-L/opt/diet/lib-i386 CPPFLAGS=-I/opt/diet/include
ARGS        = --with-x=no --without-fontconfig --without-freetype
ARGS       += --without-lcms --without-gvc --without-rsvg --without-xml
ARGS       += --without-bzlib --without-dps --disable-assert $(MAKEARGS)
ARGS       += --without-perl --without-magick-plus-plus --without-threads --with-pic
ARGS       += --with-modules=no --enable-shared=no
ifneq ($(CONFIG_LIBPNG),y)
ARGS       += --without-png
endif
FILES	    = /

include $(TOPDIR)/rules.mk
