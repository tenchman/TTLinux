# $Id: rules.mk,v 1.26 2003/10/06 11:00:43 gernot Exp $

DISTFILES    = $(TOPDIR)/distfiles

ifeq ($(TOOLCHAINBIN),)
include $(TOPDIR)/$(ARCH).config
endif

ifeq ($(OPTIMIZE),size)
OPTFLAGS     = -Os -fomit-frame-pointer
else
OPTFLAGS     = -O2
endif

PACKAGE	     = $(NAME)-$(VERSION)

ifeq ($(PATCHLEVEL),)
PACKAGEVER   = $(VERSION)-$(ARCH)
else
PACKAGEVER   = $(VERSION)-$(PATCHLEVEL).$(ARCH)
endif

ifneq ($(PKGBINNAME),)
PKGBIN       = $(TOPDIR)/packages/$(PKGBINNAME)-$(PACKAGEVER).tar.bz2
else
PKGBIN	     = $(TOPDIR)/packages/$(PRENAME)$(NAME)-$(PACKAGEVER).tar.bz2
endif

ifeq ($(PKGSRC),)
ARCHIV	     = $(DISTFILES)/$(PACKAGE)$(POSTVERSION).$(FORMAT)
else
ARCHIV	     = $(DISTFILES)/$(PKGSRC)
endif

ifeq ($(PKGBUILDDIR),)
ifeq ($(PKGSUBDIR),)
PKGBUILDDIR  = $(BUILDDIR)/$(PACKAGE)
else
PKGBUILDDIR  = $(BUILDDIR)/$(PACKAGE)/$(PKGSUBDIR)
endif
endif

DISTDIR	     = $(TOPDIR)/dist

TMPDIR	     = $(TOPDIR)/tmp/$(PACKAGE)

DIETHOME     = $(DISTDIR)/opt/diet
DIETINC	     = $(DIETHOME)/include 
DIETLIB      = $(DIETHOME)/lib-$(ARCH)
DIETX11      = /opt/diet/X11R7
SYSINC	     = /usr/include
ifeq ($(CONFIG_LIBTOOL),y)
LIBTOOL      = LIBTOOL=$(DIETHOME)/bin/libtool
endif

PKG_CONFIG_PATH = $(DIETHOME)/lib-$(ARCH)/pkgconfig:$(DIETHOME)/X11R7/pkgconfig

#LDFLAGS	    += -L$(DISTDIR)/opt/diet/lib
#LDFLAGS	    += -L$(DISTDIR)/opt/diet/lib-$(ARCH)

GCCVER      = $(shell awk -F'[ \t=]*' '$$1~/^VERSION$$/{print$$2}' $(TOPDIR)/development/gcc/Makefile)
# Default install arguments, override it in Makefiles
INSTALLARGS ?= install

# Default install target, override it in Makefiles
DO_INSTALL  ?= $(STAMP)-install
# Default build target, override it in Makefiles
DO_BUILD    ?= $(STAMP)-build
DO_POSTINST ?=
DO_CLEANUP  ?= $(STAMP)-cleanup
DO_CLEAN    ?= $(STAMP)-clean
DO_PACKAGE  ?= $(STAMP)-package
ifeq ($(CONFIG_CHECK),y)
ifneq ($(CHECK),)
DO_CHECK    ?= $(STAMP)-check
endif
endif
STAGES       = $(STAMP)-unpack $(STAMP)-patch $(DO_PREPARE) $(DO_BUILD)
STAGES 	    += $(DO_CHECK) $(DO_INSTALL) $(DO_POSTINST) $(DO_PACKAGE)
STAGES      += $(STAMP)-pkginst $(DO_CLEANUP)

ifeq ($(VERBOSE),y)
UNTBZ = tar --use-compress-program=$(BZIP2CMD) -xvf
UNTGZ = tar -xzvf
TBZ   = tar --use-compress-program=$(BZIP2CMD) -cvf
else
UNTBZ = tar --use-compress-program=$(BZIP2CMD) -xf
UNTGZ = tar -xzf
TBZ   = tar --use-compress-program=$(BZIP2CMD) -cf
endif

PATH  = $(CCACHEBIN):$(TOOLCHAINBIN)
PATH := $(PATH):$(DISTDIR)$(TARGETROOT)/bin
PATH := $(PATH):/bin:/usr/bin:/sbin:/usr/sbin

#LD_LIBRARY_PATH=$(DIETLIB)

export DIETHOME LDFLAGS CPPFLAGS CFLAGS PATH
export LD_LIBRARY_PATH PKG_CONFIG_PATH GCCVER

c_normal  = \\033[0;39m
c_black	  = \\033[0;00m
c_red  	  = \\033[0;31m
c_green	  = \\033[0;32m
c_brown	  = \\033[0;33m
c_blue	  = \\033[0;34m
c_magenta = \\033[0;35m
c_cyan    = \\033[0;36m
c_gray	  = \\033[0;37m
c_white	  = \\033[1;37m
c_bold    = \\033[1m


# remove leading ./ from old style filelist
FILES := $(patsubst ./%,%,$(FILES))
# remove leading / from new style filelist
FILES := $(patsubst /%,%,$(FILES))
ifeq ($(FILES),)
FILES := *
endif
ifneq ($(BUILDDIR),)
TARTARGET = -C $(BUILDDIR)
else
BUILDDIR  = .
endif

ifeq ($(I18N),yes)
DISABLENLS =
else
DISABLENLS = --disable-nls
endif

THISDIR   = $(shell if [ "$$PWD" != "" ]; then echo $$PWD; else pwd; fi)

all: $(STAGES)

$(PKGBIN): $(STAMP)-package

$(STAMP)-unpack: $(ARCHIV) $(PATCHES) $(EXTRAFILES) Makefile
	@echo -e "$(c_bold) ==> installing $(ARCHIV)$(c_normal)"
	@mkdir -p $(BUILDDIR);
	@rm -rf $(PKGBUILDDIR)
	
	@rm -f $(STAGES) $(EXTRASTAGES) $(STAMP)-*
	
	@if [ $(FORMAT) = "tar.gz" -o $(FORMAT) = "tgz" ]; then \
		$(UNTGZ) $(ARCHIV) $(TARTARGET); \
	elif [ $(FORMAT) = "tar.bz2" -o $(FORMAT) = "tbz" ]; then \
		$(UNTBZ) $(ARCHIV) $(TARTARGET); \
	elif [ $(FORMAT) = "zip" ]; then \
		unzip $(ARCHIV); \
	elif [ $(FORMAT) = "deb" ]; then \
		ar -x $(ARCHIV); \
	fi

	@if [ -d $(BUILDDIR)/$(NAME) ]; then \
		rm -rf $(BUILDDIR)/$(NAME)-$(VERSION);	\
		mv $(BUILDDIR)/$(NAME) $(BUILDDIR)/$(NAME)-$(VERSION); \
	fi
	@if [ ! -z "$(REALNAME)" -a -d "$(BUILDDIR)/$(REALNAME)" ]; then \
		rm -rf $(BUILDDIR)/$(NAME)-$(VERSION);	\
		mv $(BUILDDIR)/$(REALNAME) $(BUILDDIR)/$(NAME)-$(VERSION); \
	fi
	@[ -d $(BUILDDIR)/$(NAME)-$(VERSION) ] && chmod 0755 $(BUILDDIR)/$(NAME)-$(VERSION) || :
	@touch $@

# ===================================================================
# Apply all patches in $(PATCHES) if any
# ===================================================================
$(STAMP)-patch: $(STAMP)-unpack $(PATCHES)
	@cd $(PKGBUILDDIR); \
		for p in $(PATCHES); do \
			if [ -e $(THISDIR)/patches/$$p ]; then			\
			  thepatch=$(THISDIR)/patches/$$p;			\
			else 							\
			  thepatch=$(THISDIR)/$$p;				\
			fi;							\
			echo -e "$(c_bold) ==> applying $$p$(c_normal)";	\
			z=`echo $$thepatch | sed -e "s/.*[-\.]\(.*\)\(.patch\)/\1/"`;	\
			patch -g 0 -E -b --suffix=.$$z -p1 < $$thepatch || exit 1;	\
		done
	touch $@

$(STAMP)-fixlibtool: $(STAMP)-patch
	(cd $(PKGBUILDDIR); \
	  find . -name aclocal.m4 -o -name config.guess -o -name config.sub|xargs rm -f ;\
	  autoupdate; \
	  libtoolize --install --force; \
	  true; \
	)
	touch $@

$(STAMP)-autoconf213: $(STAMP)-patch
	(cd $(PKGBUILDDIR); \
		export PATH=$(PATH); \
		touch NEWS README AUTHORS COPYING INSTALL ChangeLog; \
		chmod 0644 *.m4 *.in; \
		[ -d m4 ] && aclocal-1.5 -I m4 || aclocal-1.5 -I .; \
		automake-1.5 --add-missing; \
		autoconf-2.13; \
		true; \
	)
	touch $@

$(STAMP)-autoconf259: $(STAMP)-patch
	(cd $(PKGBUILDDIR); \
		export PATH=$(PATH); \
		touch NEWS README AUTHORS COPYING INSTALL ChangeLog; \
		chmod 0644 *.m4 *.in; \
		libtoolize --copy --force; \
		[ -d m4 ] && aclocal --force -I m4 || aclocal --force -I .; \
		autoheader-2.59; \
		automake --add-missing; \
		autoconf-2.59; \
		true; \
	)
	touch $@


$(STAMP)-autoconf: $(STAMP)-patch
	(cd $(PKGBUILDDIR); \
		export PATH=$(PATH); \
		touch NEWS README AUTHORS COPYING INSTALL ChangeLog; \
		chmod 0644 *.m4 *.in; \
		[ -d m4 ] && aclocal --force -I m4 || aclocal --force -I .; \
		autoheader; \
		libtoolize --copy --force; \
		automake --add-missing; \
		autoconf; \
		true; \
	)
	touch $@

$(STAMP)-archprepare: $(STAMP)-patch $(DO_AUTOCONF)
	(cd $(PKGBUILDDIR); \
		export PKG_CONFIG_PATH=$(PKG_CONFIG_PATH) PATH=$(PATH); \
		CC='$(CC)' $(LIBTOOL) ./configure \
		$(DISABLENLS) --prefix=$(PREFIX)/$(HOSTVER) \
		--mandir=$(PREFIX)/share/man \
		--infodir=$(PREFIX)/share/info \
		--sysconfdir=/etc $(ARGS) \
	);
	touch $@

$(STAMP)-prepare: $(STAMP)-patch $(DO_AUTOCONF)
	(cd $(PKGBUILDDIR); \
		export PKG_CONFIG_PATH=$(PKG_CONFIG_PATH) PATH=$(PATH); \
		CC='$(CC)' $(LIBTOOL) ./configure \
		$(DISABLENLS) $(HOSTARGS) --prefix=$(PREFIX) \
		--mandir=$(PREFIX)/share/man \
		--libdir=$(PREFIX)/lib-$(ARCH) \
		--infodir=$(PREFIX)/share/info \
		--sysconfdir=/etc $(ARGS) \
	);
	touch $@
	
$(STAMP)-build: $(DO_PREPARE)
	(cd $(PKGBUILDDIR); \
		PATH=$(PATH); \
		$(MAKE) CC='$(CC)' prefix=$(PREFIX) $(MAKEARGS) \
		);
	touch $@

$(STAMP)-check: $(DO_BUILD)
	(cd $(PKGBUILDDIR); \
		PATH=$(PATH); \
		$(MAKE) CC='$(CC)' prefix=$(PREFIX) $(MAKEARGS) $(CHECK) \
		);
	touch $@


$(STAMP)-install: $(DO_BUILD) $(DO_PREPARE)
	mkdir -p $(TMPDIR)$(PREFIX)/{lib,lib-$(ARCH),bin,sbin,include}
	PATH=$(PATH) \
	$(MAKE) -C $(PKGBUILDDIR) CC='$(CC)' DESTDIR=$(TMPDIR) $(INSTALLARGS)
	[ -d $(TMPDIR)$(PREFIX)/share/man ] && bzip2 $(TMPDIR)$(PREFIX)/share/man/man*/*.* || :
	touch $@

# ===================================================================
# strip all binaries if $(STRIPPED) = yes and make a tarball
# ===================================================================
$(STAMP)-package: $(DO_INSTALL)
	@cd $(TMPDIR); \
		if [ "$(STRIPPIT)" = "yes" ]; then \
			TMPDIR=$(TMPDIR) $(TOPDIR)/scripts/strippit; \
		fi; \
	$(TBZ) $(PKGBIN) $(FILES)
	touch $@

# ===================================================================
# install a previously created tarball in $(DISTDIR)
# ===================================================================
$(STAMP)-pkginst: $(PKGBIN)
ifeq ($(ARCH),i386)
	( cd $(DISTDIR); tar -xjf $(PKGBIN) );
else
	( cd $(DISTDIR); tar --exclude-from=$(TOPDIR)/.exclude -xjf $(PKGBIN) );
endif
	touch $@

# ===================================================================
# remove $(TMPDIR) when packaging and installing done
# ===================================================================
$(STAMP)-cleanup:
	@if [ "$(TOPDIR)" != "/" ]; then \
		rm -rf $(TOPDIR)/tmp; \
		mkdir $(TOPDIR)/tmp; \
	fi
	touch $@

$(STAMP)-clean:
	@echo "==> cleaning $(PACKAGE)"
	@rm -rf $(PACKAGE) $(NAME)
	@rm -f $(STAGES) $(STAMP)-*

clean: $(DO_CLEAN)

version:
ifeq ($(PATCHLEVEL),)
	echo "$(subst -,_,$(NAME))=$(VERSION)" >> $(TOPDIR)/versions
else
	echo "$(subst -,_,$(NAME))=$(VERSION)-$(PATCHLEVEL)" >> $(TOPDIR)/versions
endif
