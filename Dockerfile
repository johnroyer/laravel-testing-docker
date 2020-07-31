FROM php:7.4-cli

RUN apt-get update && apt-get install -y wget  apt-utils bash nano less debconf

# install MySQL 5.7
COPY mysql-download.sh /tmp/mysql-download.sh
COPY install.sh /tmp/install.sh
RUN bash /tmp/mysql-download.sh && bash /tmp/install.sh


# composer
RUN wget https://getcomposer.org/download/1.8.6/composer.phar -O /usr/bin/composer && chmod +x /usr/bin/composer && \
    composer --version

# nodejs
RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash && \
    . /root/.bashrc && \
    nvm --version && \
    nvm install v12.16.1

# clean
RUN apt-get clean && \
    apt-get autoremove -y && \
    rm -fr /tmp/* && \
    rm -fr /var/cache/apt/archives/*

