# $Id$

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

PATCHES	    = collectd-remove_ppp_peaks.patch 
PATCHES	   += collectd-types.patch
PATCHES	   += collectd-truncate.patch
# DO_AUTOCONF = $(STAMP)-autoconf

NAME	    = collectd
FORMAT	    = tar.bz2
VERSION	    = 4.10.1
CC         += $(KERNELFLAGS) $(TTL_KERNELINC) -D_REENTRANT
#CPPFLAGS   += -D_BSD_SOURCE
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
# with ARGS
ARGS       += --with-liboconfig
# without ARGS
ARGS       += --without-libopenipmi --without-libnetsnmp --without-perl-bindings
ARGS       += --without-libnetlink --with-libgcrypt --without-libcurl
# enable ARGS
ARGS       += --enable-myplugin --enable-tail --enable-cpu
# disable ARGS
ARGS       += --disable-hddtemp --disable-nginx --disable-apache 
ARGS       += --disable-apcups --disable-battery --disable-cpufreq --disable-csv
ARGS       += --disable-email --disable-exec --disable-irq --disable-mbmon
ARGS       += --disable-mysql --disable-nfs --disable-nut --disable-ntpd
ARGS       += --disable-perl --disable-ping --disable-serial --disable-snmp --disable-nagios
ARGS       += --disable-tape --disable-unixsock --disable-users --disable-wireless
ARGS       += --disable-xmms --disable-vserver --disable-dns --disable-entropy 
ARGS	   += --disable-teamspeak2 --disable-powerdns --disable-vmem
ARGS       += --disable-df --disable-disk --disable-ipvs --disable-load --disable-thermal
ARGS       += --disable-memcached --disable-multimeter --disable-swap --disable-netlink
ARGS	   += --disable-notify_email --disable-notify_desktop
ARGS       += --disable-uuid --disable-openvpn

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
	sed -i -e "s:^BUILD_WITH_LIBRRD_LDFLAGS.*:BUILD_WITH_LIBRRD_LDFLAGS=/opt/diet/lib-$(ARCH)/librrd_th.a -lm:g" $(PKGBUILDDIR)/Makefile $(PKGBUILDDIR)/src/Makefile
	sed -i -e "s:-Werror::g" $(PKGBUILDDIR)/Makefile $(PKGBUILDDIR)/src/Makefile
	touch $@
