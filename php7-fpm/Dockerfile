FROM php:7.1-fpm

MAINTAINER Montol Saklor <montol saklor@gmail.com>

ENV TZ=Asia/Bangkok
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Install dependencies
RUN apt-get update && apt-get install -y \
	libmcrypt-dev \
	zip \
	zlib1g-dev \
	curl \
	libpng-dev \
	libjpeg-dev \
	libfreetype6-dev \
	libmagickwand-dev \
        libicu-dev \
        libxslt1-dev \
        libxml2-dev \
        g++

# Configure the gd library
RUN docker-php-ext-configure \
        gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/

RUN docker-php-ext-configure intl

# Install required PHP extensions
RUN docker-php-ext-install \
        dom \ 
        gd \ 
        intl \ 
        mbstring \ 
        pdo_mysql \ 
        xsl \ 
        zip \ 
        soap \ 
        bcmath \ 
        mcrypt

WORKDIR /var/www/
