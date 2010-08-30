# $Id: Makefile 1418 2008-06-27 21:12:13Z gernot $

include $(TOPDIR)/.config

NAME	    = qmail
VERSION	    = 1.03
FORMAT	    = tar.gz
PREFIX	    = /usr
PATCHLEVEL  = 4
CFLAGS	    = -Os -fomit-frame-pointer -fno-builtin -UAUTHCRAM -Wall
PATCHES	    = patches/qmail-1.03-condredirect.patch
PATCHES	   += patches/qmail-1.03-showctl.patch
PATCHES	   += patches/qmail-1.03-bind-interface.patch
PATCHES	   += patches/qmail-1.03-install-path.patch
PATCHES	   += patches/qmail-1.03-autouidgid.patch
PATCHES	   += patches/qmail-1.03-queuevar.patch
PATCHES    += patches/qmail-1.03-oversizeddns.patch
ifeq ($(CONFIG_QMAIL_SSL),y)
CFLAGS	   += -DTLS
ifeq ($(CONFIG_QMAIL_OPENSSL),y)
PATCHES    += patches/qmail-1.03-starttls-smtp-auth.patch
else
CFLAGS	   += -DMATRIXSSL
PATCHES	   += patches/qmail-1.03-matrixssl-auth.patch
endif
endif
PATCHES    += patches/qmail-1.03-auth-require-starttls.patch
PATCHES    += patches/qmail-1.03-tarpit.patch
PATCHES    += patches/qmail-1.03.nullenvsender-recipcount.patch
PATCHES    += patches/qmail-send-mimeheaders.patch
PATCHES    += patches/qmail-1.03-errno.patch
PATCHES    += patches/qmail-1.03-spp.patch
PATCHES    += patches/qmail-1.03-int32.patch
PATCHES    += patches/qmail-1.03-smtpd_size+spp.patch

DO_PREPARE  =
DO_INSTALL  = $(STAMP)-myinstall
DO_BUILD    = $(STAMP)-mybuild

FILES	    = /
EXPRESSION  = "%m %u:%g /%p %l\n"
QMAILINIT   = $(TMPDIR)/etc/minit/services/qmail
SMTPDINIT   = $(TMPDIR)/etc/minit/services/smtpd

include $(TOPDIR)/rules.mk

$(STAMP)-mybuild:
	echo "gcc" >$(PACKAGE)/conf-cc
	echo "gcc -s -L/lib" >$(PACKAGE)/conf-ld
	(cd $(PACKAGE); PATH=/usr/bin:/bin; make install && mv install install.old)
	rm -f $(PACKAGE)/has*.h $(PACKAGE)/*.[ao]
	echo "$(COMPILER) -I$(TARGETINCDIR) $(CFLAGS)" >$(PACKAGE)/conf-cc
	echo "$(COMPILER) -L$(TARGETLIBDIR) -static -s" >$(PACKAGE)/conf-ld
	(cd $(PACKAGE); make compile makelib it man && mv install.old install);
	touch $(STAMP)-mybuild

$(STAMP)-myinstall: $(DO_PREPARE) $(DO_BUILD)
	# QMAIL
	install -d $(QMAILINIT)/log $(SMTPDINIT)/log
	cd $(QMAILINIT) && ln -sf /usr/bin/qmail-start run && touch respawn
	cd $(QMAILINIT)/log && ln -sf /usr/bin/logger run && touch respawn
	printf -- "./Maildir/\n" > $(QMAILINIT)/params
	printf -- "-t\nqmail\n-p\nmail.notice\n" > $(QMAILINIT)/log/params
	# SMTPD
	install -m 755 scripts/smtpd-run $(SMTPDINIT)/run && touch $(SMTPDINIT)/respawn
	cd $(SMTPDINIT)/log && ln -sf /usr/bin/logger run && touch respawn
	printf -- "-t\nsmtpd\n-p\nmail.notice\n" > $(SMTPDINIT)/log/params
	printf -- "mailinit\nservices/qmail\n" > $(SMTPDINIT)/depends
	# prepare installation
	install -d $(TMPDIR)/{etc/qmail/{alias,plugins},usr/bin,var/qmail}
	(cd $(TMPDIR)/var/qmail; \
	  ln -sf ../../usr/bin . ; \
	  ln -sf ../../etc/qmail/alias . ; \
	  ln -sf ../../etc/qmail/plugins . ; \
	)
	(cd $(PACKAGE); \
	  	./make-owners . ; \
		./install $(TMPDIR)/var/qmail; \
		rm -rf $(TMPDIR)/var/qmail/{boot,doc,man}; \
		install -o root -g qmail -d $(TMPDIR)/var/qmail/owners; \
		mv owners/* $(TMPDIR)/var/qmail/owners; \
	)
	(cd $(TMPDIR); \
		find var/qmail -printf $(EXPRESSION) >  var/qmail/control/permissions; \
		find etc/qmail -printf $(EXPRESSION) >> var/qmail/control/permissions; \
		tar -cjf etc/qmail/varqmail.tar.bz2 var && rm -rf var; \
	)
	touch $(STAMP)-myinstall
