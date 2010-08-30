# $Id: Makefile 386 2005-01-14 18:17:38Z gernot $

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

NAME	    = mini_httpd
VERSION	    = 1.20
PATCHLEVEL  = 1
FORMAT	    = tar.gz
DO_POSTINST = $(STAMP)-postinst
STRIPPIT    = yes
PREFIX      = /usr
SERVICE     = /etc/minit/services/httpd
INSTALLARGS = BINDIR=/usr/sbin MANDIR=/usr/share/man install

ifeq ($(CONFIG_MINI_HTTPD_STATIC),y)
CC          = $(COMPILER) -isystem $(TARGETINCDIR)
MAKEARGS   += LDFLAGS='-static -Wl,--gc-sections'
else
MAKEARGS   += LDFLAGS=''
endif
MAKEARGS   += BASELIBDIR=/opt/diet/lib-$(ARCH)

FILES	= /usr/sbin /usr/share /etc /webroot

include $(TOPDIR)/rules.mk

$(STAMP)-postinst:
	install -d $(TMPDIR)$(SERVICE) $(TMPDIR)$(SERVICE)/log
	install -d -m 0755 $(TMPDIR)/webroot
	(cd $(TMPDIR)$(SERVICE); \
		printf -- "-D\n-C\n/etc/mini-httpd.conf\n" > params; \
		ln -sf $(PREFIX)/sbin/mini_httpd run; \
		touch respawn \
	)
	(cd $(TMPDIR)$(SERVICE)/log; \
		printf -- "-t\nwebui\n-p\nlocal0.notice\n" > params; \
		ln -sf /usr/bin/logger run; \
		touch respawn \
	)
	#openssl req -batch -new -x509 -days 1460 -nodes -config tt.cnf -out httpd.pem -keyout httpd.pem
	#openssl x509 -subject -dates -fingerprint -noout -in httpd.pem
	#install -d $(TMPDIR)/etc/certs
	#install -m 644 httpd.pem $(TMPDIR)/etc/certs
	install -m 644 mini-httpd.conf $(TMPDIR)/etc/mini-httpd.conf
	touch $@
