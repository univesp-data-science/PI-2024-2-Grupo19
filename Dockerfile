FROM php:8.2-fpm-alpine

#ENV Variables
ENV COMPOSER_ALLOW_SUPERUSER = 1

RUN apk --update add --no-cache nginx wget libzip-dev icu-dev oniguruma-dev

# Install dependencies for GD and install GD with support for jpeg, png webp and freetype
# Info about installing GD in PHP https://www.php.net/manual/en/image.installation.php
RUN apk add --no-cache \
        libjpeg-turbo-dev \
        libpng-dev \
        libwebp-dev \
        freetype-dev \
        ffmpeg

RUN docker-php-ext-configure gd --with-jpeg --with-webp --with-freetype
RUN docker-php-ext-install gd

#Install intl extension to support many currency formats. Depends on the icu-dev lib to run
RUN docker-php-ext-configure intl
RUN docker-php-ext-install intl

#Install another required Laravel PHP Extensions
RUN docker-php-ext-install zip pdo_mysql bcmath exif

#Possible values for ext-name:
#bcmath bz2 calendar ctype curl dba dl_test dom enchant exif ffi fileinfo filter ftp gd gettext gmp hash iconv imap intl json ldap mbstring mysqli oci8 odbc opcache pcntl pdo pdo_dblib pdo_firebird pdo_mysql pdo_oci pdo_odbc pdo_pgsql pdo_sqlite pgsql phar posix pspell random readline reflection session shmop simplexml snmp soap sockets sodium spl standard sysvmsg sysvsem sysvshm tidy tokenizer xml xmlreader xmlwriter xsl zend_test zip

#Install Imagick
RUN apk add --no-cache ${PHPIZE_DEPS} imagemagick imagemagick-dev
RUN pecl install -o -f imagick && docker-php-ext-enable imagick
RUN apk del --no-cache ${PHPIZE_DEPS}

#Configure NGINX
RUN mkdir -p /run/nginx
COPY docker/nginx.conf /etc/nginx/nginx.conf

#Copy PHP Uploads preferences
COPY docker/uploads.ini /usr/local/etc/php/conf.d/uploads.ini

#Copy Application
RUN mkdir -p /app
COPY . /app
COPY ./backend-src /app

#Install Composer and Project dependencies
RUN sh -c "wget http://getcomposer.org/composer.phar && chmod a+x composer.phar && mv composer.phar /usr/local/bin/composer"
RUN cd /app && /usr/local/bin/composer install --no-dev

#Copy .env Local
RUN mv /app/.env.docker /app/.env

RUN chown -R www-data: /app

#Start Server
CMD sh /app/docker/startup.sh
