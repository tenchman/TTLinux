DIETLIBCPATCHES	    = dietlibc-features.patch
# remove the most annoying things when compiling/linking against dietlibc
# and add some defines like __KERNEL_STRICT_NAMES, _BSD_SOURCE
DIETLIBCPATCHES	   += dietlibc-features_h.patch
DIETLIBCPATCHES	   += dietlibc-misc.patch
DIETLIBCPATCHES    += dietlibc-gcc4.patch

# add get_kernel_syms syscall
#   needed by sysklogd-1.4.1/ksym_mod.c 
# add madvise, bdflush, munlock syscall
#   needed by busybox 
DIETLIBCPATCHES	   += dietlibc-syscall.patch
DIETLIBCPATCHES	   += dietlibc-install.patch

# add struct icmp
#   needed at least by busybox and iproute (OK, I know it's BSD)
# add missing headers,
#   linux/errqueue.h : needed by openswan
#   linux/sockios.h :  needed by ethtool
#   linux/filter.h :   needed by pppd
#   linux/netlink.h :  needed by dnsmasq(udev)
#   linux/rtnetlink.h: needed by dnsmasq(udev)
#   sys/queue.h :      needed by bsnmp
#   sys/user.h :       needed by binutils, strace
#   linux/if_packet.h: needed by dhcp-forwarder
#   linux/fb.h,
#   linux/vt.h,sys/vt.h
#   linux/tty.h,
#   linux/keyboard.h : needed by minigui
#   fpu_control.h :    needed by xorg-x11
#   asm/byteorder.h
#   linux/random.h :   needed by rng-tools

DIETLIBCPATCHES	   += dietlibc-header.patch
# add various TCPOPT_ macros to netinet/tcp.h
DIETLIBCPATCHES    += dietlibc-tcpopt.patch
# provide __bswap_XX macros
DIETLIBCPATCHES	   += dietlibc-byteswap.patch
# finitef 
DIETLIBCPATCHES	   += dietlibc-math.patch
# cpu_set_t (for htop-0.7), remove undefined functions 
DIETLIBCPATCHES    += dietlibc-sched.patch

DIETLIBCPATCHES	   += dietlibc-netdb.patch
DIETLIBCPATCHES    += dietlibc-timed.patch

DIETLIBCPATCHES    += dietlibc-ldconf.patch

# support ^ in matching code
DIETLIBCPATCHES	   += dietlibc-0.27-fnmatch.patch

# add an #ifdef SYSLOG_NAMES, can't remember why
# remove the annoying openlog warning
DIETLIBCPATCHES    += dietlibc-syslog.patch

# fixes some missing defines in netinet/in.h
DIETLIBCPATCHES    += dietlibc-in_h.patch

# fix scanf with length modifiers for integers
DIETLIBCPATCHES    += dietlibc-scanf.patch

# add support for %n, %g, %e to printf
ifneq ($(CONFIG_DIETLIBC_PREFER_SIZE),y)
DIETLIBCPATCHES	   += dietlibc-printf.patch
endif
DIETLIBCPATCHES    += dietlibc-cplusplus.patch
# DIETLIBCPATCHES    += dietlibc-widechar.patch

# add netinet/ip6.h, netinet/icmp6.h
# TODO: header only
DIETLIBCPATCHES    += dietlibc-0.28-ipv6.patch

DIETLIBCPATCHES    += dietlibc-gnuregex.patch
DIETLIBCPATCHES    += dietlibc-0.28-search.patch
DIETLIBCPATCHES    += dietlibc-0.28-dn_skipname.patch
DIETLIBCPATCHES    += dietlibc-0.28-dlerror.patch
DIETLIBCPATCHES    += dietlibc-frameinfo.patch

DIETLIBCPATCHES    += dietlibc-gettext.patch

DIETLIBCPATCHES    += dietlibc-gethostbyx.patch

# remove the #define _LINUX_SOCKET_ because it breaks compilation of
# iptables/libnfnetlink and friends
DIETLIBCPATCHES    += dietlibc-kernel.patch

# some additional defines (needed by at least libspf2)
DIETLIBCPATCHES    += dietlibc-nameser.patch
# ipv6 resolver fixes
DIETLIBCPATCHES    += dietlibc-res6.patch
# ignore the RD bit in answers
# DIETLIBCPATCHES    += dietlibc-norecursive.patch
# adds nftw() needed by getfattr
DIETLIBCPATCHES    += dietlibc-ftw.patch
# define ENOATTR for libacl
DIETLIBCPATCHES    += dietlibc-xattr.patch

DIETLIBCPATCHES    += dietlibc-valgrind.patch
# remove the assember version of strnlen (valgrind does'nt like it)
DIETLIBCPATCHES    += dietlibc-strnlen.patch
# terminate the string with '\0' not '\n'
DIETLIBCPATCHES    += dietlibc-asctime_r.patch

# * define the symbols data_start and __data_start in start.S (needed at
#   least by the boehm gc)
# * add .size to setjmp.S
DIETLIBCPATCHES    += dietlibc-i386asm.patch

ifeq ($(CONFIG_DIETLIBC_DEBUG),y)
DIETLIBCPATCHES    += dietlibc-debug.patch
endif
#### fixed? DIETLIBCPATCHES    += dietlibc-libdl.patch
DIETLIBCPATCHES    += dietlibc-dlclose.patch
# PATCHES    += dietlibc-gnuhash.patch
# dietlibc-if_arp.patch, add some ARPHRD_xxx defines, needed by dnsmasq
DIETLIBCPATCHES    += dietlibc-if_arp.patch

# start TODO
DIETLIBCPATCHES    += dietlibc-armdyn.patch
DIETLIBCPATCHES    += dietlibc-armselect.patch
DIETLIBCPATCHES    += dietlibc-armasm.patch
DIETLIBCPATCHES    += dietlibc-thumb.patch
DIETLIBCPATCHES    += dietlibc-armstack.patch
# end TODO

# fopen64, fopen64_unlocked
DIETLIBCPATCHES    += dietlibc-io64.patch

DIETLIBCPATCHES    += dietlibc-memalign.patch
# make realloc(NULL, 0) glibc compatible (i.e. return NONNULL if
# WANT_MALLOC_ZERO is defined in dietfeatures.h)
DIETLIBCPATCHES    += dietlibc-realloc.patch
# DIETLIBCPATCHES    += dietlibc-iosubsys.patch
#######################################################
# attempt to make dietlibc more threadsafe
DIETLIBCPATCHES    += dietlibc-threadsafe_dirent.patch
DIETLIBCPATCHES    += dietlibc-threadsafe_write.patch

DIETLIBCPATCHES    += dietlibc-maplib.patch
DIETLIBCPATCHES    += dietlibc-environ.patch
DIETLIBCPATCHES    += dietlibc-alignment.patch

# fix return types for recv/send style functions
DIETLIBCPATCHES    += dietlibc-socktypes.patch
