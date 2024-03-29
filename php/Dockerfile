FROM php:7.4-fpm

# Install env
COPY sources.list    /etc/apt/sources.list
RUN apt-get update && apt-get install -y \
        ca-certificates \
        librabbitmq-dev \
        libgearman-dev \
        libmemcached-dev \
        libmcrypt-dev \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
        libcurl4-gnutls-dev \
        vim \
        zip unzip \
        git \
	    tree \
        procps \
        supervisor \
    && apt-get clean \
    && apt-get autoclean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


# https://www.digitalocean.com/community/tutorials/how-to-set-up-laravel-nginx-and-mysql-with-docker-compose-on-ubuntu-20-04
# https://www.zybuluo.com/gabe/note/1693095

# Set working directory
#WORKDIR /www/htdocs

#Add user for php container
RUN groupadd -g 1000 www
RUN useradd -u 1000 -ms /bin/bash -g www www


# Copy existing application directory contents
#COPY . /www

# Copy existing application directory permissions
#COPY --chown=www:www . /www


#Set permissions
RUN mkdir -p /www/htdocs && mkdir -p /www/log/php
RUN chown -R www.www /www/htdocs /www/log/php


RUN docker-php-ext-configure gd --with-freetype --with-jpeg && \
    docker-php-ext-install -j$(nproc) gd && \
    docker-php-ext-install pdo pdo_mysql && \
    docker-php-ext-install mysqli && \
    docker-php-ext-install bcmath && \
    docker-php-ext-install curl && \
    docker-php-ext-install sockets

#ADD https://pecl.php.net/get/memcached-2.2.0.tgz /usr/src/php/ext/memcached.tgz
#RUN tar -xf /usr/src/php/ext/memcached.tgz -C /usr/src/php/ext/ && \
#    rm /usr/src/php/ext/memcached.tgz && \
#    docker-php-ext-install memcached-2.2.0

ADD https://pecl.php.net/get/redis-5.0.1.tgz /usr/src/php/ext/redis.tgz
RUN tar -xf /usr/src/php/ext/redis.tgz -C /usr/src/php/ext/ && \
    rm /usr/src/php/ext/redis.tgz && \
    docker-php-ext-install redis-5.0.1

ADD https://pecl.php.net/get/swoole-4.8.13.tgz /usr/src/php/ext/swoole.tgz
RUN tar -xf /usr/src/php/ext/swoole.tgz -C /usr/src/php/ext/ && \
    rm /usr/src/php/ext/swoole.tgz && \
    docker-php-ext-install swoole-4.8.13

#ADD https://pecl.php.net/get/memcache-2.2.7.tgz /usr/src/php/ext/memcache.tgz
#RUN tar -xf /usr/src/php/ext/memcache.tgz -C /usr/src/php/ext/ && \
#    rm /usr/src/php/ext/memcache.tgz && \
#    docker-php-ext-install memcache-2.2.7

#ADD https://pecl.php.net/get/xdebug-2.3.2.tgz /usr/src/php/ext/xdebug.tgz
#RUN tar -xf /usr/src/php/ext/xdebug.tgz -C /usr/src/php/ext/ && \
#    rm /usr/src/php/ext/xdebug.tgz && \
#    docker-php-ext-install xdebug-2.3.2

#ADD https://pecl.php.net/get/amqp-1.4.0.tgz /usr/src/php/ext/amqp.tgz
#RUN tar -xf /usr/src/php/ext/amqp.tgz -C /usr/src/php/ext/ && \
#    rm /usr/src/php/ext/amqp.tgz && \
#    docker-php-ext-install amqp-1.4.0

#Composer
#ADD /phar/composer.phar /usr/local/bin/composer
#RUN chmod 755 /usr/local/bin/composer

# 安装composer
RUN curl -sS https://getcomposer.org/installer | php \
    && mv composer.phar /usr/bin/composer && chmod +x /usr/bin/composer


#PHPUnit
ADD /phar/phpunit.phar /usr/local/bin/phpunit
RUN chmod 755 /usr/local/bin/phpunit 

#PHP config
ADD php.ini    /usr/local/etc/php/php.ini
ADD php-fpm.conf    /usr/local/etc/php-fpm.conf

#Change current user to www
USER www

# Expose port 9000 and start php-fpm server
EXPOSE 9000
CMD ["php-fpm"]