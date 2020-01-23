FROM php:7.2-fpm

MAINTAINER Mamadou MASSI ABDOULAYE <massi.abdoulaye@gmail.com>

RUN apt-get update && apt-get install -y \
       build-essential \
       #mysql-client \
       libmcrypt-dev \
       locales \
       libfreetype6-dev \
       libjpeg62-turbo-dev \
       libpng-dev \
       curl \
       git \
       vim \
	&& docker-php-ext-install pdo pdo_mysql zip \
    && docker-php-ext-install -j$(nproc) iconv \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd \
    && docker-php-source delete \
    && php -r "readfile('https://getcomposer.org/installer');" | php -- --install-dir=/usr/local/bin --filename=composer \
    && chmod +x /usr/local/bin/composer

RUN apt-get clean && rm -rf /var/lib/apt/lists/*

RUN echo fr_FR.UTF-8 UTF-8 > /etc/locale.gen && locale-gen

WORKDIR /dimsfphpunit
