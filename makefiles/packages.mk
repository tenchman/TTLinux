#ifeq ($(CONFIG_DIETVER),)
#  CONFIG_DIETVER=stable
#endif
#SUBDIRS-$(CONFIG_DIETLIBC)	+= dietlibc/$(CONFIG_DIETVER)/stage1
#SUBDIRS-$(CONFIG_BINUTILS)	+= development/binutils
#SUBDIRS-$(CONFIG_GCC)		+= development/gcc
#SUBDIRS-$(CONFIG_GCC41)		+= development/gcc4.1
#SUBDIRS-$(CONFIG_GCC42)		+= development/gcc4.2
#SUBDIRS-$(CONFIG_DIETLIBC)	+= dietlibc/$(CONFIG_DIETVER)/stage2
#SUBDIRS-$(CONFIG_DIETLIBC)      += libraries/argp
SUBDIRS-y = toolchain libraries/argp

SUBDIRS-$(CONFIG_FDLIBM)	+= libraries/fdlibm

# ============================================================= #
# DEVELOPMENT					                #
# ============================================================= #
SUBDIRS-$(CONFIG_BISON)	    	+= development/bison
SUBDIRS-$(CONFIG_FLEX)	    	+= development/flex
SUBDIRS-$(CONFIG_INDENT)	+= development/indent
SUBDIRS-$(CONFIG_LUA)	    	+= development/lua
SUBDIRS-y                       += development/autoconf/2.13
SUBDIRS-y                       += development/autoconf/2.59
SUBDIRS-y                       += development/autoconf/2.6x
SUBDIRS-y                       += development/automake/1.4
SUBDIRS-y                       += development/automake/1.5
SUBDIRS-y                       += development/automake/1.9
SUBDIRS-y                       += development/automake/1.11
SUBDIRS-y                       += development/libtool/2.2
SUBDIRS-$(CONFIG_PKGCONFIG) 	+= apps/development/pkgconfig

SUBDIRS-$(CONFIG_MODUTILS)    	+= base/modutils
SUBDIRS-$(CONFIG_MODINIT)     	+= base/module-init-tools

SUBDIRS-$(CONFIG_KERNEL24)	+= kernel/2.4
SUBDIRS-$(CONFIG_KERNEL26)	+= libraries/ncurses
SUBDIRS-$(CONFIG_KERNEL26)	+= kernel/$(CONFIG_KERNELVER)
ifeq ($(CONFIG_LISS),y)
SUBDIRS-$(CONFIG_KERNEL26)	+= apps/text/mawk
ifeq ($(TTL_KERNELARCH), x86)
SUBDIRS-$(CONFIG_KERNEL26)	+= kernel/roswitch
endif
endif
SUBDIRS-$(CONFIG_TIME)          += apps/benchmark/time

# ============================================================= #
# LIBRARIES							#
# ============================================================= #
SUBDIRS-$(CONFIG_UDNS)          += libraries/udns
SUBDIRS-$(CONFIG_ADNS)          += libraries/adns
SUBDIRS-$(CONFIG_ZLIB)		+= libraries/archiving/zlib
SUBDIRS-$(CONFIG_LIBTAR)	+= libraries/archiving/libtar
SUBDIRS-$(CONFIG_LIBLZO)	+= libraries/archiving/liblzo # needed by openvpn

SUBDIRS-$(CONFIG_LIBUSB)	+= libraries/libusb
SUBDIRS-$(CONFIG_LIBUSB)	+= libraries/libusb-compat
SUBDIRS-$(CONFIG_LIBUTF8)	+= libraries/libutf8
SUBDIRS-$(CONFIG_LIBICONV)	+= libraries/libiconv
SUBDIRS-$(CONFIG_SKALIBS)	+= libraries/skalibs
SUBDIRS-$(CONFIG_LIBPNG)	+= libraries/libpng
SUBDIRS-$(CONFIG_T1LIB)		+= libraries/t1lib
SUBDIRS-$(CONFIG_LIBJPEG)	+= libraries/libjpeg
SUBDIRS-$(CONFIG_LIBOWFAT)	+= libraries/libowfat
SUBDIRS-$(CONFIG_LIBPCAP)	+= libraries/libpcap
SUBDIRS-$(CONFIG_LIBGT)		+= libraries/libgt
SUBDIRS-$(CONFIG_LIBTERMCAP)	+= libraries/libtermcap
SUBDIRS-$(CONFIG_LIBEDIT)	+= libraries/libedit
SUBDIRS-$(CONFIG_LIBEVENT)	+= libraries/libevent
#SUBDIRS-$(CONFIG_LIBEVENT)	+= libraries/libevent2
SUBDIRS-$(CONFIG_LIBEV)		+= libraries/libev
SUBDIRS-$(CONFIG_LIBELF)	+= libraries/libelf
SUBDIRS-$(CONFIG_LIBPOPT)	+= libraries/libpopt
SUBDIRS-$(CONFIG_LIBRIPMIME)	+= libraries/libripmime
SUBDIRS-$(CONFIG_NCURSES)	+= libraries/ncurses
SUBDIRS-$(CONFIG_MM)		+= libraries/mm
SUBDIRS-$(CONFIG_EX)		+= libraries/ex
SUBDIRS-$(CONFIG_PTH)		+= libraries/devel/pth
SUBDIRS-$(CONFIG_PCL)		+= libraries/devel/pcl
SUBDIRS-$(CONFIG_GLIB2)		+= libraries/glib2
SUBDIRS-$(CONFIG_EVENTLOG)      += libraries/eventlog
SUBDIRS-$(CONFIG_LIBCOMERR)     += libraries/libcom_err
SUBDIRS-$(CONFIG_SQUID3)        += libraries/libecap

SUBDIRS-$(CONFIG_LIBDB41)	+= libraries/database/db-4.1
SUBDIRS-$(CONFIG_QDBM)		+= libraries/database/qdbm
SUBDIRS-$(CONFIG_SQLITE_2)	+= libraries/database/sqlite2
SUBDIRS-$(CONFIG_SQLITE_3)	+= libraries/database/sqlite3
SUBDIRS-$(CONFIG_DYNDB)         += libraries/database/dyndb

SUBDIRS-$(CONFIG_PCRE)		+= libraries/pcre
SUBDIRS-$(CONFIG_TRE)		+= libraries/tre
SUBDIRS-$(CONFIG_GMP)		+= libraries/gmp
SUBDIRS-$(CONFIG_GNUMALLOC)	+= libraries/libgnumalloc
SUBDIRS-$(CONFIG_LOCKDEV)   	+= libraries/lockdev
SUBDIRS-$(CONFIG_LIBGPG_ERROR)	+= libraries/libgpg-error
SUBDIRS-$(CONFIG_LIBTASN1)	+= libraries/libtasn1

SUBDIRS-$(CONFIG_MATRIXSSL)	+= libraries/crypto/matrixssl
SUBDIRS-$(CONFIG_OPENSSL)	+= libraries/crypto/openssl
SUBDIRS-$(CONFIG_LIBGCRYPT)	+= libraries/crypto/libgcrypt
SUBDIRS-$(CONFIG_GNUTLS)	+= libraries/crypto/gnutls
SUBDIRS-$(CONFIG_LIBTOMCRYPT)	+= libraries/crypto/libtomcrypt
SUBDIRS-$(CONFIG_KERBEROS5)     += libraries/crypto/krb5
SUBDIRS-$(CONFIG_POLARSSL)      += libraries/crypto/polarssl
SUBDIRS-$(CONFIG_CYASSL)        += libraries/crypto/cyassl
SUBDIRS-$(CONFIG_AXTLS)         += libraries/crypto/axTLS
SUBDIRS-$(CONFIG_TINYLDAP)	+= libraries/tinyldap

SUBDIRS-$(CONFIG_EXPAT)         += libraries/expat
SUBDIRS-$(CONFIG_SABLOTRON)     += libraries/sablotron
SUBDIRS-$(CONFIG_LIBSPF)        += libraries/libspf
SUBDIRS-$(CONFIG_LIBSPF2)       += libraries/libspf2
SUBDIRS-$(CONFIG_LIBSRS2)       += libraries/libsrs2
SUBDIRS-$(CONFIG_DBUS)          += libraries/dbus

SUBDIRS-$(CONFIG_FREETYPE)      += libraries/freetype
SUBDIRS-$(CONFIG_FONTCONFIG)    += libraries/media/fontconfig
SUBDIRS-$(CONFIG_PIXMAN)        += libraries/media/pixman
SUBDIRS-$(CONFIG_CAIRO)         += libraries/media/cairo
SUBDIRS-$(CONFIG_PANGO)         += libraries/media/pango

SUBDIRS-$(CONFIG_OPENPAM)	+= libraries/openpam
SUBDIRS-$(CONFIG_OPENLDAP)	+= libraries/openldap

SUBDIRS-$(CONFIG_LIBNFNETLINK) 		  += libraries/netfilter/libnfnetlink
SUBDIRS-$(CONFIG_LIBNETFILTER_CONNTRACK)  += libraries/netfilter/libnetfilter_conntrack
SUBDIRS-$(CONFIG_LIBNFNETLINK_QUEUE) 	  += libraries/netfilter/libnetfilter_queue
SUBDIRS-$(CONFIG_LIBNFNETLINK_LOG) 	  += libraries/netfilter/libnetfilter_log
SUBDIRS-$(CONFIG_LIBNL) 	  	  += libraries/libnl

SUBDIRS-$(CONFIG_LIBRSYNC)	+= libraries/librsync
SUBDIRS-$(CONFIG_LIBART_LGPL)   += libraries/libart_lgpl
SUBDIRS-$(CONFIG_LIBDAEMON)     += libraries/libdaemon


SUBDIRS-$(CONFIG_E2FSPROGS)      += apps/sys-fs/e2fsprogs
SUBDIRS-$(CONFIG_INOTIFY_TOOLS)  += apps/sys-fs/inotify-tools
SUBDIRS-$(CONFIG_DRBD)	         += apps/sys-fs/drbd
SUBDIRS-$(CONFIG_OCFS2)	         += apps/sys-fs/ocfs2

# ============================================================= #
# PROGRAMS							#
# ============================================================= #
SUBDIRS-$(CONFIG_SYSVINIT)    += base/sysvinit
SUBDIRS-$(CONFIG_MINIT)	      += base/minit
SUBDIRS-$(CONFIG_UDEV)	      += base/udev
SUBDIRS-$(CONFIG_GPM)	      += base/gpm
SUBDIRS-$(CONFIG_RADVD)	      += base/radvd
SUBDIRS-$(CONFIG_PROCPS)      += base/procps
SUBDIRS-$(CONFIG_COREUTILS)   += base/coreutils
SUBDIRS-$(CONFIG_UTIL_LINUX)  += base/util-linux
SUBDIRS-$(CONFIG_UTIL_LINUXNG)+= apps/sys/util-linux-ng
SUBDIRS-$(CONFIG_BRIDGEUTILS) += base/bridge-utils
SUBDIRS-$(CONFIG_VLAN)        += base/vlan
SUBDIRS-$(CONFIG_BUSYBOX)     += base/busybox
SUBDIRS-$(CONFIG_ATTR)	      += base/attr
SUBDIRS-$(CONFIG_ATTR)        += base/acl
SUBDIRS-$(CONFIG_LIBCAP)        += libraries/libcap
SUBDIRS-$(CONFIG_MIITOOL)     += base/mii-tool
SUBDIRS-$(CONFIG_CRON)	      += base/vixie-cron
SUBDIRS-$(CONFIG_CRON)	      += base/dcron
SUBDIRS-$(CONFIG_CHECKPASSWORD)+= base/checkpassword
SUBDIRS-$(CONFIG_MGETTY)      += base/mgetty
SUBDIRS-$(CONFIG_FGETTY)      += base/fgetty
SUBDIRS-$(CONFIG_RDATE)	      += base/rdate
SUBDIRS-$(CONFIG_SYSKLOGD)    += base/sysklogd
SUBDIRS-$(CONFIG_SOCKLOG)     += base/socklog
SUBDIRS-$(CONFIG_RUNIT)       += base/runit
SUBDIRS-$(CONFIG_GSCLU)	      += base/gsclu
SUBDIRS-$(CONFIG_DAEMONTOOLS) += base/daemontools
SUBDIRS-$(CONFIG_IPROUTE)     += base/iproute
SUBDIRS-$(CONFIG_IPUTILS)     += base/iputils
SUBDIRS-$(CONFIG_USBUTILS)    += apps/system/usbutils
SUBDIRS-$(CONFIG_TRACEROUTE)  += apps/net/traceroute
SUBDIRS-$(CONFIG_IFPLUGD)     += apps/net/ifplugd
SUBDIRS-$(CONFIG_UCARPCTL)    += apps/net/ucarpctl
SUBDIRS-$(CONFIG_UCARP)       += apps/net/ucarp

SUBDIRS-$(CONFIG_AESCRYPT)       += apps/crypto/aescrypt
SUBDIRS-$(CONFIG_AESCRYPT2)      += apps/crypto/aescrypt2
SUBDIRS-$(CONFIG_STRACE)	 += apps/debugging/strace
# =========================================================================
# APPS -> ARCHIVING
# =========================================================================
SUBDIRS-$(CONFIG_TAR)	      	    += apps/archiving/tar
SUBDIRS-$(CONFIG_PIGZ)	      	    += apps/archiving/pigz
SUBDIRS-$(CONFIG_BZIP2)	            += apps/archiving/bzip2
SUBDIRS-$(CONFIG_LZMA)		    += apps/archiving/lzma

# =========================================================================
# APPS -> ANTIVIRUS
# =========================================================================
SUBDIRS-$(CONFIG_CLAMAV)            += apps/antivirus/clamav
SUBDIRS-$(CONFIG_HAVP)              += apps/antivirus/havp

# =========================================================================
# APPS -> FIREWALL
# =========================================================================
SUBDIRS-$(CONFIG_IPTABLES)          += apps/firewall/iptables
SUBDIRS-$(CONFIG_EBTABLES)          += apps/firewall/ebtables
SUBDIRS-$(CONFIG_CONNTRACKD)        += apps/firewall/conntrackd
SUBDIRS-$(CONFIG_CONNTRACKTOOLS)    += apps/firewall/conntrack-tools

# =========================================================================
# APPS -> STATISTICS
# =========================================================================
SUBDIRS-$(CONFIG_RRDTOOL)           += apps/statistics/rrdtool
SUBDIRS-$(CONFIG_LM_SENSORS)        += apps/statistics/lm_sensors
SUBDIRS-$(CONFIG_HDDTEMP)           += apps/statistics/hddtemp
SUBDIRS-$(CONFIG_COLLECTD)          += apps/statistics/collectd

# =========================================================================
# APPS -> INTERNET
# =========================================================================
SUBDIRS-$(CONFIG_CURL)              += apps/internet/curl
SUBDIRS-$(CONFIG_HPING2)            += apps/internet/hping2
SUBDIRS-$(CONFIG_SQUID)             += apps/internet/squid
SUBDIRS-$(CONFIG_SQUID3)            += apps/internet/squid30
SUBDIRS-$(CONFIG_SQUID3)            += apps/internet/squid32
SUBDIRS-$(CONFIG_C_ICAP)            += apps/internet/c_icap
SUBDIRS-$(CONFIG_TINYPROXY)         += apps/internet/tinyproxy
SUBDIRS-$(CONFIG_TINYPROXY_EX)      += apps/internet/tinyproxy-ex
SUBDIRS-$(CONFIG_FTPPROXY)          += apps/internet/ftpproxy
SUBDIRS-$(CONFIG_MINI_HTTPD)        += apps/internet/mini_httpd
SUBDIRS-$(CONFIG_MATHOPD)           += apps/internet/mathopd
SUBDIRS-$(CONFIG_THTTPD)            += apps/internet/thttpd
SUBDIRS-$(CONFIG_LIGHTTPD)          += apps/internet/lighttpd
SUBDIRS-$(CONFIG_HTTPAUTH)          += apps/internet/httpauth
SUBDIRS-$(CONFIG_HTTPTUNNEL)        += apps/internet/httptunnel
SUBDIRS-$(CONFIG_GNUHTTPTUNNEL)     += apps/internet/gnu-httptunnel
SUBDIRS-$(CONFIG_FNORD)             += apps/internet/fnord
SUBDIRS-$(CONFIG_NGINX)             += apps/internet/nginx
SUBDIRS-$(CONFIG_OPENNTPD)          += apps/internet/openntpd
SUBDIRS-$(CONFIG_IPSVD)             += apps/internet/ipsvd

SUBDIRS-$(CONFIG_CACERTIFICATES)    += apps/internet/ca-certificates

SUBDIRS-$(CONFIG_E3)	            += apps/editors/e3
SUBDIRS-$(CONFIG_VIM)	            += apps/editors/vim

SUBDIRS-$(CONFIG_ETHTOOL)           += apps/sys/ethtool
SUBDIRS-$(CONFIG_DMIDECODE)         += apps/sys/dmidecode
SUBDIRS-$(CONFIG_HDPARM)            += apps/sys/hdparm
SUBDIRS-$(CONFIG_SMARTMONTOOLS)     += apps/sys/smartmontools
SUBDIRS-$(CONFIG_PCIUTILS)          += apps/sys/pciutils
SUBDIRS-$(CONFIG_SYSFSUTILS)        += apps/sys/sysfsutils
SUBDIRS-$(CONFIG_SYSLOG_NG)         += libraries/eventlog
SUBDIRS-$(CONFIG_SYSLOG_NG)         += apps/sys/syslog-ng
SUBDIRS-$(CONFIG_HTOP)              += apps/sys/htop

SUBDIRS-$(CONFIG_CUPS)              += apps/cups

# =========================================================================
# APPS -> NET
# =========================================================================
SUBDIRS-$(CONFIG_PPP)	            += apps/net/ppp
SUBDIRS-$(CONFIG_PPTP)	            += apps/net/pptp
SUBDIRS-$(CONFIG_KEEPALIVED)        += apps/net/keepalived
SUBDIRS-$(CONFIG_CSYNC2)            += apps/net/csync2
SUBDIRS-$(CONFIG_RSYNC)             += apps/net/rsync
SUBDIRS-$(CONFIG_CAPI4K)            += apps/net/capi4k-utils
SUBDIRS-$(CONFIG_SAMBA)             += apps/net/samba
SUBDIRS-$(CONFIG_NET_SNMP)          += apps/net/net-snmp
SUBDIRS-$(CONFIG_WAKELAN)           += apps/net/wakelan
SUBDIRS-$(CONFIG_DROPBEAR)          += apps/net/dropbear
SUBDIRS-$(CONFIG_HOSTAPD)           += apps/net/wireless/hostapd
SUBDIRS-$(CONFIG_WPA_SUPPLICANT)    += apps/net/wireless/wpa_supplicant
SUBDIRS-$(CONFIG_IW)                += apps/net/wireless/iw
SUBDIRS-$(CONFIG_RFKILL)            += apps/net/wireless/rfkill

# =========================================================================
# APPS -> NET-ANALYZER
# =========================================================================
SUBDIRS-$(CONFIG_SNORT)             += apps/net-analyzer/snort
SUBDIRS-$(CONFIG_PORTSENTRY)        += apps/net-analyzer/portsentry
SUBDIRS-$(CONFIG_NETCAT)            += apps/net-analyzer/netcat
SUBDIRS-$(CONFIG_TCPDUMP)           += apps/net-analyzer/tcpdump
SUBDIRS-$(CONFIG_YWS)               += apps/net-analyzer/yws

# =========================================================================
# APPS -> DEVELOPMENT
# =========================================================================
SUBDIRS-$(CONFIG_CVSTRAC) 	+= apps/development/cvstrac
SUBDIRS-$(CONFIG_SVNTRAC) 	+= apps/development/svntrac

# =========================================================================
# APPS -> TEXT
# =========================================================================
SUBDIRS-$(CONFIG_MAWK)	      += apps/text/mawk
SUBDIRS-$(CONFIG_GREP)	      += apps/text/grep
SUBDIRS-$(CONFIG_SED)	      += apps/text/sed
SUBDIRS-$(CONFIG_MINISED)     += apps/text/minised
SUBDIRS-$(CONFIG_PSTOTEXT)    += apps/text/pstotext

# =========================================================================
# APPS -> MAIL
# =========================================================================
SUBDIRS-$(CONFIG_QMAIL)       += apps/mail/qmail
SUBDIRS-$(CONFIG_NETQMAIL)    += apps/mail/netqmail
SUBDIRS-$(CONFIG_DOVECOT)     += apps/mail/dovecot
SUBDIRS-$(CONFIG_SAUCER)      += apps/mail/saucer
SUBDIRS-$(CONFIG_RIPMIME)     += apps/mail/ripmime
SUBDIRS-$(CONFIG_BOGOFILTER)  += apps/mail/bogofilter
SUBDIRS-$(CONFIG_QSF)         += apps/mail/qsf
SUBDIRS-$(CONFIG_MAILDROP)    += apps/mail/maildrop
SUBDIRS-$(CONFIG_RBLCHECK)    += apps/mail/rblcheck
SUBDIRS-$(CONFIG_GREYLISTING) += apps/mail/greylisting-spp
SUBDIRS-$(CONFIG_P3SCAN)      += apps/mail/p3scan

# =========================================================================
# APPS -> DNS/DHCP
# =========================================================================
SUBDIRS-$(CONFIG_EZ_IPUPDATE) += apps/dns/ez-ipupdate
SUBDIRS-$(CONFIG_DJBDNS)      += apps/dns/zinq-djbdns
SUBDIRS-$(CONFIG_DHCP_FWD)    += apps/dns/dhcp-forwarder
SUBDIRS-$(CONFIG_DNSMASQ)     += apps/dns/dnsmasq
SUBDIRS-$(CONFIG_ISC_DHCP)    += apps/net/isc-dhcp

# =========================================================================
# APPS -> VPN
# =========================================================================
SUBDIRS-$(CONFIG_OPENVPN_1)   += apps/vpn/openvpn-1.x
SUBDIRS-$(CONFIG_OPENVPN_20)  += apps/vpn/openvpn-2.0
SUBDIRS-$(CONFIG_OPENVPN_21)  += apps/vpn/openvpn-2.1
SUBDIRS-$(CONFIG_OPENSWAN)    += apps/vpn/openswan
SUBDIRS-$(CONFIG_OPENSWAN_26) += apps/vpn/openswan-2.6
SUBDIRS-$(CONFIG_OPENSWAN_3)  += apps/vpn/openswan-3.x
SUBDIRS-$(CONFIG_IPSEC_TOOLS) += apps/vpn/ipsec-tools
SUBDIRS-$(CONFIG_STRONGSWAN_2)+= apps/vpn/strongswan-2.x
SUBDIRS-$(CONFIG_STRONGSWAN_4)+= apps/vpn/strongswan-4.x
SUBDIRS-$(CONFIG_RNG_TOOLS)   += apps/vpn/rng-tools

# =========================================================================
SUBDIRS-$(CONFIG_NETPBM)      += apps/multimedia/netpbm
SUBDIRS-$(CONFIG_GOCR)        += apps/multimedia/gocr
SUBDIRS-$(CONFIG_OCRAD)       += apps/multimedia/ocrad
SUBDIRS-$(CONFIG_IMAGEMAGICK) += apps/multimedia/imagemagick

SUBDIRS-$(CONFIG_NSM)	      += apps/crap/nsm
SUBDIRS-$(CONFIG_UCSPI_TCP)   += base/ucspi-tcp
ifeq ($(TTL_KERNELARCH), x86)
SUBDIRS-$(CONFIG_LILO)	      += base/lilo
endif

SUBDIRS-$(CONFIG_MINIGUI)   += gui/libminigui gui/minigui-res gui/mde
SUBDIRS-$(CONFIG_XYNTH)     += gui/xynth
SUBDIRS-$(CONFIG_XORG_X11)  += gui/xorg-x11

