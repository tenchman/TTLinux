# $Id: Makefile 1302 2008-03-13 23:50:46Z gernot $

include $(TOPDIR)/.config

NAME	     = curl
VERSION	     = 7.21.1
FORMAT	     = tar.bz2
DO_PREPARE   = $(STAMP)-prepare $(STAMP)-postprepare
STRIPPIT     = yes
ARGS	     = --disable-gopher --disable-shared
ARGS	    += --disable-dict --disable-telnet --disable-debug
ARGS	    += --disable-file --without-zlib --bindir=/usr/bin --sbindir=/usr/sbin
ARGS        += --without-libssh2 --without-librtmp --without-libidn --without-krb4

ifneq ($(CONFIG_FEATURE_IPV6),y)
ARGS        += --disable-ipv6
else
ARGS        += --enable-ipv6
endif

ifneq ($(CONFIG_CURL_FTP),y)
ARGS        += --disable-ftp
else
ARGS        += --enable-ftp
endif

ifneq ($(CONFIG_CURL_LDAP),y)
ARGS        += --disable-ldap
else
ARGS        += --enable-ldap
endif

ifneq ($(CONFIG_CURL_SSL),y)
 ARGS        += --without-ssl
else
 ARGS        += --with-polarssl
endif

ifneq ($(CONFIG_CURL_KERBEROS),y)
ARGS	    += --without-krb4 --without-krb4-libs --without-krb4-includes
endif

INSTALLARGS  = install-strip

FILES	     = /usr/bin/curl /opt/diet/include /opt/diet/lib-$(ARCH)

include $(TOPDIR)/rules.mk

$(STAMP)-postprepare:
	# HACK alert!
	find $(PKGBUILDDIR) -name Makefile|xargs sed -i -e "s:-Lno::"
	touch $@
