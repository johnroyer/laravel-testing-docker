FROM php:7.2

# build base environment
RUN apt-get update && apt-get install -y unzip libssl-dev libmcrypt-dev libpng-dev && \
    docker-php-ext-install pdo_mysql pdo zip pcntl
