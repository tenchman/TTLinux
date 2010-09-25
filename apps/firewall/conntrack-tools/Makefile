# $Id:$

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

NAME	    = conntrack-tools
VERSION	    = 0.9.9
FORMAT      = tar.bz2
#PATCHES     = patches/conntrackd-limits.patch
CC         += $(TTL_KERNELINC)
CC	   += -D_GNU_SOURCE -D_BSD_SOURCE -D__KERNEL_STRICT_NAMES -D__GLIBC__=2
CC	   += -D__GNU_LIBRARY__ -Wno-deprecated-declarations
DO_PREPARE  = $(STAMP)-myprepare
STRIPPIT    = yes
PREFIX      = /usr
ARGS        = --sbindir=/sbin
FILES       = /sbin/* $(PREFIX)/share/man/man8/conntrack.8.*
# $(PREFIX)/lib-$(ARCH)/conntrack-tools/*.so 

include $(TOPDIR)/rules.mk

$(STAMP)-myprepare: $(STAMP)-prepare
	sed -i -e "s:sys/fcntl.h:fcntl.h:" $(PACKAGE)/src/netlink.c
	sed -i -e "s:#include \"fds.h\":#include <sys/select.h>\n#include \"fds.h\":" $(PACKAGE)/src/fds.c
	touch $(STAMP)-myprepare
