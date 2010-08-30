# $Id$

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

NAME	    = nginx
FORMAT	    = tar.gz
VERSION	    = 0.8.49
PATCHES     = nginx-crypt_h.patch
PREFIX      = /usr
STRIPPIT    = yes
CFLAGS     += -D_GNU_SOURCE -D_BSD_SOURCE -D_XOPEN_SOURCE -Wno-deprecated-declarations
I18N        = yes

ARGS        = --without-http_rewrite_module --conf-path=/etc/nginx/nginx.conf 
ARGS       += --with-ld-opt="-lcompat" --pid-path=/var/run/nginx.pid --prefix=$(PREFIX)
ARGS       += --error-log-path=/var/log/nginx/error.log --http-log-path=/var/log/nginx/access.log

DO_PREPARE  = $(STAMP)-myprepare
FILES	    = /etc/nginx/ /usr/sbin

include $(TOPDIR)/rules.mk

$(STAMP)-myprepare:
	cd $(PKGBUILDDIR) && ./configure $(ARGS)
	touch $@
