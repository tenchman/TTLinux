# $Id$

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

#this patch is for 4.2.x versions includes all other
#so ohter patches have to be commented out if building
# 4.2.3 etc.
#PATCHES	    = collectd-mail.patch

#patches for versions >= 4.5
PATCHES	    = collectd-remove_ppp_peaks.patch 
PATCHES	   += collectd-notify.patch
PATCHES	   += collectd-types.patch
PATCHES	   += collectd-truncate.patch
DO_AUTOCONF = $(STAMP)-autoconf

NAME	    = collectd
FORMAT	    = tar.bz2
VERSION	    = 4.6.4
CC         += $(KERNELFLAGS) $(TTL_KERNELINC) -D_REENTRANT
CPPFLAGS   += -D_BSD_SOURCE
LDFLAGS    += -lcompat
PREFIX      = /opt/diet
STRIPPIT    = yes
DO_PREPARE  = $(STAMP)-prepare $(STAMP)-myprepare
FILES       = $(PREFIX)/*bin/collectd*
FILES      += $(PREFIX)/share/man/man*/*
FILES	   += $(PREFIX)/lib-$(ARCH)/collectd/*.so
FILES	   += $(PREFIX)/share/collectd/types.db
ARGS        = $(HOSTARGS)
ARGS       += --prefix=/opt/diet
ARGS       += --enable-myplugin --disable-hddtemp
ARGS       += --disable-perl --with-liboconfig --disable-apache --without-libopenipmi
ARGS       += --disable-apcups --disable-battery --disable-cpufreq --disable-csv
ARGS       += --disable-email --disable-exec --disable-irq --disable-mbmon
ARGS       += --disable-mysql --disable-nfs --disable-nginx --disable-nut --disable-ntpd
ARGS       += --disable-perl --disable-ping --disable-serial --disable-snmp --disable-nagios
ARGS       += --disable-tape --disable-unixsock --disable-users --disable-wireless
ARGS       += --disable-xmms --disable-vserver --disable-dns --disable-entropy 
ARGS	   += --disable-teamspeak2 --disable-powerdns --disable-vmem
ARGS       += --disable-df --disable-disk --disable-ipvs --disable-load --disable-thermal
ARGS       += --disable-memcached --disable-multimeter --disable-swap --disable-netlink
ARGS	   += --disable-notify_email --disable-notify_desktop --without-libnetsnmp --without-perl-bindings
ARGS	   += --enable-notify_liss --enable-tail --without-libnetlink --enable-cpu 
ARGS       += --disable-uuid --disable-openvpn --with-included-ltdl

ifeq ($(CONFIG_COLLECTD_RRDTOOL),y)
ARGS        += --with-rrdtool=yes 
endif

ifeq ($(CONFIG_COLLECTD_IPTABLES),y)
  ARGS 	   += --enable-iptables=yes
else
  ARGS 	   += --disable-iptables
endif

ifeq ($(CONFIG_COLLECTD_LM_SENSORS),y)
  ARGS 	   += --enable-sensors=yes
else
  ARGS     += --without-lm-sensors
  ARGS 	   += --disable-sensors
endif

ifneq ($(ARCH),i386)
  ifeq ($(ARCH),armeb)
    ARGS   += --with-fp-layout=endianflip
    ARGS   += --with-nan-emulation
    ARGS   += --disable-iptables --without-liboping
  endif
  ARGS     += have_nan_zero=yes
endif

include $(TOPDIR)/rules.mk

$(STAMP)-myprepare:
	perl -pi -e "s:^BUILD_WITH_LIBRRD_LDFLAGS.*:BUILD_WITH_LIBRRD_LDFLAGS=/opt/diet/lib-$(ARCH)/librrd_th.a -lm:g" $(PACKAGE)/Makefile $(PACKAGE)/src/Makefile
	touch $@
