# $Id: Makefile 1548 2009-01-15 22:03:48Z gernot $

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

NAME	    = util-linux
VERSION	    = 2.12r
FORMAT	    = tar.gz
PATCHES     = patches/util-linux-2.12r-diet.patch
PATCHES	   += patches/util-linux-2.12r-checktty.patch
PATCHES    += patches/util-linux-2.11u-agetty.patch
PATCHES	   += patches/util-linux-2.12r-simpleinit_printf.patch
PATCHES    += patches/util-linux-2.12r-no_nls.patch
PATCHES    += patches/util-linux-umount.patch
CFLAGS	   += -D_BSD_SOURCE -D_PATH_VI=\\\"/bin/vi\\\" -I../lib
CFLAGS     += -D__user= -Wno-deprecated-declarations $(KERNELFLAGS) $(TTL_KERNELINC)
CC	   += -static
MAKEARGS   += CRYPT=''
STRIPPIT    = yes
DO_PREPARE  = $(STAMP)-myprepare
STRIPPIT    = yes

FILES = /usr/bin /usr/sbin /bin /sbin

include $(TOPDIR)/rules.mk

unexport CPPFLAGS

$(STAMP)-myprepare: Makefile
	(cd $(PACKAGE); \
	    echo "VERSION=$(VERSION)" > make_include; \
	    echo "CC=$(CC)" >> make_include; \
	    echo "CFLAGS=$(CFLAGS)" >> make_include; \
	    echo "LDFLAGS=$(LDFLAGS)" >> make_include; \
	    echo "HAVE_NEW_GCC=yes" >> make_include; \
	    echo "HAVE_RAW_H=yes" >> make_include; \
	    echo "HAVE_NCURSES=no" >> make_include; \
	    echo "NEED_LIBCRYPT=no" >> make_include; \
	    echo "HAVE_XGETTEXT=no" >> make_include; \
	    echo "HAVE_ZLIB=no" >> make_include; \
	    \
	    echo "#define UTIL_LINUX_VERSION \"$(VERSION)\"" > defines.h; \
	    echo "#define util_linux_version \"util-linux-$(VERSION)\"" >> defines.h; \
	    echo "#define HAVE_blkpg_h" >> defines.h; \
	    echo "#define HAVE_kd_h" >> defines.h; \
	    echo "#define HAVE_locale_h" >> defines.h; \
	    echo "#define HAVE_langinfo_h" >> defines.h; \
	    echo "// #define HAVE_asm_page_h" >> defines.h; \
	    echo "#define HAVE_stdint_h" >> defines.h; \
	    echo "#define HAVE_sys_io_h" >> defines.h; \
	    echo "#define NEED_tqueue_h" >> defines.h; \
	    echo "#define SWAPON_HAS_TWO_ARGS" > mount/swapargs.h; \
	    echo "#include <sys/swap.h>" >> mount/swapargs.h; \
	);
	touch $(STAMP)-myprepare

