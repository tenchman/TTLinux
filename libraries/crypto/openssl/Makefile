# $Id: Makefile 1803 2010-01-04 14:49:26Z gernot $

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

VERSION	    = 0.9.8k
NAME	    = openssl
FORMAT	    = tar.gz

PATCHES	    = patches/openssl-who_invented_such_a_bullshit.patch
ifeq ($(CONFIG_OPENSSL_KRB5),n)
PATCHES	   += patches/openssl-nokrb5.patch
endif
ifeq ($(CONFIG_OPENSSL_OCSP),n)
PATCHES	   += patches/openssl-noocsp.patch
endif
ifeq ($(CONFIG_OPENSSL_DES),n)
PATCHES	   += patches/openssl-nodes.patch
endif
ifeq ($(CONFIG_OPENSSL_PKCS12),n)
PATCHES	   += patches/openssl-nopkcs12.patch
endif
PATCHES	   += patches/openssl-ocf.patch
PATCHES    += patches/openssl-0.9.8i-tls_extensions.patch

DO_PREPARE  = $(STAMP)-myprepare
DO_POSTINST = $(STAMP)-mypostinstall
INSTALLARGS = INSTALL_PREFIX=$(TOPDIR)/tmp/$(NAME)-$(VERSION) install
STRIPPIT    = yes
CC         += -ffunction-sections -fdata-sections -I/opt/diet/include
ifeq ($(CONFIG_OPENSSL_ERR),n)
CC	+= -DOPENSSL_NO_ERR 
endif

ARGS	    = --prefix=$(PREFIX) --openssldir=/usr/share shared no-asm no-dso
# required for hostapd (EAP-FAST)
ARGS       += enable-tlsext
# normally "crypto fips ssl engines apps test tools"
DIRS        = crypto ssl
ifeq ($(CONFIG_OPENSSL_ENGINE),y)
  DIRS += engines
endif

# overwrite disabled options
ARGS_OPENVPN-$(CONFIG_OPENVPN_1) = true
ARGS_OPENVPN-$(CONFIG_OPENVPN_2) = true

ifeq ($(ARGS_OPENVPN-y),true)
override CONFIG_OPENSSL_DES   = y
override CONFIG_OPENSSL_DSA   = y
override CONFIG_OPENSSL_SSLV3 = y
override CONFIG_OPENSSL_TLS   = y
endif

ARGS-$(CONFIG_OPENSSL_AES)    += no-aes
ARGS-$(CONFIG_OPENSSL_BF)     += no-bf
ARGS-$(CONFIG_OPENSSL_CAST)   += no-cast
ARGS-$(CONFIG_OPENSSL_DES)    += no-des
ARGS-$(CONFIG_OPENSSL_DSA)    += no-dsa
ARGS-$(CONFIG_OPENSSL_RSA)    += no-rsa
ARGS-$(CONFIG_OPENSSL_ENGINE) += no-engine
ARGS-$(CONFIG_OPENSSL_ERR)    += no-err
ARGS-$(CONFIG_OPENSSL_HW)     += no-hw
ARGS-$(CONFIG_OPENSSL_IDEA)   += no-idea
ARGS-$(CONFIG_OPENSSL_KRB5)   += no-krb5
ARGS-$(CONFIG_OPENSSL_MD2)    += no-md2
ARGS-$(CONFIG_OPENSSL_MD4)    += no-md4
ARGS-$(CONFIG_OPENSSL_MD5)    += no-md5
ARGS-$(CONFIG_OPENSSL_MDC2)   += no-mdc2
ARGS-$(CONFIG_OPENSSL_OCSP)   += no-ocsp
ARGS-$(CONFIG_OPENSSL_RIPEMD) += no-ripemd
ARGS-$(CONFIG_OPENSSL_RC2)    += no-rc2
ARGS-$(CONFIG_OPENSSL_RC4)    += no-rc4
ARGS-$(CONFIG_OPENSSL_RC5)    += no-rc5
ARGS-$(CONFIG_OPENSSL_RMD160) += no-rmd160
ARGS-$(CONFIG_OPENSSL_SSLV2)  += no-ssl2
ARGS-$(CONFIG_OPENSSL_SSLV3)  += no-ssl3
ARGS-$(CONFIG_OPENSSL_THREADS)+= no-threads
ARGS-$(CONFIG_OPENSSL_TLS1)   += no-tls1
ARGS-$(CONFIG_OPENSSL_PKCS12) += no-pkcs12

ifeq ($(CONFIG_OPENSSL_OCF),y)
  ARGS += --with-cryptodev
endif

ARGS	   += $(ARGS-n)
ifeq ($(TTL_KERNELARCH),x86)
  ARGS     += linux-elf
else
  ARGS     += linux-elf-$(ARCH)
endif

FILES	    = .$(PREFIX)/lib-$(ARCH)/*.a
FILES	   += .$(PREFIX)/include/openssl/*

include $(TOPDIR)/rules.mk

$(STAMP)-myprepare:
	sed -i -e "s/^DIRS.*/DIRS=$(DIRS)/" $(PKGBUILDDIR)/Makefile.* \
	       -e "s/all install_docs/all/" $(PKGBUILDDIR)/Makefile.* \
	       -e "s,xxARCHCCxx,$(COMPILER)," $(PKGBUILDDIR)/util/domd \
	       -e "s,xxARCHCCxx,$(COMPILER)," $(PKGBUILDDIR)/Configure
	
	pushd $(PKGBUILDDIR); \
		perl util/perlpath.pl /usr/bin/perl; \
		./Configure $(ARGS); \
		make depend; \
	popd; \
	touch $@

$(STAMP)-mypostinstall:
	mv $(TMPDIR)$(PREFIX)/lib/* $(TMPDIR)$(PREFIX)/lib-$(ARCH)/
	touch $@
