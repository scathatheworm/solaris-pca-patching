#!/usr/bin/bash
SHOWREV=/usr/bin/showrev
PKGINFO=/usr/bin/pkginfo
UNAME=/sbin/uname
DIFF=/usr/bin/diff

$SHOWREV -p | $DIFF - /var/tmp/showrev.out > /dev/null 2>&1
showrevout=$?
$PKGINFO -x | $DIFF - /var/tmp/pkginfo.out > /dev/null 2>&1
pkginfoout=$?
$UNAME -a | $DIFF - /var/tmp/uname.out > /dev/null 2>&1
unameout=$?

if [[ "$showrevout" -ne 0 ]] || [[ "$pkginfoout" -ne 0 ]] || [[ "$unameout" -ne 0 ]] ; then
        $SHOWREV -p > /var/tmp/showrev.out
        $PKGINFO -x > /var/tmp/pkginfo.out
        $UNAME -a > /var/tmp/uname.out
        exit 2
else
        exit 0
fi
