# $Id: Makefile 794 2006-10-12 16:11:38Z gernot $

# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
# Be aware! Squid does'nt like gnumalloc it seems.
# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

NAME	     = squid
VERSION	     = 3.0.STABLE15
PATCHLEVEL   = 1
FORMAT	     = tar.bz2
PREFIX	     = /usr
ifneq ($(TTL_KERNELARCH), x86)
DO_PREPARE   = $(STAMP)-fixlibtool
endif
DO_PREPARE  += $(STAMP)-myprepare
CFLAGS	    += -O2 -D_BSD_SOURCE -D_GNU_SOURCE
LDFLAGS      = -static -lcompat -L/opt/diet/lib-$(ARCH)/openldap
PATCHES      = squid3-tproxy.patch
PATCHES     += squid3-useragent.patch
PATCHES     += squid3-icap.patch
#PATCHES     += squid3-memset.patch

ARGS	     = --sysconfdir=/etc/squid $(HOSTARGS)
ARGS        += --libexecdir=$(PREFIX)/lib/squid --bindir=$(PREFIX)/sbin
ARGS	    += --datadir=$(PREFIX)/share/squid --localstatedir="/var"
ARGS        += --with-large-files

# enable section
ARGS	    += --enable-epoll --enable-snmp --enable-removal-policies="lru"
ARGS	    += --enable-storeio="null,ufs" --enable-unlinkd
ARGS        += --enable-underscores --enable-auth="basic,digest,ntlm,negotiate"
ARGS        += --enable-digest-auth-helpers="" --enable-negotiate-auth-helpers=""
ARGS        += --enable-ntlm-auth-helpers="" --enable-basic-auth-helpers=""
ARGS        += --enable-basic-auth-helpers="NCSA" --enable-icap-client --enable-gnuregex
# disable section
ARGS	    += --disable-delay-pools --disable-ident-lookups --disable-carp
ARGS	    += --disable-wccp --disable-wccpv2 --without-pthreads
ARGS	    += --disable-forw-via-db --disable-referer-log --disable-esi
ARGS	    += --disable-useragent-log --disable-arp-acl --disable-cache-digests
ARGS        += --disable-linux-netfilter

ifeq ($(CONFIG_SQUID_DEBUG),y)
ARGS        += --enable-debug-cbdata --disable-inline
CFLAGS      += -g
else
STRIPPIT     = yes
CFLAGS      += -fomit-frame-pointer -pipe
endif

ARGS        += CXXFLAGS='$(CFLAGS)' CFLAGS='$(CFLAGS)'

ifneq ($(TTL_KERNELARCH), x86)
  ARGS += ac_cv_epoll_works=yes
  ARGS += ac_cv_func_setresuid=yes
  ARGS += ac_cv_func_va_copy=yes
  ARGS += ac_cv_func___va_copy=yes
  ARGS += ac_cv_func_strnstr=no
  ARGS += ac_cv_func_inet_ntoa=yes
  ARGS += squid_filedescriptors_num=1024
endif
# -fhuge-objects is deprecated
ARGS += ac_cv_test_checkforhugeobjects=no

FILES	     = /usr/sbin/squid*
FILES	    += /usr/share/squid/*
FILES	    += /etc/squid/*.default /etc/squid/cachemgr.conf
FILES       += /usr/lib/squid

include $(TOPDIR)/rules.mk

$(STAMP)-bootstrap:
	cd $(PACKAGE) && sh bootstrap.sh
	touch $(STAMP)-bootstrap

$(STAMP)-myprepare: $(STAMP)-prepare
	sed -i -e "s,#define HAVE_RANDOM 1,/* #define HAVE_RANDOM 1 */," $(PACKAGE)/autoconf/include
	sed -i -e "s,-Werror,," $(PACKAGE)/configure*
	sed -i -e "s,^CXXLD.*,CXXLD=\$(CXX) -all-static," $(PACKAGE)/src/Makefile*
	sed -i -e "s,^CCLD.*,CCLD=\$(COMPILER) -all-static," $(PACKAGE)/src/Makefile*
ifneq ($(TTL_KERNELARCH), x86)
	sed -i -e "s,\./cf_gen.*,true," $(PACKAGE)/src/Makefile*
	# use pre-generated header because ./cf_gen will not work with
	# cross compiling
	cp cf_parser.h $(PACKAGE)/src
	cp squid.conf.default $(PACKAGE)/src
endif
	touch $(STAMP)-myprepare
