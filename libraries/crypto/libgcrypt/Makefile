# $Id: Makefile 1309 2008-03-17 23:59:09Z gernot $

include $(TOPDIR)/.config
include $(TOPDIR)/$(ARCH).config

VERSION	    = 1.2.2
NAME	    = libgcrypt
FORMAT	    = tar.gz
CFLAGS      = $(CFLAGS_S)

DO_PREPARE  = $(STAMP)-prepare
PREFIX	    = /opt/diet

FILES	    = /opt/diet/lib-$(ARCH)
FILES	   += /opt/diet/include

ifeq ($(CONFIG_GNUTLS),y)
# CONFIG_LIBGCRYPT_DIGEST_MD4 := y
# CONFIG_LIBGCRYPT_CIPHERS_SERPENT := y
endif

DIGEST-y = md5
DIGEST-$(CONFIG_LIBGCRYPT_DIGEST_CRC)     := $(DIGETS-$(CONFIG_LIBGCRYPT_DIGEST_CRC)),crc
DIGEST-$(CONFIG_LIBGCRYPT_DIGEST_MD4)     := $(DIGEST-$(CONFIG_LIBGCRYPT_DIGEST_MD4)),md4
DIGEST-$(CONFIG_LIBGCRYPT_DIGEST_SHA256)  := $(DIGEST-$(CONFIG_LIBGCRYPT_DIGEST_SHA256)),sha256
DIGEST-$(CONFIG_LIBGCRYPT_DIGEST_SHA512)  := $(DIGEST-$(CONFIG_LIBGCRYPT_DIGEST_SHA512)),sha512

PUBKEY-y = dsa
PUBKEY-$(CONFIG_LIBGCRYPT_PUBKEY_ELGAMAL) := $(PUBKEY-$(CONFIG_LIBGCRYPT_PUBKEY_ELGAMAL)),elgamal
PUBKEY-$(CONFIG_LIBGCRYPT_PUBKEY_RSA)     := $(PUBKEY-$(CONFIG_LIBGCRYPT_PUBKEY_RSA)),rsa

CIPHERS-y = des
CIPHERS-$(CONFIG_LIBGCRYPT_CIPHERS_ARCFOUR)  := $(CIPHERS-$(CONFIG_LIBGCRYPT_CIPHERS_ARCFOUR)),arcfour
CIPHERS-$(CONFIG_LIBGCRYPT_CIPHERS_BLOWFISH) := $(CIPHERS-$(CONFIG_LIBGCRYPT_CIPHERS_BLOWFISH)),blowfish
CIPHERS-$(CONFIG_LIBGCRYPT_CIPHERS_CAST5)    := $(CIPHERS-$(CONFIG_LIBGCRYPT_CIPHERS_CAST5)),cast5
CIPHERS-$(CONFIG_LIBGCRYPT_CIPHERS_AES)      := $(CIPHERS-$(CONFIG_LIBGCRYPT_CIPHERS_AES)),aes
CIPHERS-$(CONFIG_LIBGCRYPT_CIPHERS_TWOFISH)  := $(CIPHERS-$(CONFIG_LIBGCRYPT_CIPHERS_TWOFISH)),twofish
CIPHERS-$(CONFIG_LIBGCRYPT_CIPHERS_SERPENT)  := $(CIPHERS-$(CONFIG_LIBGCRYPT_CIPHERS_SERPENT)),serpent
CIPHERS-$(CONFIG_LIBGCRYPT_CIPHERS_RFC2268)  := $(CIPHERS-$(CONFIG_LIBGCRYPT_CIPHERS_RFC2268)),rfc2268

ARGS += --enable-digests=$(DIGEST-y)
ARGS += --enable-pubkey-ciphers=$(PUBKEY-y)
ARGS += --enable-ciphers=$(CIPHERS-y)

include $(TOPDIR)/rules.mk
