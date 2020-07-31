#!/usr/bin/env bash

echo Download MySQL bundle
wget --progress=bar:force:noscroll \
    https://downloads.mysql.com/archives/get/p/23/file/mysql-server_5.7.27-1ubuntu18.04_amd64.deb-bundle.tar \
    -O /tmp/mysql.tar

if [ $? != 0 ]; then
    echo Download failed
    exit 1
fi

HASH=`md5sum /tmp/mysql.tar | awk "{print \\$1}"`
echo $HASH

if [ $HASH != '35791c457a9771e4c619db10c9b536c7' ]; then
    echo HASH not match
    exit 1
else
    echo Download complete
fi

echo untar bundle
tar xvf /tmp/mysql.tar -C /tmp
