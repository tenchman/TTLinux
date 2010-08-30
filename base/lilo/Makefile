# $Id: Makefile 1693 2009-07-01 14:28:13Z gernot $

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

VERSION	      = 22.7.2
NAME	      = lilo
FORMAT	      = tar.gz
PKGSRC        = lilo-22.7.2.src.tar.gz
PATCHES       = lilo-22.7.2.1.patch
PATCHES	     += lilo-22.7.2-diet.patch
PATCHES      += lilo-22.7.2-usage.patch
OPT	      = -Os $(TTL_KERNELINC) -D_BSD_SOURCE -D__KERNEL_STRICT_NAMES -D_SYS_STATFS_H
ifeq ($(CONFIG_LILO_STATIC),y)
CC            = $(COMPILER) -static $(CPPFLAGS)
endif
CONFIG        = -DBDATA -DDSECS=3 -DIGNORECASE -DONE_SHOT -DSOLO_CHAIN -DNOSERIAL -DNORAID
MAKEARGS      = OPT='$(OPT)' LDFLAGS='$(LDFLAGS)' CONFIG='$(CONFIG)' LIBS=-lcompat
MAKEARGS     += ROOT='$(PACKAGE)' all
INSTALLARGS   = ROOT=$(TMPDIR) MAN_DIR=/usr/share/man install
STRIPPIT      = yes
DO_PREPARE    = $(STAMP)-myprepare

FILES	      = /sbin/lilo

include $(TOPDIR)/rules.mk

$(STAMP)-myprepare:
	echo "Tested" >$(PACKAGE)/test.img
	touch $(STAMP)-myprepare
