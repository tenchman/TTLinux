# $Id: Makefile 1309 2008-03-17 23:59:09Z gernot $

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

NAME	    = ca-certificates
VERSION	    = 20090814
FORMAT	    = deb
PKGSRC      = ca-certificates_$(VERSION)_all.deb
DO_PREPARE  = $(STAMP)-myprepare
DO_INSTALL  = $(STAMP)-myinstall
DO_CLEANUP  = $(STAMP)-mycleanup
DO_BUILD    = 
STRIPPIT    = yes

CERTSCONF	= /etc/ca-certificates.conf
LOCALCERTSDIR	= /var/lib/cacerts/local
CERTBUNDLE	= ca-certificates.crt
ETCCERTSDIR	= /var/lib/cacerts

CERTSDIR	= /usr/share/ca-certificates
BUNDLES		= mozilla
CERTBUNDLES	= for BUNDLE in $(BUNDLES); do echo "$(CERTSDIR)/$$BUNDLE"; done

DO_C_REHASH     = no

FILES       = /usr/sbin/
FILES	   += $(CERTSCONF)
FILES	   += $(ETCCERTSDIR)
FILES      += $(LOCALCERTSDIR)
# install these bundles:
FILES	   += $(shell $(CERTBUNDLES))

include $(TOPDIR)/rules.mk


$(STAMP)-myprepare:
	@tar xzf data.tar.gz $(TARTARGET)
	@mkdir -p .$(ETCCERTSDIR)
	@mkdir -p .$(LOCALCERTSDIR)
	# currently no symlinks in ETCCERTSDIR
	@( \
		if [ "$(DO_C_REHASH)" == "no" ]; then \
			cp usr/sbin/update-ca-certificates usr/sbin/update-ca-certificates.bak; \
			sed -e 's#c_rehash .#echo "c_rehash is disabled"#' \
			    -e 's/ln/#ln/' \
				 <usr/sbin/update-ca-certificates.bak >usr/sbin/update-ca-certificates; \
			rm usr/sbin/update-ca-certificates.bak; \
		else \
			@sed -e 's#DIR=.*#DIR=$(ETCCERTSDIR)#' <c_rehash >usr/sbin/c_rehash; \
		fi \
	)
	@cp usr/sbin/update-ca-certificates usr/sbin/update-ca-certificates.bak
	@sed -e 's/ --test//' \
	     -e 's#(readlink \(.*\))#(ls -l \1 | sed '\''s/.*-> //'\'')#' \
	     -e 's#^CERTSCONF.*#CERTSCONF=$(CERTSCONF)#' \
	     -e 's#^LOCALCERTSDIR.*#LOCALCERTSDIR=$(LOCALCERTSDIR)#' \
	     -e 's#^CERTBUNDLE.*#CERTBUNDLE=$(CERTBUNDLE)#' \
	     -e 's#^ETCCERTSDIR.*#ETCCERTSDIR=$(ETCCERTSDIR)#' \
	     -e 's#find -L "$$LOCALCERTSDIR" -type f -name '\''\*\.crt'\'' | while read crt#find "$$LOCALCERTSDIR" -type l -name '\''*.crt'\'' | while read crt#' \
		 <usr/sbin/update-ca-certificates.bak >usr/sbin/update-ca-certificates
	@rm usr/sbin/update-ca-certificates.bak
	@touch $(STAMP)-myprepare

$(STAMP)-myinstall:
	@( \
	for BUNDLE in $(BUNDLES); do \
		find .$(CERTSDIR)/$$BUNDLE -name '*.crt' | sort | cut -b29- ; \
	done \
	) > .$(CERTSCONF)
	@touch $(STAMP)-myinstall

$(STAMP)-mycleanup:
	@rm -f control.tar.gz data.tar.gz debian-binary
	@touch $(STAMP)-mycleanup
