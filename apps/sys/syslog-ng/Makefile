# $Id: Makefile 963 2007-03-26 19:58:59Z gernot $

include $(TOPDIR)/.config

NAME	    = syslog-ng
VERSION	    = 2.0.5
FORMAT	    = tar.gz
ARGS        = --with-libnet=no
DO_PREPARE  = $(STAMP)-prepare

FILES  += /opt/diet/sbin/syslog-ng /opt/diet/share/man/man8/syslog-ng.8*
FILES  += /opt/diet/share/man/man5/syslog-ng.conf.5*

include $(TOPDIR)/rules.mk
