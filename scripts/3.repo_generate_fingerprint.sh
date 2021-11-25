#!/bin/sh

( echo "function: sha256"; echo "fingerprint: $(sha256 -q repo.pub)"; ) > fingerprint
