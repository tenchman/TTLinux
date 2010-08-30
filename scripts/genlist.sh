DIRS="ash \
  blackhole \
  bridge-utils \
  busybox \
  clamav \
  curl \
  daemontools \
  db4 \
  dhcp \
  dietlibc \
  djbdns \
  dnsmasq \
  dropbear \
  e2fsprogs \
  ez-ipupdate \
  iproute \
  iptables \
  iputils \
  kernel \
  libevent \
  libpng \
  matrixssl \
  mawk \
  mgetty \
  mm \
  net-snmp \
  nsm \
  openssl \
  pcre \
  pptp \
  qmail \
  rdate \
  squid \
  sysklogd \
  sysvinit \
  ucspi-tcp \
  uucp \
  zlib"

body () {
  BODY="$BODY $1"
}

index () {
  INDEX="$INDEX $1"
}

notfound () {
  echo "file $1 not found" >&2
}

CLASS="odd"

index "<ul>\n"
for dir in $DIRS; do

  if [ ! -d $dir ]; then
  
    echo "!!!! $dir not found!!!!"
  
  else
  
    VERSION="`awk '{ if ($1 ~ /^VERSION$/ ) print $3 }' $dir/Makefile`"
    PATCHES="`awk -F= '{ if ($1 ~ /^PATCHES/ ) print $2 }' $dir/Makefile`"
    
    if [ "$CLASS" = "odd" ]; then
      CLASS="even"
    else
      CLASS="odd"
    fi

    index "<li class=\"$CLASS\"><a href=\"#$dir\">$dir</a>"
    if [ -f $dir/Summary ]; then
      SUM=`cat $dir/Summary`
      index " -- $SUM"
    else
      notfound "$dir/Summary"
    fi
    index "</li>\n"

    body "<a name=\"$dir\"></a>\n"
    body "<h3>$dir</h3>\n"
    body "<div class=\"descr\">\n"
    body "<ul>\n"
    
    # ==== VERSION ====
    body "<li>Version: $VERSION</li>\n"

    # ==== HOMEPAGE ====
    body "<li>URL: "
    if [ -f $dir/URL ]; then
      URL=`cat $dir/URL`
      if [ "$URL" != "none" ]; then
	body "<a class=\"extern\" href=\"$URL\">$URL</a>"
      else
	body "$URL"
      fi
    else
      notfound "$dir/URL"
      body "unknown"
    fi
    body "</li>\n"
    
    # ==== LICENSE ====
    body "<li>License: "
    if [ -f $dir/License ]; then
      LICENSE="`cat $dir/License`"
      case $LICENSE in
	GPL)
	  LICENSE="<a class="extern" href=\"http://www.opensource.org/licenses/gpl-license.php\">$LICENSE</a>" ;;
	MIT*)
	  LICENSE="<a class="extern" href=\"http://www.opensource.org/licenses/mit-license.php\">$LICENSE</a>" ;;
	BSD*)
	  LICENSE="<a class="extern" href=\"http://www.opensource.org/licenses/bsd-license.php\">$LICENSE</a>" ;;
      esac
      body "$LICENSE"
    else
      notfound "$dir/License"
      body "unknown"
    fi
    body "</li>\n"
    
    # ==== COPYRIGHT ====
    if [ -f $dir/Copyright ]; then
      COPY="`cat $dir/Copyright|sed -e \"s/^\(.*\)$/<li>\1<\/li>/\"`"
      body "$COPY"
    else
      notfound "$dir/Copyright"
    fi

    # ==== PATCHES ====
    body "<li>Patches: "
    if [ "$PATCHES" = "" ]; then
      body "none\n";
    else
      body "\n <ul>\n"
      for patch in $PATCHES; do
	if [ -f $dir/$patch ]; then
	  SUM=`md5sum $dir/$patch|awk '{print $1}'`
	  body "\t<li><tt>$SUM:</tt> <a href=\"$dir/$patch\">$patch</a></li>\n"
	else
	  notfound "$dir/$patch"
	fi
      done
      body "</ul>\n"
    fi
    body "</li>\n"
    body "</ul>\n"
    body "</div>\n"
  fi

done
index "</ul>\n"

LISS="<a href=\"http://www.liss.de/\">LiSS</a>"
TTT="TELCO TECH"
TTL="<a href=\"http://www.telco-tech.com\">$TTT</a>"

cat <<EOF
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
     "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
  <title>OSS shipped by TELCO TECH</title>
  <link rel="stylesheet" type="text/css" href="oss.css">
</head>
<body>
<h1>Open Source Software shipped by ${TTT}</h1>
<p>
${LISS} is shipped with a lot of programs, not all licensed under the same
license (e.g. GNU GPL). ${LISS} contains free software whose distribution
conditions comply with the
<a class="extern" href="http://www.opensource.org/docs/definition.php">
Open Source Definition</a>. Here you will find software shipped with our
products. Note that not all packages are included in all our firmware
versions. (e.g. clamav/smtpd are only included in the "PRO" versions).
Dropbear for instance isn't included at all.
</p>
<p>
Most of these packages are prepared to cleanly build and link against
dietlibc. Where applicable, help and/or debugging messages are disabled
or removed since nobody would ever see them. :-)
</p>
<p>
<b>External Links Disclaimer:</b>
Clicking links marked with an "right arrow" (<img src="right.gif" alt="->">)
will take the reader off the $TTL website. ${TTL} is not responsible for the
availability or content of these external sites, nor does ${TTL} endorse,
warrant or guarantee the products, services or information described or
offered at these other Internet sites.
</p>
<h2>Packages</h2>
EOF
printf "$INDEX"
printf "$BODY"
cat <<EOF
</body>
</html>
EOF


