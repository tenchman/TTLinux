# $Id:$

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

NAME	    = tcpdump
VERSION	    = 4.0.0
FORMAT	    = tar.gz
PATCHES	    += tcpdump-3.6.1-portnumbers.patch
PATCHES	    += tcpdump-3.6.2-ip6opts.patch
PATCHES	    += tcpdump-3.8.1-sctp.patch
PATCHES	    += tcpdump-3.7.2-sctpdef.patch
PATCHES     += tcpdump-3.9.4-toascii.patch
ARGS	    = --enable-ipv6 --disable-smb --without-crypto $(HOSTARGS)
ifneq ($(ARCH),i386)
  ARGS     += ac_cv_linux_vers=2
  ARGS     += td_cv_buggygetaddrinfo=no
endif
DO_PREPARE  = $(STAMP)-prepare
STRIPPIT    = yes
CFLAGS	    += $(CPPFLAGS) -D_BSD_SOURCE $(CFLAGS_S) -Wno-deprecated-declarations
LDFLAGS	    += -static

FILES	    = .$(PREFIX)/sbin/tcpdump

include $(TOPDIR)/rules.mk
