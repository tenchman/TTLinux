# $Id: arch.mk 1588 2009-04-01 18:50:56Z gernot $

ifeq ($(ARCH),i386)
  TTL_KERNELARCH=x86
else
  ifeq ($(ARCH),armeb)
    TTL_KERNELARCH=arm
  else
    TTL_KERNELARCH=$(ARCH)
  endif
endif

