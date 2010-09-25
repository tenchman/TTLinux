# $Id: Makefile 1678 2009-06-21 19:53:58Z gernot $

ARCH	  = i386
VENDOR	  = tt
PLATFORM  = linux-dietlibc

include .config

# we need TTL_KERNELARCH from $(ARCH).config
include $(ARCH).config

BUILDDIR  = /var/tmp/TTLinux
TOPDIR	  = $(shell if [ "$$PWD" != "" ]; then echo $$PWD; else pwd; fi)
BZIP2CMD  = $(shell PATH=/bin:/usr/bin:/sbin:/usr/sbin && which pbzip2)
ifeq ($(BZIP2CMD),)
  BZIP2CMD= $(shell PATH=/bin:/usr/bin:/sbin:/usr/sbin && which bzip2)
endif
LANG	  = C
PREFIX	  = /opt/diet
HOSTVER	  = $(ARCH)-$(VENDOR)-$(PLATFORM)
#HOSTCC    = gcc34 -specs $(TOPDIR)/.gcc-spec
HOSTCC    = gcc -specs $(TOPDIR)/.gcc-spec
MAKEFLAGS += --no-print-directory

LIBPRETENDROOT = development/libpretendroot/libpretendroot.so

LD_PRELOAD     = $(TOPDIR)/$(LIBPRETENDROOT)
PRETENDROOTDIR = $(TOPDIR)/tmp
KERNELDIR      = $(TOPDIR)/kernel/$(CONFIG_KERNELVER)
KERNELINC      = $(KERNELDIR)/linux/include

TTL_KERNELVER  = $(shell awk -F'[ \t=]*' '$$1~/^VERSION$$/{print$$2}' $(KERNELDIR)/Makefile)
TTL_KERNELSRC  = $(KERNELDIR)/linux
TTL_KERNELINC  = -I$(TTL_KERNELSRC)/include -I$(TTL_KERNELSRC)/arch/$(TTL_KERNELARCH)/include
KERNELFLAGS    = -nostdinc -isystem $(PREFIX)/include -D_GNU_SOURCE -D__GLIBC__=2 -D__KERNEL_STRICT_NAMES

unexport LD_LIBRARY_PATH TMPDIR MANPATH
export TOPDIR LANG KERNELINC ARCH VENDOR PLATFORM HOSTVER HOSTCC PREFIX BUILDDIR
export KERNELFLAGS KERNELDIR TTL_KERNELINC TTL_KERNELVER TTL_KERNELSRC BZIP2CMD

include makefiles/packages.mk

DOCFILES  = Summary License Copyright URL
BUILDHTML = build.html

# @export LD_PRELOAD=$(LD_PRELOAD) PRETENDROOTDIR=$(PRETENDROOTDIR);
all: check $(LIBPRETENDROOT)
	sed -i -e "s/\".*-linux-dietlibc/\"$(HOSTVER)/g" /opt/diet/bin/libtool
	sed -i -e "s/lib-[^\"]+/lib-$(ARCH)/g" /opt/diet/bin/libtool
	sed -i -e "s,^sys_lib_search_path_spec.*,sys_lib_search_path_spec=\"/opt/diet/$(HOSTVER)/lib /opt/diet/lib-$(ARCH)/gcc/$(HOSTVER)/$(GCCVER) /opt/diet/lib-$(ARCH)\",g" /opt/diet/bin/libtool
	sed -i -e "s,^sys_lib_dlsearch_path_spec.*,sys_lib_dlsearch_path_spec=\"/opt/diet/lib-$(ARCH) /opt/diet/lib-$(ARCH)/gcc/$(HOSTVER)/$(GCCVER)\",g" /opt/diet/bin/libtool
	@mkdir -p dist/opt/diet
	@mkdir -p packages
	@for dir in $(SUBDIRS-y); do \
		  echo -ne "\033]0; == Working on: $$dir == \007"; \
		  echo "  ==> $$dir"; \
		  $(MAKE) -C $$dir || exit 1; \
	done

check:
	@if [ -z $(CONFIG_KERNELVER) ]; then \
	  echo -e "\n\n\tERROR: missing CONFIG_KERNELVER!\n"; \
	  echo -e "\tPlease add CONFIG_KERNELVER to your .config file!\n"; \
	  echo -e "\tExample: CONFIG_KERNELVER=2.6.22 (2.6.28, whatever, ...)\n"; \
	  exit 1; \
	fi
	@if ! readlink $(PREFIX); then \
	  echo -e "\n\n\t$(PREFIX) is not a symbolic link!\n"; \
	  echo -e "\t$(PREFIX) should be symlink to\n\t -> `pwd`/dist$(PREFIX)\n"; \
	  exit 1; \
	fi

$(LIBPRETENDROOT):
	$(MAKE) -C development/libpretendroot

configure:
	make -C config

menuconfig: configure
	config/config/mconf Config.in

horny:
	@for dir in config $(SUBDIRS-y) $(SUBDIRS-n); do \
		  rm -f $$dir/.stamp*; touch $$dir/Makefile; \
	done

clean:
	@for dir in config $(SUBDIRS-y) $(SUBDIRS-n); do \
		  $(MAKE) -C $$dir clean; \
	done
	@for i in tmp/[a-z]*; do rm -f $$i; done
	rm -f `find . -name '*~' -print`

distclean: clean
	rm -rf dist/[a-z]*
	rm -rf packages/[a-z]*

report:
	@for dir in $(SUBDIRS-y) $(SUBDIRS-n); do \
		echo "==> $$dir"; \
		echo -n "URL        "; [ -f $$dir/URL       ] && echo "OK" || echo "MISSING"; \
		echo -n "Summary:   "; [ -f $$dir/Summary   ] && echo "OK" || echo "MISSING"; \
		echo -n "License:   "; [ -f $$dir/License   ] && echo "OK" || echo "MISSING"; \
		echo -n "Config.in: "; [ -f $$dir/Config.in ] && echo "OK" || echo "MISSING"; \
	done

version:
	@rm -f versions
	@for dir in $(SUBDIRS-y) $(SUBDIRS-n); do \
	  	$(MAKE) -C $$dir version; \
	done
	# sed -i -e "s/-.*[^=]/_/g" $(TOPDIR)/versions

html:
	rm -f pkg.tmp
	@printf "<html>\n<head>\n\t<title>Packages utilized by LiSS III</title>\n" > $(BUILDHTML)
	@printf "\t<link rel=\"stylesheet\" type=\"text/css\" href=\"build.css\"></style>\n" >> $(BUILDHTML)
	@printf "</head>\n<body>\n<center>\n" >> $(BUILDHTML)
	@echo "<table class="packages">" >> $(BUILDHTML)
	@for dir in $(SUBDIRS-y) $(SUBDIRS-n); do \
	    if [ ! -f $$dir/hide ]; then \
		echo "$$dir" >> pkg.tmp; \
		echo "<tr><th colspan=\"2\" class=\"packageheader\">$$dir</th></tr>" >> $(BUILDHTML); \
		echo -n "<tr><td class=\"summary\">Summary:</td><td>" >> $(BUILDHTML); \
		[ -f $$dir/Summary   ] && cat $$dir/Summary |sed "s/$$//g" >> $(BUILDHTML); \
		echo "</td></tr>" >> $(BUILDHTML); \
		echo -n "<tr><td class=\"license\">License:</td><td>" >> $(BUILDHTML); \
		[ -f $$dir/License   ] && cat $$dir/License |sed "s/$$//g" >> $(BUILDHTML); \
		echo "</td></tr>" >> $(BUILDHTML); \
		echo -n "<tr><td class=\"copyright\">Copyright:</td><td>" >> $(BUILDHTML); \
		[ -f $$dir/Copyright ] && cat $$dir/Copyright |sed "s/$$/<br>/g" >> $(BUILDHTML); \
		echo "</td></tr>" >> $(BUILDHTML); \
		echo -n "<tr><td class=\"url\">URL:</td><td>" >> $(BUILDHTML); \
		if [ -f $$dir/URL ]; then \
			echo "<a href=\"" >> $(BUILDHTML); \
			cat $$dir/URL >> $(BUILDHTML); \
			echo "\">" >> $(BUILDHTML); \
			cat $$dir/URL >> $(BUILDHTML); \
			echo "</a>" >> $(BUILDHTML); \
		fi; \
		echo "</td></tr>" >> $(BUILDHTML); \
	    fi; \
	done
	@echo "</table></center></body></html>" >> $(BUILDHTML)

lsbin:
	@ls -l dist/sbin dist/bin dist/usr/bin dist/usr/sbin |grep "^-" |sed -e "s/.\{33\}\(.\{10\}\).\{10\}/\1/"
