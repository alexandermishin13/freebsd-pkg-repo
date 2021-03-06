#!/bin/sh

read -t 2 sum
[ -z "$sum" ] && exit 1
echo SIGNATURE
echo -n $sum | /usr/bin/openssl dgst -sign repo.key -sha256 -binary
echo
echo CERT
/bin/cat repo.pub
echo END
