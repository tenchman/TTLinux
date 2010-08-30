include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

# VERSION     = 2.6.28.4-rsbac-generic
VERSION     = $(TTL_KERNELVER)
NAME        = roswitch
FORMAT      = tar.gz
ifneq (,$(findstring 2.6.22,$(TTL_KERNELVER)))
  PKGSRC      = $(NAME)-20081009.$(FORMAT)
else
  #PKGSRC      = $(NAME)-20090429.$(FORMAT)
  #PKGSRC      = $(NAME)-20090604.$(FORMAT)
  #2-6-30
  PKGSRC      = $(NAME)-20100201.$(FORMAT)
endif
DO_PREPARE  = $(STAMP)-myprepare
FILES       = /lib/modules/*/extra/roswitch*.ko /usr/sbin/lissledd
CC          = $(COMPILER)
COMMONARGS  = TTLINUX=$(TOPDIR) LINUX_FULLVER=$(TTL_KERNELVER) KERNEL_SOURCE_v2_6=$(TTL_KERNELSRC) KERNEL_VERSION=$(TTL_KERNELSRC)
MAKEARGS    = v2.6 $(COMMONARGS) HOSTCC='$(CC) -I.' LDFLAGS='-L/opt/diet/lib-$(ARCH)'
INSTALLARGS = SUBDIRS=v2.6 $(COMMONARGS) install

include $(TOPDIR)/rules.mk

$(STAMP)-myprepare:
	# replace obsolete inclusion of <linux/config.h>
	find $(PKGBUILDDIR) -name "*.c" -exec perl -pi -e "s,linux/config.h,linux/autoconf.h," {} \;
	perl -pi -e "s,mawk,$(DISTDIR)/bin/mawk," $(PKGBUILDDIR)/common.mk
	touch $(STAMP)-myprepare
	echo $(TTL_KERNELVER)
