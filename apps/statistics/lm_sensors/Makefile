# $Id:$

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

NAME	    = lm_sensors
VERSION	    = 3.1.1
FORMAT	    = tar.bz2
PATCHES     = lm_sensors-dirent.patch
DO_PREPARE  = 
DIRS        = PREFIX=$(PREFIX) LIBDIR=$(PREFIX)/lib-$(ARCH) MANDIR=$(PREFIX)/share/man
ifeq ($(CONFIG_LM_SENSORS_SENSORD),y)
  EXTRA=PROG_EXTRA=sensord
  SBINEXTRA=,sensord
endif
MAKEARGS    = $(DIRS) $(EXTRA) CFLAGS='$(KERNELFLAGS) $(TTL_KERNELINC)' LDFLAGS='-static -lcompat' user
INSTALLARGS = $(DIRS) $(EXTRA) user_install
STRIPPIT    = yes

FILES       = /etc/sensors*.conf
FILES	   += $(PREFIX)/bin/sensors
FILES      += $(PREFIX)/sbin/{i*,$(SBINEXTRA)}
FILES      += $(PREFIX)/lib-$(ARCH)/*
FILES      += $(PREFIX)/include/sensors/*
FILES      += $(PREFIX)/share/man/*/*

include $(TOPDIR)/rules.mk
