FROM php:7.2

# build base environment
RUN apt-get update && apt-get install -y unzip libssl-dev libmcrypt-dev libpng-dev wget && \
    docker-php-ext-install pdo_mysql pdo zip pcntl

# composer
RUN wget https://getcomposer.org/download/1.8.6/composer.phar -O /usr/bin/composer && chmod +x /usr/bin/composer && \
    composer --version
