# $Id:$
include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config
include VERSIONS


STAGES     =
PATCHLEVEL = 7
TOOLSDIR   = $(PREFIX)
BINUTILS   = binutils-$(BINUTILSVER)
GCC        = gcc-$(GCCVER)
DIETLIBC   = dietlibc-$(DIETLIBCVER)
DIETHEADER = dietlibc-headers-$(DIETLIBCVER)
FDLIBM     = fdlibm-$(FDLIBMVER)
BUILDDIR   = $(TOPDIR)/toolchain/build
PATCHDIR   = $(TOPDIR)/toolchain/patches
DISTFILES  = $(TOPDIR)/distfiles
TMPDIR     = $(TOPDIR)/tmp
TARGET     = $(TARGETALIAS)
LOADER     = $(TOOLSDIR)/lib-$(ARCH)/libdl.so
DO_CLEAN   = $(STAMP)-clean

# c++ support
# USE_WCHAR = --enable-c-mbchar=no # for gcc-3.x
USE_WCHAR  = --enable-wchar_t=no # for gcc-4.x

STARTFILEPATH   = $(TOOLSDIR)/lib/gcc/$(TARGET)/$(GCCVER)
include $(TOPDIR)/toolchain/patches/$(DIETLIBC)/patches.mk
BINUTILSPATCHES = binutils-pagesizehack.patch
GCCPATCHES      = gcc-$(GCCVER)-$(TTL_KERNELARCH)-diet.patch
ifeq ($(TTL_KERNELARCH), arm)
  GCCPATCHES   += gcc-$(GCCVER)-arm-bigendian.patch gcc-$(GCCVER)-arm-softfloat.patch
endif
FDLIBMPATCHES   = fdlibm-53-dyn.patch fdlibm-53-float.patch

DIETLDCONF  = /etc/diet.ld-$(ARCH).conf
DIETCFLAGS  = $(CFLAGS) -D_DIET_LD_CONF_NAME=\"$(DIETLDCONF)\" -D_POSIX_SOURCE
DIETCFLAGS += -D_DIET_LD_LIBRARY_PATH=\"$(PREFIX)/lib-$(ARCH):$(PREFIX)/lib\"
ifneq ($(TTL_KERNELARCH), x86)
USE_FDLIBM  = $(STAMP)-fdlibm-install
else
CFLAGS += -march=i686
endif

OPTFLAGS = -O2

PATH = /bin:/usr/bin:$(CCACHEBIN):$(TOOLSDIR)/bin
export PATH
unexport NM LD LDFLAGS COMPILER CC CXX LINKER

TARGETARGS   += AR_FOR_TARGET=$(TARGETALIAS)-ar
TARGETARGS   += AS_FOR_TARGET=$(TARGETALIAS)-as
TARGETARGS   += LD_FOR_TARGET=$(TARGETALIAS)-ld
TARGETARGS   += RANLIB_FOR_TARGET=$(TARGETALIAS)-ranlib

all:	$(STAMP)-binutils-install $(STAMP)-gcc-install \
  	$(STAMP)-dietlibc-install $(USE_FDLIBM) $(STAMP)-gplusplus-install \
	$(STAMP)-dietlibc-install-kernelheaders

#
# ####################################################################
# section BINUTILS
# ####################################################################
#
$(STAMP)-binutils-prepare: $(DISTFILES)/$(BINUTILS).tar.bz2
	(cd $(BUILDDIR); \
	    rm -rf $(BINUTILS); tar -xf $(DISTFILES)/$(BINUTILS).tar.bz2; \
	    cd $(BINUTILS); \
	    perl -i -p -e "s,#.*define.*ELF_DYNAMIC_INTERPRETER.*\".*\",#define ELF_DYNAMIC_INTERPRETER \"$(LOADER)\",;" \
			`grep -lr ELF_DYNAMIC_INTERPRETER *`; \
	    for p in $(BINUTILSPATCHES); do \
		z=`echo $$p | sed -e "s/.*[-\.]\(.*\)\(.patch\)/\1/"`; \
		patch -g 0 -E -b --suffix=.$$z -p1 < $(PATCHDIR)/$$p || exit 1; \
	    done; \
	    ./configure --target=$(TARGET) --prefix=$(TOOLSDIR) --with-lib-path=$(TOOLSDIR)/lib-$(ARCH) --enable-werror=no; \
	)
	touch $@

$(STAMP)-binutils-build: $(STAMP)-binutils-prepare
	(cd $(BUILDDIR)/$(BINUTILS); make; )
	touch $@

$(STAMP)-binutils-install: $(STAMP)-binutils-build
	(cd $(BUILDDIR)/$(BINUTILS); make install; )
	touch $@

#
# ####################################################################
# section DIETLIBC
# ####################################################################
#
$(STAMP)-dietlibc-prepare: $(DISTFILES)/$(DIETLIBC).tar.bz2
	(cd $(BUILDDIR); \
	    rm -rf $(DIETLIBC); tar -xf $(DISTFILES)/$(DIETLIBC).tar.bz2; \
	    cd $(DIETLIBC); \
	    for p in $(DIETLIBCPATCHES); do \
		echo -e "$(c_bold) ==> applying $$p$(c_normal)";	\
		z=`echo $$p | sed -e "s/.*[-\.]\(.*\)\(.patch\)/\1/"`; \
		patch -g 0 -E -b --suffix=.$$z -p1 < $(PATCHDIR)/$(DIETLIBC)/$$p || exit 1; \
	    done; \
	    echo "#define WANT_POSIX_MEMALIGN" >> dietfeatures.h; \
	    rm -rf armeb; \
	    ln -sf arm armeb; \
	    if [ $(TTL_KERNELARCH) = "x86" -a $(ARCH) != "i386" ]; then ln -sf i386 $(ARCH); fi; \
	    perl -pi -e "s/-Os/$(CFLAGS)/g" arm/Makefile.add; \
	    rm -f arm/str*.*; \
	)
	touch $@

$(STAMP)-dietlibc-install-kernelheaders: $(STAMP)-dietlibc-install-headers $(DISTFILES)/$(DIETHEADER).tar.bz2
	(cd $(TOOLSDIR) ; tar -xvf $(DISTFILES)/$(DIETHEADER).tar.bz2)
	touch $@

$(STAMP)-dietlibc-install-headers: $(STAMP)-dietlibc-prepare
	(cd $(BUILDDIR)/$(DIETLIBC); \
		for i in `find include -name \*.h`; do install -m 644 -D $$i $(TOOLSDIR)/$$i; done; \
	)
	touch $@

$(STAMP)-dietlibc-build: $(STAMP)-dietlibc-prepare
	(cd $(BUILDDIR)/$(DIETLIBC); make ARCH=$(ARCH) CROSS=$(TARGET)- MORE_CFLAGS='$(DIETCFLAGS)' all dyn profiling; )
	touch $@

$(STAMP)-dietlibc-install: $(STAMP)-dietlibc-build
	(cd $(BUILDDIR)/$(DIETLIBC); make prefix=$(TOOLSDIR) MORE_CFLAGS='$(DIETCFLAGS)' ARCH=$(ARCH) CROSS=$(TARGET)- install; )
	# move the startfiles to a place where gcc can find them
	cp $(TOOLSDIR)/lib-$(ARCH)/*start.o $(STARTFILEPATH)
	cp $(TOOLSDIR)/lib-$(ARCH)/*stop.o $(STARTFILEPATH)
	echo "#define __WORDSIZE      32" > $(TOOLSDIR)/include/bits/wordsize.h
	mkdir -p $(TMPDIR)/$(DIETLIBC)/etc
	(cd $(BUILDDIR)/$(DIETLIBC); make DESTDIR=$(TMPDIR)/$(DIETLIBC) prefix=$(TOOLSDIR) MORE_CFLAGS='$(DIETCFLAGS)' ARCH=$(ARCH) CROSS=$(TARGET)- install; )
	(cd $(TMPDIR)/$(DIETLIBC); tar -cjf $(TOPDIR)/packages/$(DIETLIBC)-$(PATCHLEVEL).$(ARCH).tar.bz2 opt etc;)
	rm -rf $(TMPDIR)/$(DIETLIBC)
	touch $@

#
# ####################################################################
# section FDLIBM
# ####################################################################
#
$(STAMP)-fdlibm-prepare: $(STAMP)-dietlibc-build $(DISTFILES)/$(FDLIBM).tar.gz
	(cd $(BUILDDIR); \
	    rm -rf $(FDLIBM); tar -xf $(DISTFILES)/$(FDLIBM).tar.gz; \
	    cd $(FDLIBM); \
	    for p in $(FDLIBMPATCHES); do \
		z=`echo $$p | sed -e "s/.*[-\.]\(.*\)\(.patch\)/\1/"`; \
		patch -g 0 -E -b --suffix=.$$z -p1 < $(PATCHDIR)/$$p || exit 1; \
	    done; \
	    ./configure CC='$(COMPILER) -fPIC -L$(TARGETLIBDIR)' CFLAGS='$(OPTFLAGS) -D_MULTI_LIBM' \
	    	--prefix=$(TOOLSDIR) --libdir=$(TARGETLIBDIR) $(HOSTARGS); \
	)
	touch $@

$(STAMP)-fdlibm-build: $(STAMP)-fdlibm-prepare
	(cd $(BUILDDIR)/$(FDLIBM); make LIBNAME=libm libm.a libm.so; )
	touch $@

$(STAMP)-fdlibm-install: $(STAMP)-fdlibm-build
	rm -f $(TARGETLIBDIR)/libm.so
	(cd $(BUILDDIR)/$(FDLIBM); make LIBNAME=libm install; )
	touch $@

#
# ####################################################################
# section GCC
# ####################################################################
#
$(STAMP)-gcc-prepare: $(STAMP)-dietlibc-install-headers $(DISTFILES)/$(GCC).tar.bz2
	rm -rf $(TOOLSDIR)/$(TARGET)/sys-include
	rm -rf $(TOOLSDIR)/lib/gcc/$(TARGET)/$(GCCVER)/include
	(cd $(BUILDDIR); \
		rm -rf  $(GCC); tar -xf $(DISTFILES)/$(GCC).tar.bz2; \
		mkdir -p  $(GCC)/obj-$(ARCH); \
		cd $(GCC); \
	    	for p in $(GCCPATCHES); do \
			z=`echo $$p | sed -e "s/.*[-\.]\(.*\)\(.patch\)/\1/"`; \
			cat $(PATCHDIR)/$$p | sed -e "s/@@ARCH@@/$(ARCH)/g" | patch -g 0 -E -b --suffix=.$$z -p1 || exit 1; \
	    	done; \
		cd obj-$(ARCH); \
		CFLAGS='$(OPTFLAGS) -D__dietlibc__ -pipe' CXXFLAGS='$(OPTFLAGS) -D__dietlibc__ -pipe' \
		$(TARGETARGS) ../configure \
			--target=$(TARGET) --prefix=$(TOOLSDIR) \
			--disable-cpp --disable-shared --disable-multilib \
			--disable-libssp --disable-libmudflap \
			--disable-__cxa_atexit --disable-checking --enable-sjlj-exceptions \
			--enable-nls=no $(USE_WCHAR) --enable-clocale=no \
			--with-headers=$(TOOLSDIR)/include --enable-languages="c"; \
	)
	touch $@

$(STAMP)-gcc-build: $(STAMP)-gcc-prepare
	(cd $(BUILDDIR)/$(GCC)/obj-$(ARCH); make; )
	touch $@

$(STAMP)-gcc-install: $(STAMP)-gcc-build
	(cd $(BUILDDIR)/$(GCC)/obj-$(ARCH); make install; )
	rm -f $(TOOLSDIR)/lib/gcc/$(TARGET)/$(GCCVER)/include/limits.h
	rm -f $(TOOLSDIR)/lib/gcc/$(TARGET)/$(GCCVER)/install-tools/include/limits.h
	touch $@

#
# ####################################################################
# section GCC
# ####################################################################
#
$(STAMP)-gplusplus-prepare: $(STAMP)-gcc-prepare $(STAMP)-dietlibc-install
	(cd $(BUILDDIR); \
		rm -rf $(GCC)/obj-$(ARCH); \
		mkdir -p $(GCC)/obj-$(ARCH); \
		cd $(GCC)/obj-$(ARCH); \
		CC='gcc' CXX='c++' CFLAGS='$(OPTFLAGS) -D__dietlibc__ -pipe' CXXFLAGS='$(OPTFLAGS) -D__dietlibc__ -pipe' \
		$(TARGETARGS) ../configure \
			--target=$(TARGET) --prefix=$(TOOLSDIR) \
			--disable-cpp --disable-shared --disable-multilib \
			--disable-libssp --disable-libmudflap --disable-tls \
			--disable-__cxa_atexit --disable-checking --enable-sjlj-exceptions \
			--enable-nls=no $(USE_WCHAR) --enable-clocale=no \
			--with-headers=$(TOOLSDIR)/include --enable-languages="c,c++"; \
	)
	touch $@

$(STAMP)-gplusplus-build: $(STAMP)-gplusplus-prepare
	(cd $(BUILDDIR)/$(GCC)/obj-$(ARCH); make; )
	touch $@

$(STAMP)-gplusplus-install: $(STAMP)-gplusplus-build
	(cd $(BUILDDIR)/$(GCC)/obj-$(ARCH); make install; )
	rm -f $(TOOLSDIR)/lib/gcc/$(TARGET)/$(GCCVER)/include/limits.h
	rm -f $(TOOLSDIR)/lib/gcc/$(TARGET)/$(GCCVER)/install-tools/include/limits.h
	touch $@


clean:
	@echo "==> cleaning the '$(ARCH)' toolchain"
	@rm -f $(STAMP)-*
	@rm -rf $(BUILDDIR)/*
