#!/bin/bash

sudo systemctl start docker
sudo docker run -d --name=mysql -e MYSQL_ROOT_PASSWORD=my-secret-pw mariadb
sudo docker run -p 80:80 -p 443:443 --link mysql:mysql --name mutillidae -d mutillidae
