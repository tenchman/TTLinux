#!/bin/sh

export LANG="C"

PATCH="${PWD}/squid-2.6-latest-icap.patch"
DATE=`date`
NAME=`basename $0`
REPO="/home/gernot/repositories/squid"

cat << EOF > ${PATCH}
The patchset was pulled from the project's CVS repository
at cvs.devel.squid-cache.org using

cvs diff -u -b -N -kk -rZ-icap-s2_6_merge_HEAD -ricap-2_6

See http://devel.squid-cache.org/icap/ for further information
about the ICAP client project.

Patch last updated: ${DATE} with
"${NAME}".

EOF

cd ${REPO}
cvs diff -u -b -N -kk -rZ-icap-2_6_merge_HEAD -ricap-2_6 >> ${PATCH}
perl -pi -e "s,^(--- |\+\+\+ )([^/]),\$1squid/\$2," ${PATCH}
