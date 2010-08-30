# $Id:$

%define _unpackaged_files_terminate_build	1
%define _missing_doc_files_terminate_build	1

%define _version  0.9.7d
%define _realname openssl

Version:    %{_version}
Vendor:     Weight Patchers
Name:	    diet-%{_realname}
Release:    1
License:    BSDish
Group:	    System Environment/Libraries
URL:        http://www.openssl.org/
Summary:    The OpenSSL toolkit (dieted).
Packager:   Gernot Tenchio <gernot@tenchio.de>
Source:	    %{_realname}-%{_version}.tar.gz
Patch0:	    openssl-0.9.7a-diet.patch
Patch1:	    openssl-0.9.7a-nossl2.patch
Patch2:	    openssl-0.9.7d-nopkcs12.patch
Patch3:	    openssl-0.9.7d-malloc.patch
Buildroot:  /var/tmp/%{_realname}-root
Requires:   dietlibc >= 0.27

%description
The OpenSSL toolkit provides support for secure communications between
machines. OpenSSL includes a certificate management tool and shared
libraries which provide various cryptographic algorithms and
protocols.

%package devel
Group:	    Development/Libraries
Requires:   dietlibc-devel >= 0.27
Summary:    Files for development of applications which will use OpenSSL.
%description devel
OpenSSL is a toolkit for supporting cryptography. The openssl-devel
package contains static libraries and include files needed to develop
applications which support various cryptographic algorithms and
protocols.

%prep
%setup -q -n %{_realname}-%{version}
%patch0 -p1 -b .diet
%patch1 -p1 -b .nossl2
%patch2 -p1 -b .nopkcs12
%patch3 -p1 -b .malloc

perl -pi -e "s/apps test tools//" Makefile.*
perl -pi -e "s/all install_docs/all/" Makefile.*
perl -pi -e "s/-m486/-march=i486/g" Configure
perl util/perlpath.pl /usr/bin/perl

CC="i386-dietlibc-linux-gcc -fPIC" ./config \
  --prefix=/opt/diet \
  --openssldir=/usr/share no-asm no-dso 386 no-bf \
  no-cast no-engine no-err no-hw no-idea no-krb5 \
  no-md2 no-md4 no-mdc2 no-ocsp no-ripemd no-rc2 \
  no-rc5 no-rmd160 no-ssl2 no-threads no-pkcs12 shared

make CC="i386-dietlibc-linux-gcc -fPIC"

%install
rm -rf $RPM_BUILD_ROOT
make CC="i386-dietlibc-linux-gcc -fPIC" INSTALL_PREFIX=$RPM_BUILD_ROOT install
mv $RPM_BUILD_ROOT/opt/diet/lib $RPM_BUILD_ROOT/opt/diet/lib-i386
strip $RPM_BUILD_ROOT/opt/diet/lib-i386/lib*.so.*.*

%files
%doc LICENSE README* FAQ NEWS
/opt/diet/lib-i386/*.so.*

%files devel
/opt/diet/include/*
/opt/diet/lib-i386/*.a
/opt/diet/lib-i386/*.so
/opt/diet/lib-i386/pkgconfig/openssl.pc

%changelog
* Fri Sep 03 2004 Gernot Tenchio <g.tenchio@telco-tech.de>
- first build
