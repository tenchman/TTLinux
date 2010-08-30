# $Id: Makefile 733 2006-09-13 15:51:23Z gernot $

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

VERSION	    = 3.0.24
NAME	    = samba
FORMAT	    = tar.gz
PATCHLEVEL  = 2
PKGSUBDIR   = source
PATCHES     = samba-statvfs.patch
PATCHES    += samba-PATH_MAX.patch
PATCHES    += samba-largefile.patch
PATCHES    += samba-sambagroups.patch
PATCHES    += samba-ad2008.patch
ifneq ($(ARCH),i386)
#PATCHES    += samba-cross.patch
#DO_AUTOCONF = $(STAMP)-autoconf259
endif
#PATCHES    += samba-sharedlibs.patch
CFLAGS      = $(CFLAGS_S) -ffunction-sections -fdata-sections
CPPFLAGS   += -D_BSD_SOURCE -D_GNU_SOURCE -DHAVE_KRB5_PRINC_REALM=1
#-U_LARGEFILE64_SOURCE -U_FILE_OFFSET_BITS
LDFLAGS     =  -s -lcompat -Wl,--gc-sections
LD_LIBRARY_PATH=/opt/diet/lib-$(ARCH)/samba
DO_PREPARE  = $(STAMP)-prepare
PREFIX      = /usr
ARGS       += --enable-pie=no
ARGS       += --sysconfdir=/etc
ARGS       += --with-lockdir=/var/lock
ARGS       += --with-piddir=/var/run
ARGS       += --with-configdir=/etc/samba
ARGS       += --with-logfilebase=/var/log
ARGS       += --with-privatedir=/var/samba
ARGS       += --with-bindir=/usr/sbin
ARGS       += --with-libdir=/opt/diet/lib-$(ARCH)/samba
ARGS	   += --with-krb5=/opt/diet

ifeq ($(CONFIG_SAMBA_LDAP),y)
ARGS       += --with-ldap=yes
LDFLAGS    += -L/opt/diet/lib-$(ARCH)/openldap
else
ARGS       += --with-ldap=no
endif
ifneq ($(CONFIG_CUPS),y)
ARGS       += --enable-cups=no
endif
ifeq ($(CONFIG_SAMBA_ICONV),y)
ARGS       += --with-libiconv=/opt/diet/lib-$(ARCH)/iconv
endif
FILES       = $(PREFIX)/bin $(PREFIX)/sbin /opt/diet/lib-i386/samba $(PREFIX)/include
STRIPPIT    = yes

include $(TOPDIR)/rules.mk
