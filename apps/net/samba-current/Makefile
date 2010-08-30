# $Id: Makefile 733 2006-09-13 15:51:23Z gernot $

# all versions of Samba numbered 3.2 and later will be under the GPLv3, all
# versions of Samba numbered 3.0.x and before remain under the GPLv2.

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

VERSION	    = 3.2.4
NAME	    = samba
FORMAT	    = tar.gz
PKGSUBDIR   = source
#PATCHES    += samba-PATH_MAX.patch
PATCHES    += samba-largefile.patch
PATCHES    += samba-autoconf.patch
PATCHES    += samba-sambagroups.patch
PATCHES    += samba-lseek.patch
PATCHES    += samba-debug.patch
# PATCHES    += samba-sharedmodule.patch
# PATCHES    += samba-sharedlibs.patch
CFLAGS      = $(CFLAGS_S)
CPPFLAGS   += -D_BSD_SOURCE -D_GNU_SOURCE
#-U_LARGEFILE64_SOURCE -U_FILE_OFFSET_BITS
LDFLAGS     =  -s -lcompat
LD_LIBRARY_PATH=/opt/diet/lib-$(ARCH)/samba
DO_PREPARE  = $(STAMP)-prepare
PREFIX      = /usr
MOD_IDMAP   = idmap_ad,idmap_ldap,idmap_rid,idmap_nss,idmap_passdb,idmap_tdb
MOD_AUTH    = auth_sam,auth_unix,auth_winbind,auth_server,auth_domain,auth_builtin,auth_script
MOD_PDB     = pdb_ldap,pdb_smbpasswd,pdb_tdbsam
MOD_NSS     = nss_info_template
MOD_RPC     = rpc_echo,rpc_eventlog,rpc_lsa_ds,rpc_lsa,rpc_net,rpc_netdfs,rpc_ntsvcs,rpc_reg,rpc_samr,rpc_spoolss,rpc_srv,rpc_svcctl,rpc_wkssvc

ARGS       += --enable-pie=no $(HOSTARGS)
ARGS       += --sysconfdir=/etc
ARGS       += --with-lockdir=/var/lock
ARGS       += --with-piddir=/var/run
ARGS       += --with-configdir=/etc/samba
ARGS       += --with-logfilebase=/var/log
ARGS       += --with-privatedir=/var/samba
ARGS       += --with-bindir=/usr/sbin
ARGS       += --with-libdir=/opt/diet/lib-$(ARCH)/samba
ARGS	   += --with-krb5=/opt/diet
ARGS       += --without-pam --without-cifsmount
ARGS       += --with-static-modules=idmap_ad,idmap_ldap,idmap_tdb,idmap_rid
# ARGS       += --with-shared-modules=$(MOD_IDMAP),$(MOD_AUTH),$(MOD_PDB),$(MOD_RPC)

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
