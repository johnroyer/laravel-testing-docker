#!/usr/bin/env bash

echo Download MySQL bundle
wget --progress=bar:force:noscroll \
    https://downloads.mysql.com/archives/get/file/mysql-server_5.7.27-1ubuntu18.04_amd64.deb-bundle.tar \
    -O /tmp/mysql.tar

$HASH=`md5sum /tmp/mysql.tar`
echo $HASH

if [ $HASH != '35791c457a9771e4c619db10c9b536c7' ]; then
    echo HASH not match
    exit 1
fi
