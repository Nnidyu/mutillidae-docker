#!/bin/bash

sed -i -e "s/127.0.0.1/db/g" /var/www/html/includes/database-config.inc
sed -i -e "s/DB_PASSWORD', 'mutillidae'/DB_PASSWORD', '$DB_PASSWORD'/g" /var/www/html/includes/database-config.inc
sed -i -e "s/DB_HOST/db/g" /var/www/html/phpmyadmin/config.inc.php

mkdir /run/php-fpm

/usr/sbin/php-fpm -R -D

/usr/sbin/httpd -D FOREGROUND
