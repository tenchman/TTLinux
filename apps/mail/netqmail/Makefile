# $Id: Makefile 1417 2008-06-26 06:51:31Z gernot $

include $(TOPDIR)/.config

NAME	    = netqmail
VERSION	    = 1.06
FORMAT	    = tar.gz
PREFIX	    = /usr
PATCHLEVEL  = 0
CFLAGS	    = -Os -fomit-frame-pointer -fno-builtin -UAUTHCRAM -Wall
PATCHES	    = patches/netqmail-condredirect.patch
PATCHES	   += patches/netqmail-bind_interface.patch
PATCHES	   += patches/netqmail-installpath.patch
PATCHES	   += patches/netqmail-autouidgid.patch
PATCHES    += patches/netqmail-oversizeddns.patch
# combines tarpit, nullenvsender-recipcount and sizelimit patch
PATCHES    += patches/netqmail-smtpd.patch
PATCHES    += patches/netqmail-send-mimeheaders.patch
# taken from qmail-spp-0.42.tar.gz
PATCHES    += patches/netqmail-spp.patch
ifeq ($(CONFIG_QMAIL_SSL),y)
CFLAGS	   += -DTLS -DMATRIXSSL
# combines matrixssl, auth-require-starttls
PATCHES    += patches/netqmail-matrixssl_auth.patch
endif
PATCHES    += patches/netqmail-logline.patch

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
	# build a glibc linked "install"
	(cd $(PACKAGE); PATH=/usr/bin:/bin; make install && mv install install.old)
	rm -f $(PACKAGE)/has*.h $(PACKAGE)/*.[ao]
	# rebuild linked against dietlibc
	sed -i -e "s:.*\./chkspawn::" $(PACKAGE)/Makefile
	echo "$(COMPILER) -I$(TARGETINCDIR) $(CFLAGS)" >$(PACKAGE)/conf-cc
	echo "$(COMPILER) -L$(TARGETLIBDIR) -static" >$(PACKAGE)/conf-ld
	(cd $(PACKAGE); \
		make auto-str auto-int8 auto-int chkshsgr; \
		echo "char auto_qmail[] = \"\057\166\141\162\057\161\155\141\151\154\";" > auto_qmail.c ; \
		echo "char auto_break[] = \"\055\";" > auto_break.c ; \
		echo "char auto_usera[] = \"\141\154\151\141\163\";" > auto_usera.c ; \
		echo "int auto_patrn = 2;" > auto_patrn.c ; \
		echo "int auto_spawn = 120;" > auto_spawn.c ; \
		echo "int auto_split = 23;" > auto_split.c ; \
		echo "#define HASSHORTSETGROUPS 1" > hasshsgr.h ; \
		make compile makelib it man && mv install.old install \
	);
	touch $(STAMP)-mybuild

$(STAMP)-myinstall: $(DO_BUILD)
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
