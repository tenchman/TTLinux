# $Id: Makefile 1302 2008-03-13 23:50:46Z gernot $

# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
# Be aware! Squid does'nt like gnumalloc it seems.
# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

include $(TOPDIR)/.config

NAME	     = squid
VERSION	     = 2.6.STABLE4
FORMAT	     = tar.bz2
PREFIX	     = /usr
PATCHES	     = patches/squid-2.6.STABLE2-make.patch
PATCHES     += patches/squid-2.6.STABLE2-config.patch
PATCHES     += patches/squid-perlpath.patch
PATCHES	    += patches/squid-location.patch
PATCHES     += patches/squid-diet.patch

DO_PREPARE   = $(STAMP)-prepare
STRIPPIT     = yes
CFLAGS	    += -D_BSD_SOURCE -I$(KERNELINC) -DSTDC_HEADERS
LDFLAGS      = -lcompat

ARGS	     = --sysconfdir=/etc/squid --libexecdir=$(PREFIX)/lib/squid --bindir=$(PREFIX)/sbin
ARGS	    += --datadir=$(PREFIX)/share/squid
ARGS	    += --enable-poll --enable-epoll --disable-snmp --enable-removal-policies="lru"
ARGS	    += --enable-storeio="null,ufs,diskd" --disable-carp --enable-async-io
ARGS	    += --enable-delay-pools --disable-ident-lookups --enable-unlinkd
ARGS	    += --disable-linux-netfilter --with-pthreads --disable-wccp --disable-wccpv2
ARGS	    += --disable-forw-via-db --disable-referer-log
ARGS	    += --disable-useragent-log --disable-arp-acl --disable-cache-digests
ARGS        += --enable-underscores --localstatedir="/var"
ARGS        += --enable-auth="basic,digest,ntlm,negotiate"
ARGS        += --enable-basic-auth-helpers="NCSA"
ifneq ($(CONFIG_SQUID_SSL),y)
ARGS        += --disable-ssl --without-openssl
else
ARGS        += --enable-ssl
endif

# http://sites.inka.de/bigred/devel/squid-filter.html
# - added searchengines and urlfilter plugins
# - handle broken scripts i.e. http://www.profiseller.de/banner/banner.php3
ifeq ($(CONFIG_SQUID_FILTERS),y)
PATCHES     += patches/squid-2.6.STABLE4-filter.patch
ARGS        += --enable-filters
DO_AUTOCONF  = .autoconf
endif
# http://devel.squid-cache.org/cgi-bin/diff2/icap-2_6
ifeq ($(CONFIG_SQUID_ICAP),y)
PATCHES     += patches/squid-2.6-latest-icap.patch
ARGS        += --enable-icap-support
DO_AUTOCONF  = .autoconf
CFLAGS      += -DHS_FEAT_ICAP
endif

TMPDIR	     = $(TOPDIR)/tmp/$(NAME)-$(VERSION)

FILES	     = /usr/sbin/squid*
FILES	    += /usr/share/squid/*
FILES	    += /etc/squid/*.default /etc/squid/mime.conf
ifeq ($(CONFIG_SQUID_FILTERS),y)
FILES       += /etc/squid/*.sample
endif
FILES       += /usr/lib/squid/*

include $(TOPDIR)/rules.mk
