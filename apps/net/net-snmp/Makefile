# $Id: Makefile 1611 2009-05-04 10:34:03Z gernot $
#
# --with-enterprise-oid=7067
# See: http://www.iana.org/assignments/enterprise-numbers
#      iso.org.dod.internet.private.enterprises.7067 == TELCO TECH GmbH

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

VERSION	    = 5.4.1
NAME	    = net-snmp
FORMAT	    = tar.gz
PATCHLEVEL  = 2
PATCHES	    = net-snmp-5.4.1-diet.patch
PATCHES	   += net-snmp-5.4.1-nodes.patch
PATCHES    += net-snmp-5.4.1-snmp_versions.patch
PATCHES    += net-snmp-5.4.1-alias.patch
PATCHES    += net-snmp-logging.patch

DO_PREPARE  = $(STAMP)-myprepare
DO_INSTALL  = $(STAMP)-myinstall
PREFIX	    = /usr

FILES	    = /usr /opt/diet
INSTALLARGS = INSTALL_PREFIX=$(TMPDIR) install
STRIPPIT    = yes
CFLAGS	   += $(CFLAGS_S) -D_BSD_SOURCE -Wno-deprecated-declarations
# CFLAGS     += -I/usr/local/include
# Make sure symbols in dynamically loaded MIB modules can be resolved.
# Quoted from
#   http://www.qnx.com/developers/docs/6.3.2/neutrino/lib_ref/d/dlopen.html
#
# For executables, the dynamic symbol table typically contains only
# those symbols that are known to be needed by any shared
# libraries. This is determined by the linker when the executable is
# linked against a shared library.
#
# Since you don't link your executable against a shared object that
# you load with dlopen(), the linker can't determine which executable
# symbols need to be made available to the shared object.
#
# If your shared object needs to resolve symbols in the executable,
# then you may force the linker to make all of the symbols in the
# executable available for dynamic linking by specifying the -E linker
# option.
LDFLAGS     += -Wl,-E -Wl,--gc-sections 

MIB_MODULES  = host snmp-usm-dh-objects-mib mibII ucd-snmp/dlmod ucd-snmp/disk ucd-snmp/loadave ucd-snmp/proc
MIB_MODULES += Rmon Rmon/statistics Rmon/alarm Rmon/event ucd-snmp/memory

ARGS	    = --without-rpm --without-libwrap $(HOSTARGS)
ARGS       += --libdir=/opt/diet/lib-$(ARCH) --includedir=/opt/diet/include
ARGS       += --with-default-snmp-version=3 --with-logfile=/var/log/snmpd.log
ARGS       += --with-sys-contact="support@telco-tech.de" --with-sys-location="earth"
ARGS       += --with-out-transports="UDPIPv6 TCPIPv6 Unix AAL5PVC IPX TCP"
ARGS       += --with-persistent-directory="/var/lib/snmp"
ARGS       += --with-enterprise-oid=7067
ARGS       += --with-out-mib-modules="disman agentx tunnel agent_mibs disman/event disman/schedule mibII/mta_sendmail ucd-snmp/lmSensors smux disman/old-event-mib"
ARGS       += --disable-snmptrapd-subagent --enable-mini-agent

ARGS       += --disable-snmpv1 --disable-snmpv2c --disable-embedded-perl
ARGS	   += --disable-shared 
ARGS       += --disable-manuals --disable-scripts 

ifeq ($(ARCH),armeb)
ARGS       += --with-endianness=big 
else
ifeq ($(ARCH),arm)
ARGS       += --with-endianness=little
endif
endif

ifeq ($(CONFIG_NET_SNMP_DEBUG),y)
  ARGS	   += --enable-debugging
else
  ARGS	   += --disable-debugging
endif
ifeq ($(CONFIG_NET_SNMP_SSL),y)
  ARGS	   += --with-openssl
else
  ARGS	   += --without-openssl
endif
ifeq ($(CONFIG_NET_SNMP_NO_MIBS),y)
  ARGS       += --disable-mibs --disable-mib-loading
endif

ARGS       += --with-mib-modules="$(MIB_MODULES)"

ifeq ($(CONFIG_NET_SNMP_LISS_RW_COMPLIANCE),y)
CFLAGS     += -DLISS_RW_COMPLIANCE
  ifeq ($(CONFIG_NET_SNMP_LISS_FULL_COMPLIANCE),y)
  CFLAGS   += -DLISS_FULL_COMPLIANCE
    ifeq ($(CONFIG_NET_SNMP_LISS_MANSEC_FULL_COMPLIANCE),y)
    CFLAGS += -DLISS_MANSEC_FULL_COMPLIANCE
    endif
  endif
endif

ifeq ($(INSTALL),)
  INSTALL=install
endif

include $(TOPDIR)/rules.mk

$(STAMP)-myprepare: $(STAMP)-patch $(STAMP)-autoconf259
	(cd $(PKGBUILDDIR); \
		export PKG_CONFIG_PATH=$(PKG_CONFIG_PATH); \
		CC='$(CC)' autoconf && ./configure \
		--disable-nls \
		--prefix=$(PREFIX) \
		--mandir=$(PREFIX)/share/man \
		--libdir=$(PREFIX)/lib-$(ARCH) \
		--infodir=$(PREFIX)/share/info \
		--sysconfdir=/etc $(ARGS) $(LIBTOOL) \
	);
	touch $(STAMP)-myprepare

$(STAMP)-myinstall: $(STAMP)-install
	mkdir -p $(TMPDIR)/opt/diet/bin
	mv $(TMPDIR)/usr/bin/net-snmp-config $(TMPDIR)/opt/diet/bin
	touch $(STAMP)-myinstall

