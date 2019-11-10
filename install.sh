#!/usr/bin/env bash

cd /tmp
ls
export DEBIAN_FRONTEND="noninteractive"
debconf-set-selections <<< "mysql-community-server/root-pass password root"
dpkg -i mysql-common_5.7.27-1ubuntu18.04_amd64.deb  
dpkg -i libmysqlclient20_5.7.27-1ubuntu18.04_amd64.deb 
dpkg -i mysql-community-server_5.7.27-1ubuntu18.04_amd64.deb
dpkg -i mysql-community-client_5.7.27-1ubuntu18.04_amd64.deb
dpkg -i mysql-client_5.7.27-1ubuntu18.04_amd64.deb 
dpkg -i mysql-server_5.7.27-1ubuntu18.04_amd64.deb 
apt-get install -f -y mysql-client mysql-server
apt --fix-broken -y install 
