# $Id: Makefile 1542 2009-01-06 09:11:34Z gernot $

include $(TOPDIR)/.config

NAME	    = djbdns
VERSION	    = 1.05
PATCHLEVEL  = 1
FORMAT	    = tar.gz
# http://homepages.tesco.net/J.deBoynePollard/Softwares/djbdns/dnscache-cname-handling.patch
PATCHES     = dnscache-cname_handling.patch
# http://js.hu./package/djbdns-conf/djbdns-patches.html
PATCHES	    = dnscache-1.05-multiple-ip.patch
PATCHES    += djbdns-1.05-ignoreip2mod.patch
PATCHES	   += djbdns-1.05-dumpcache_v4.patch
PATCHES    += djbdns-1.05-errno.patch
PATCHES    += djbdns-1.05-install.patch
PATCHES    += dnscache-quietlog.patch
PATCHES    += dnscache-dnsroots.patch
PATCHES    += dnscache-strict-forwardonly.patch
DO_PREPARE  = $(STAMP)-myprepare
DO_INSTALL  = $(STAMP)-myinstall
STRIPPIT    = yes
MAKEARGS    = prog

PROGS  = axfr-get axfrdns axfrdns-conf
PROGS += dnscache dnscache-conf dnsfilter dnsip dnsipq dnsmx
PROGS += dnsname dnsq dnsqr dnstrace dnstracesort dnstxt
PROGS += pickdns pickdns-conf pickdns-data random-ip
PROGS += rbldns rbldns-conf rbldns-data
PROGS += tinydns tinydns-conf tinydns-data tinydns-edit tinydns-get
PROGS += walldns walldns-conf

FILES  = /bin/*
FILES += /etc/dnsroots.global

include $(TOPDIR)/rules.mk

$(STAMP)-myprepare: $(DO_PATCH)
	(cd $(PACKAGE); \
		echo "$(COMPILER) -Os -DDUMPCACHE" > conf-cc; \
		echo "$(COMPILER) -static" > conf-ld; \
		make auto-str chkshsgr; \
		touch conf-home; \
		echo "const char auto_home[] = \"\\057\";" > auto_home.c; \
		cp hasshsgr.h2 hasshsgr.h; \
	);
	touch $@

$(STAMP)-myinstall:
	install -d $(TMPDIR)/{bin,etc}
	( cd $(PACKAGE); \
		install -m 755 $(PROGS) $(TMPDIR)/bin; \
		install -m 640 dnsroots.global $(TMPDIR)/etc; \
	)
	touch $@

