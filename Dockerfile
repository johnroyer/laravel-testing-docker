FROM php:7.3.11-cli

RUN apt-get update && apt-get install -y wget  apt-utils  lsb-release

# install MySQL 5.7
RUN wget https://dev.mysql.com/get/Downloads/MySQL-8.0/mysql-server_8.0.18-1ubuntu18.04_amd64.deb-bundle.tar -O /tmp/mysql.deb
RUN dpkg -i /tmp/mysql.deb ; \
    apt-get install -f -y


#RUN find / -name '*mysql*' -type d

#RUN apt-cache search mysql-server

#RUN mysql -u root -password -e "use mysql; UPDATE user SET authentication_string=PASSWORD('password') WHERE User='root'; flush privileges;"
