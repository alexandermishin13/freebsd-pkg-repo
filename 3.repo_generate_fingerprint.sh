#!/bin/sh

sh -c '( echo "function: sha256"; echo "fingerprint: $(sha256 -q repo.pub)"; ) > fingerprint'
