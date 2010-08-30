# $Id: Makefile 276 2004-09-19 20:28:28Z gernot $
#
# CONFIG_TINYPROXY_STATIC=y
# CONFIG_TINYPROXY_FILTER=n
# CONFIG_TINYPROXY_UPSTREAM=n
#  --------------------------------------------------------------------------
#  -rwxr-xr-x  1 root root 74884 19. Mar 12:04 /usr/sbin/tinyproxy
#  --------------------------------------------------------------------------
#  tproxy   28310  0.0  0.0    224   128 ?   S    12:04   0:00 tinyproxy
#  tproxy   28311  0.0  0.0    224    68 ?   S    12:04   0:00  \_ tinyproxy
#
# CONFIG_TINYPROXY_STATIC=n
# CONFIG_TINYPROXY_FILTER=n
# CONFIG_TINYPROXY_UPSTREAM=n
#  --------------------------------------------------------------------------
#  -rwxr-xr-x  1 root root 42952 19. Mar 14:25 /usr/sbin/tinyproxy
#  --------------------------------------------------------------------------
#  tproxy    2995  0.0  0.0    400   256 ?   S    14:25   0:00 tinyproxy
#  tproxy    2996  0.0  0.0    400   128 ?   S    14:25   0:00  \_ tinyproxy


include $(TOPDIR)/.config

NAME	    = tinyproxy
VERSION	    = 1.6.3
FORMAT	    = tar.gz
STRIPPIT    = yes
DO_PREPARE  = $(STAMP)-fixlibtool $(STAMP)-prepare
PREFIX	    = /usr
CC	   += $(CFLAGS_S) -ffunction-sections -fdata-sections
LDFLAGS	   += -Wl,--gc-sections

ifeq ($(CONFIG_TINYPROXY_FILTER),y)
ARGS       += --enable-filter
else
ARGS       += --disable-filter
endif

ifeq ($(CONFIG_TINYPROXY_FTP),y)
ARGS       += --enable-ftp
else
ARGS       += --disable-ftp
endif

ifeq ($(CONFIG_TINYPROXY_UPSTREAM),y)
ARGS       += --enable-upstream
else
ARGS       += --disable-upstream
endif

ifeq ($(CONFIG_TINYPROXY_TRANSPARENT),y)
ARGS       += --enable-transparent-proxy
else
ARGS       += --disable-transparent-proxy
endif

ARGS += ac_cv_func_regexec=yes tinyproxy_cv_regex_broken=no

ifeq ($(CONFIG_TINYPROXY_STATIC),y)
MAKEARGS   += CCLD='--tag=CCLD $(COMPILER) -all-static'
endif

CFLAGS	    = $(CFLAGS_S)

FILES	    = .$(PREFIX)/sbin/tinyproxy ./etc/tinyproxy .$(PREFIX)/share/*

include $(TOPDIR)/rules.mk
