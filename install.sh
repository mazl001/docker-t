#!/bin/bash

if [ ! -d ~/www/data/mysql ]; then
    mkdir -p ~/www/data/mysql
fi

if [ ! -d ~/www/data/redis ]; then
    mkdir -p ~/www/data/redis
fi

if [ ! -d ~/www/htdocs ]; then
    mkdir -p ~/www/htdocs
fi

if [ ! -d ~/www/log/php ]; then
    mkdir -p ~/www/log/php
fi

if [ ! -d ~/www/log/mysql ]; then
    mkdir -p ~/www/log/mysql
fi

if [ ! -d ~/www/log/nginx ]; then
    mkdir -p ~/www/log/nginx
fi


groupadd -g 1000 www
useradd -u 1000 -s /usr/sbin/nologin -g www www

groupadd -g 1001 mysql
useradd -u 1001 -s /usr/sbin/nologin -g mysql mysql

groupadd -g 1002 redis
useradd -u 1002 -s /usr/sbin/nologin -g redis redis

chown -R www.www ~/www/htdocs ~/www/log/php ~/www/log/nginx
chown -R mysql.mysql ~/www/data/mysql
chown -R redis.redis ~/www/data/redis