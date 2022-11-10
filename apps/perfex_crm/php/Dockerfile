FROM php:7.4-fpm  
RUN apt-get update && apt-get install -y libc-client-dev libpng-dev libkrb5-dev libzip-dev zip  && \
  rm -r /var/lib/apt/lists/*
RUN docker-php-ext-install mysqli pdo pdo_mysql gd zip && \
  docker-php-ext-enable pdo_mysql gd zip

RUN docker-php-ext-configure imap --with-kerberos --with-imap-ssl && \
  docker-php-ext-install imap && \
  docker-php-ext-enable imap

