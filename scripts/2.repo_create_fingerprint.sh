#!/bin/sh

REPO=/nvme/repo
ABI=FreeBSD:13:armv7

/usr/sbin/pkg repo ${REPO}/${ABI}/latest signing_command: ./repo_sign.sh
