#!/bin/sh

CATEGORY=$1
PORT=$2

# Check if parameters is ok
if [ ! ${CATEGORY} ] || [ ! ${PORT} ]; then
    echo "Usage: $0 <port_category> <port_name>"
    exit 1
fi

CURDIR=`/bin/pwd`
VER=`/bin/date -j +g%Y%m%d`

cd ~mishin/src/${PORT}/
CMD_GIT=/usr/local/bin/git
GL_COMMIT=`${CMD_GIT} log --format="%H" -n 1`

# Edit Makefile
cd ${CURDIR}/${CATEGORY}/${PORT}

# No port revision by default
REVISION='0'
VER2=`sed -n 's/^DISTVERSION=[[:blank:]]*\(\)/\1/p' ./Makefile`

# If the same version increase the port revision
# PORTREVISION=0 must be in the Makefile or nothing happened
if [ $VER == $VER2 ]; then
REVISION=`sed -n 's/^PORTREVISION=[[:blank:]]*\(\)/\1/p' ./Makefile`
let 'REVISION+=1' > /dev/null
fi

/usr/bin/sed -r -i '' \
    -e "s/^DISTVERSION=.+$/DISTVERSION=\t${VER}/" \
    -e "s/^PORTREVISION=.+$/PORTREVISION=\t${REVISION}/" \
    -e "s/^GL_TAGNAME=.+$/GL_TAGNAME=\t${GL_COMMIT}/" \
    -e "s/^GL_COMMIT=.+$/GL_TAGNAME=\t${GL_COMMIT}/" \
    ./Makefile

# Fetch archive and calculate checksums for 'distinfo'
/usr/bin/make clean
/usr/bin/make makesum

# Make ports diff-file
cd ${CURDIR}
mkdir -p ${CATEGORY}/${PORT}.$$
${CMD_GIT} diff \
    --no-index \
    --output ${CATEGORY}/${PORT}.diff \
    -- \
    ${CATEGORY}/${PORT}.$$/ \
    ${CATEGORY}/${PORT}/
rmdir ${CATEGORY}/${PORT}.$$

# Make ports shar-file
/usr/bin/tar cf ${CATEGORY}/${PORT}.shar --format shar ${CATEGORY}/${PORT}
