FROM php:7.3.11-cli

RUN apt-get update && apt-get install -y wget  apt-utils bash

# install MySQL 5.7
COPY mysql-download.sh /tmp/mysql-download.sh

#RUN find / -name '*mysql*' -type d

#RUN apt-cache search mysql-server

#RUN mysql -u root -password -e "use mysql; UPDATE user SET authentication_string=PASSWORD('password') WHERE User='root'; flush privileges;"
