FROM php:7.1-fpm

LABEL author="Montol Saklor"
LABEL maintainer="montolsaklor@gmail.com"
LABEL build_date="2018-10-05"

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


# Install Composer
RUN curl -o /tmp/composer-setup.php https://getcomposer.org/installer \
        && curl -o /tmp/composer-setup.sig https://composer.github.io/installer.sig \
        && php -r "if (hash('SHA384', file_get_contents('/tmp/composer-setup.php')) !== trim(file_get_contents('/tmp/composer-setup.sig'))) { unlink('/tmp/composer-setup.php'); echo 'Invalid installer' . PHP_EOL; exit(1); }" \
        && php /tmp/composer-setup.php --no-ansi --install-dir=/usr/local/bin --filename=composer --snapshot 

WORKDIR /var/www/
