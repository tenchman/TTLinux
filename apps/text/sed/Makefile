# $Id: Makefile 1302 2008-03-13 23:50:46Z gernot $

# !!! SIZE DOES MATTER !!!
# 3.02	-rwxr-xr-x  1 root root 46852 31. Aug 19:32 /bin/sed (shared)
# 4.1.2 -rwxr-xr-x  1 root root 70512 31. Aug 19:29 /bin/sed (shared)

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

ifeq ($(CONFIG_SED_4),y)
DO_PREPARE    = $(STAMP)-myprepare
VERSION	      = 4.1.5
else
DO_PREPARE    = $(STAMP)-prepare
VERSION	      = 3.02
endif
NAME	      = sed
FORMAT	      = tar.gz
PREFIX	      = /opt/diet
ARGS	      = --bindir=/bin
STRIPPIT      = yes
I18N          = yes

FILES	= /

include $(TOPDIR)/rules.mk

$(STAMP)-myprepare: $(STAMP)-prepare
	sed -i -e "s,^#define HAVE_MBRTOWC 1,/* #undef HAVE_MBRTOWC */," $(PACKAGE)/config.h
	sed -i -e "s,^#define HAVE_WCRTOMB 1,/* #undef HAVE_WCRTOMB */," $(PACKAGE)/config.h
	sed -i -e "s,^#define HAVE_ICONV 1,/* #undef HAVE_ICONV */," $(PACKAGE)/config.h
	touch $(STAMP)-myprepare
