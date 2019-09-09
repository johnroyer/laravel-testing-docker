FROM ubuntu:18.04

RUN echo "deb http://free.nchc.org.tw/ubuntu bionic main restricted" > /etc/apt/sources.list && \
    echo "deb http://free.nchc.org.tw/ubuntu bionic-updates main restricted" >> /etc/apt/sources.list && \
    echo "deb http://free.nchc.org.tw/ubuntu bionic universe" >> /etc/apt/sources.list && \
    echo "deb http://free.nchc.org.tw/ubuntu bionic-updates universe" >> /etc/apt/sources.list && \
    echo "deb http://free.nchc.org.tw/ubuntu bionic multiverse" >> /etc/apt/sources.list && \
    echo "deb http://free.nchc.org.tw/ubuntu bionic-updates multiverse" >> /etc/apt/sources.list && \
    echo "deb http://free.nchc.org.tw/ubuntu bionic-backports main restricted universe multiverse" >> /etc/apt/sources.list && \
    echo "deb http://free.nchc.org.tw/ubuntu bionic-security main restricted" >> /etc/apt/sources.list && \
    echo "deb http://free.nchc.org.tw/ubuntu bionic-security universe" >> /etc/apt/sources.list && \
    echo "deb http://free.nchc.org.tw/ubuntu bionic-security multiverse" >> /etc/apt/sourcess.list


# build base environment
RUN apt-get update && apt-get install -y software-properties-common unzip curl wget python3 python3-pip && \
    #docker-php-ext-install pdo_mysql pdo zip pcntl && \
    pip3 install awscli --upgrade --user

run export DEBIAN_FRONTEND=noninteractive && \
    ln -s /usr/share/zoneinfo/UTC /etc/localtime && \
    apt-get install -y tzdata && \
    dpkg-reconfigure --frontend noninteractive tzdata

RUN add-apt-repository -y ppa:ondrej/php

RUN apt-get update && apt-get install -y php7.3-cli php7.3-bcmath php7.3-bz2 \
                       php7.3-curl php7.3-gd php7.3-json php7.3-mbstring \
                       php7.3-mysql php7.3-opcache php7.3-sqlite3 php7.3-xml

# composer
RUN wget https://getcomposer.org/download/1.8.6/composer.phar -O /usr/bin/composer && chmod +x /usr/bin/composer && \
    composer --version

# nodejs
RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash && \
    . /root/.bashrc && \
    nvm --version && \
    nvm install v10.14.2

