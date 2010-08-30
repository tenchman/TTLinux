# $Id: Makefile 1796 2009-12-02 16:53:33Z matthias $

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

NAME	     = busybox
VERSION	     = 1.15.2
PATCHLEVEL   = 1
FORMAT	     = tar.bz2
PATCHES	     = busybox-diet.patch
PATCHES     += busybox-1.3.1-uidgid.patch
PATCHES     += busybox-CFLAGS.patch
PATCHES     += busybox-links.patch
PATCHES     += busybox-pgrphack.patch
PATCHES     += busybox-ttyname.patch
#PATCHES     += busybox-endian.patch
CFLAGS      += -D_BSD_SOURCE -funsigned-char
DO_PREPARE   =
DO_BUILD     = $(STAMP)-mybuild
MAKEARGS     = CC='$(COMPILER)' CFLAGS='$(CFLAGS)' LDFLAGS='-L$(TARGETLIBDIR) -static' CROSS_COMPILE='$(TARGETALIAS)-' V=1 
INSTALLARGS  = CONFIG_PREFIX='$(TMPDIR)' $(MAKEARGS) install
CONFIG	     = busybox.config.$(TTL_KERNELARCH)
STRIPPIT     = yes

FILES = ./

ifneq ($(CONFIG_BUSYBOX_SHARED),)
BBSHARED = $(CONFIG_BUSYBOX_SHARED)
else
BBSHARED = n
endif

include $(TOPDIR)/rules.mk

$(STAMP)-mybuild: $(DO_PREPARE) $(CONFIG)
	(cd $(PACKAGE); \
		cp ../$(CONFIG) .config; \
		make $(MAKEARGS); \
	);
	touch $(STAMP)-mybuild
#original busybox flags
#-Wall -O2 -D_BSD_SOURCE -funsigned-char -D_BSD_SOURCE -Wall -Wshadow -Wwrite-strings -Wundef -Wstrict-prototypes -Wunused -Wunused-parameter -Wunused-function -Wunused-value -Wmissing-prototypes -Wmissing-declarations -Wdeclaration-after-statement -Wold-style-definition -fno-builtin-strlen -finline-limit=0 -fomit-frame-pointer -ffunction-sections -fdata-sections -fno-guess-branch-probability -funsigned-char -static-libgcc -Os  -march=i386 -mpreferred-stack-boundary=2    -D"KBUILD_STR(s)=#s" -D"KBUILD_BASENAME=KBUILD_STR(header_list)"  -D"KBUILD_MODNAME=KBUILD_STR(header_list)" 
