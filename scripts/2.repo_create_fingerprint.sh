#!/bin/sh

REPO=/nvme/repo
ARCH_LIST='armv7 aarch64'

for ARCH in ${ARCH_LIST}; do
/usr/sbin/pkg repo ${REPO}/FreeBSD:13:${ARCH}/latest signing_command: ./repo_sign.sh
done
