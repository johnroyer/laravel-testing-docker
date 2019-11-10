FROM php:7.3.11-cli

RUN apt-get update && apt-get install -y wget  apt-utils bash nano less debconf

# install MySQL 5.7
COPY mysql-download.sh /tmp/mysql-download.sh
COPY install.sh /tmp/install.sh
RUN bash /tmp/mysql-download.sh
RUN bash /tmp/install.sh


