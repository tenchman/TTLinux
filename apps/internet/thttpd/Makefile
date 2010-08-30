# $Id: Makefile 1302 2008-03-13 23:50:46Z gernot $

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

NAME	    = thttpd
VERSION	    = 2.25b
FORMAT	    = tar.gz
PATCHES	    = thttpd-2.25b-make.patch
# http://rekl.yi.org/thttpd/pub/patch-thttpd-2.25b-re1
PATCHES    += thttpd-2.25b-re1-gzip.patch
DO_PREPARE  = $(STAMP)-prepare
DO_POSTINST = .postinst
STRIPPIT    = yes
PREFIX      = /usr
MAKEARGS    = CCOPT='$(CFLAGS_S)'
SERVICE     = /etc/minit/services/thttpd

FILES	= /etc $(PREFIX)/www/cgi-bin/ $(PREFIX)/sbin/

include $(TOPDIR)/rules.mk

.postinst:
	install -d $(TMPDIR)$(SERVICE)
	printf "dir=/webroot/webui\nnovhost\nuser=nobody\nlogfile=/var/log/thttpd.log\npidfile=/var/run/thttpd.pid\ncgipat=**.cgi\n" \
		> $(TMPDIR)/etc/thttpd.conf
	(cd $(TMPDIR)$(SERVICE); \
		printf -- "-D\n-C\n/etc/thttpd.conf\n" > params; \
		ln -sf $(PREFIX)/sbin/thttpd run; \
		touch respawn \
	)
	touch .postinst
