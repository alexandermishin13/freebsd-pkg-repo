#!/bin/sh

REPO=/nvme/repo/FreeBSD:13:armv7/latest

pkg repo ${REPO} signing_command: ./repo_sign.sh
