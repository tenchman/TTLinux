# $Id: Makefile 1793 2009-11-23 09:03:46Z gernot $

include $(TOPDIR)/.config

NAME	    = zinq-djbdns
VERSION	    = 0.07
PATCHLEVEL  = 0
FORMAT	    = tar.gz
DO_PREPARE  = $(STAMP)-prepare
DO_AUTOCONF = $(STAMP)-autoconf
ARGS        = --bindir=/bin
STRIPPIT    = yes

PATCHES	    = zinq-djbdns-multiple_ip.patch
PATCHES	   += zinq-djbdns-dumpcache_v4.patch
PATCHES    += zinq-djbdns-cname_handling.patch
PATCHES    += zinq-djbdns-quietlog.patch

PROGS  = axfr-get axfrdns axfrdns-conf
PROGS += dnscache dnscache-conf dnsfilter dnsip dnsipq dnsmx
PROGS += dnsname dnsq dnsqr dnstrace dnstracesort dnstxt
PROGS += pickdns pickdns-conf pickdns-data random-ip
PROGS += rbldns rbldns-conf rbldns-data
PROGS += tinydns tinydns-conf tinydns-data tinydns-edit tinydns-get
PROGS += walldns walldns-conf
CFLAGS  += -I. -Os -DDUMPCACHE
LDFLAGS  = -static
FILES  = /bin/* /etc/*

include $(TOPDIR)/rules.mk
