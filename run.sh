#!/bin/bash

sed -i -e "s/127.0.0.1/$MYSQL_PORT_3306_TCP_ADDR/g" /var/www/html/mutillidae/includes/database-config.php
sed -i -e "s/DB_PASSWORD', ''/DB_PASSWORD', '$MYSQL_ENV_MYSQL_ROOT_PASSWORD'/g" /var/www/html/mutillidae/includes/database-config.php

sed -i -e "s/DB_HOST/$MYSQL_PORT_3306_TCP_ADDR/g" /var/www/html/mutillidae/phpmyadmin/config.inc.php

/usr/sbin/httpd -D FOREGROUND
