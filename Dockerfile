FROM php:8.2-apache-bookworm

RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libxml2-dev \
    libzip-dev \
    libicu-dev \
    libonig-dev \
    libc-client-dev \
    libkrb5-dev \
    unzip \
    git \
    pkg-config \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-configure imap --with-kerberos --with-imap-ssl \
    && docker-php-ext-install \
        mysqli \
        gd \
        intl \
        zip \
        mbstring \
        imap \
        ctype \
        xml \
        dom \
        iconv \
        opcache \
    && pecl install apcu \
    && docker-php-ext-enable apcu \
    && a2enmod rewrite \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /var/www/html

COPY upload/ /var/www/html/

RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html

EXPOSE 80