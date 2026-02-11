#!/bin/sh

REPO=/gammix/repo
ARCH_LIST='13:armv7 13:aarch64 14:armv7 14:aarch64 15:armv7 15:aarch64'

for ARCH in ${ARCH_LIST}; do
/usr/sbin/pkg repo ${REPO}/FreeBSD:${ARCH}/latest signing_command: ./repo_sign.sh
done
