include $(TOPDIR)/.config

NAME	    = module-init-tools
VERSION	    = 3.10
FORMAT	    = tar.bz2
PATCHES     = module-init-tools-3.1-diet.patch
CC         += -static
PREFIX      = /
DO_PREPARE  = $(STAMP)-prepare
DO_AUTOCONF = $(STAMP)-autoconf
DO_BUILD    =
STRIPPIT    = yes
INSTALLARGS = install-exec

FILES	    = /sbin /bin

include $(TOPDIR)/rules.mk
