FROM php:7.2.24-cli

# build base environment
RUN apt-get update && apt-get install -y libzip-dev unzip libssl-dev libmcrypt-dev libpng-dev wget python3 python3-pip && \
    docker-php-ext-install pdo_mysql pdo zip pcntl && \
    pip3 install awscli --upgrade --user

# composer
RUN wget https://getcomposer.org/download/1.8.6/composer.phar -O /usr/bin/composer && chmod +x /usr/bin/composer && \
    composer selfupdate && composer --version

# nodejs
RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.35.0/install.sh | bash && \
    . /root/.bashrc && \
    nvm --version && \
    nvm install v12.13.0

