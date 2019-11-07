FROM php:7.3.11-cli

RUN apt-get update && apt-get install -y wget  apt-utils  lsb-release

# install MySQL 5.7
RUN cd /tmp && \
    ROOT_PASSWORD="your_root_password" && \
    echo "mysql-apt-config mysql-apt-config/unsupported-platform select abort" | /usr/bin/debconf-set-selections && \
    echo "mysql-apt-config mysql-apt-config/repo-codenameselect bionic" | /usr/bin/debconf-set-selections && \
    echo "mysql-apt-config mysql-apt-config/select-tools select" | /usr/bin/debconf-set-selections && \
    echo "mysql-apt-config mysql-apt-config/repo-distroselect ubuntu" | /usr/bin/debconf-set-selections && \
    echo "mysql-apt-config mysql-apt-config/select-server select mysql-5.7" | /usr/bin/debconf-set-selections && \
    echo "mysql-apt-config mysql-apt-config/select-product select Apply" | /usr/bin/debconf-set-selections && \
    wget https://dev.mysql.com/get/mysql-apt-config_0.8.14-1_all.deb -O /tmp/mysql.deb && \
    dpkg -i /tmp/mysql.deb && \
    apt-get update

RUN apt-cache search mysql-server

#RUN mysql -u root -password -e "use mysql; UPDATE user SET authentication_string=PASSWORD('password') WHERE User='root'; flush privileges;"
