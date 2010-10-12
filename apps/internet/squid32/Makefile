# $Id: Makefile 794 2006-10-12 16:11:38Z gernot $

# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
# Be aware! Squid does'nt like gnumalloc it seems.
# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

NAME	     = squid
VERSION	     = 3.1.8
PATCHLEVEL   = 1
FORMAT	     = tar.bz2
PREFIX	     = /usr
DO_PREPARE  += $(STAMP)-bootstrap
DO_PREPARE  += $(STAMP)-myprepare
CFLAGS	    += -O2 -D_BSD_SOURCE -D_GNU_SOURCE
# prevent typedef clash
CFLAGS      += -D_ASM_X86_POSIX_TYPES_32_H
LDFLAGS      = -static -lcompat -L/opt/diet/lib-$(ARCH)/openldap
PATCHES     += squid3-adaptation.patch
PATCHES     += squid3-useragent.patch
#PATCHES     += squid3-no_quote_external_acl_message.patch
PATCHES     += squid3-diet.patch
PATCHES     += squid3-bootstrap.patch
PATCHES     += squid-phase5_take24.patch

ARGS	     = --sysconfdir=/etc/squid $(HOSTARGS)
ARGS        += --libexecdir=$(PREFIX)/lib/squid --bindir=$(PREFIX)/sbin
ARGS	    += --datadir=$(PREFIX)/share/squid --localstatedir="/var"

ARGS        += --with-large-files

# enable section
ARGS	    += --enable-epoll --enable-removal-policies="lru" --disable-snmp #--enable-snmp 
ARGS	    += --enable-storeio="ufs" --enable-unlinkd
ARGS        += --enable-underscores --enable-auth="basic,digest,ntlm,negotiate"
ARGS        += --enable-digest-auth-helpers="" --enable-negotiate-auth-helpers=""
ARGS        += --enable-ntlm-auth-helpers="" --enable-basic-auth-helpers=""
ARGS        += --enable-basic-auth-helpers="NCSA" --enable-icap-client --enable-gnuregex
# disable section
ARGS	    += --disable-delay-pools --disable-ident-lookups --disable-carp
ARGS	    += --disable-wccp --disable-wccpv2 --without-pthreads
ARGS	    += --disable-forw-via-db --disable-referer-log --disable-esi
ARGS	    += --disable-useragent-log --disable-arp-acl --disable-cache-digests --enable-linux-netfilter

#ifeq ($(CONFIG_KERNEL26_TPROXY),y)
#ARGS        += --enable-linux-netfilter
#CFLAGS      += $(TTL_KERNELINC) -DSTDC_HEADERS -D__KERNEL_STRICT_NAMES
#else
#ARGS        += --disable-linux-tproxy --disable-linux-netfilter
#endif

ifeq ($(CONFIG_SQUID_DEBUG),y)
ARGS        += --enable-debug-cbdata --disable-optimizations --disable-inline
CFLAGS      += -g
else
STRIPPIT     = yes
CFLAGS      += -fomit-frame-pointer -pipe
endif

ifneq ($(CONFIG_SQUID_SSL),y)
ARGS        += --disable-ssl --without-openssl
else
ARGS        += --enable-ssl --enable-ssl-crtd
endif

ARGS        += CXXFLAGS='$(CFLAGS)' CFLAGS='$(CFLAGS)'

# getaddrinfo/getnameinfo is broken in dietlibc
# ARGS += ac_cv_func_getaddrinfo=no
# ARGS += ac_cv_func_getnameinfo=no
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

$(STAMP)-fixinc:
	sed -i -e "s,/usr/include,/opt/diet/include," $(PKGBUILDDIR)/configure
	sed -i -e "s,/usr/include,/opt/diet/include," $(PKGBUILDDIR)/lib/libTrie/configure
	touch $@

$(STAMP)-myprepare: $(STAMP)-fixinc $(STAMP)-prepare
	# sed -i -e "s,#define HAVE_RANDOM 1,/* #define HAVE_RANDOM 1 */," $(PKGBUILDDIR)/autoconf/include
	sed -i -e "s,-Werror,," $(PKGBUILDDIR)/configure*
	sed -i -e "s,^CXXLD.*,CXXLD=\$(CXX) -all-static," $(PKGBUILDDIR)/src/Makefile*
	sed -i -e "s,^CCLD.*,CCLD=\$(COMPILER) -all-static," $(PKGBUILDDIR)/src/Makefile*
ifneq ($(TTL_KERNELARCH), x86)
	sed -i -e "s,\./cf_gen.*,true," $(PKGBUILDDIR)/src/Makefile*
	# use pre-generated header because ./cf_gen will not work with
	# cross compiling
	cp cf_parser.h $(PKGBUILDDIR)/src
	cp squid.conf.default $(PKGBUILDDIR)/src
endif
	touch $(STAMP)-myprepare

$(STAMP)-bootstrap:
	( cd $(PKGBUILDDIR); \
	  CC='$(CC)' CXX='$(CXX)' ./bootstrap.sh; \
	);
	touch $@
