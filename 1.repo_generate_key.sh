#!/bin/sh

/usr/bin/openssl genrsa -out repo.key 2048
/bin/chmod 0400 repo.key
/usr/bin/openssl rsa -in repo.key -out repo.pub -pubout
