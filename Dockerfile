FROM centos:latest
MAINTAINER Łukasz Faber <faber@agh.edu.pl>

RUN yum update -y && yum install -y wget httpd unzip php php-mysql php-pear php-gd php-mbstring

COPY run.sh config.inc.php /

RUN \
	wget -O /mutillidae.zip https://sourceforge.net/projects/mutillidae/files/latest/download && \
	unzip /mutillidae.zip -d /var/www/html && \
	rm -f /mutillidae.zip && \
	echo "<?php phpinfo(); ?>" > /var/www/html/mutillidae/phpinfo.php && \
	sed -i -e 's#^;date.timezone =.*$#date.timezone = Europe/Warsaw#g' /etc/php.ini && \
	sed -i -e 's#^allow_url_include = Off$#allow_url_include = On#g' /etc/php.ini && \
	sed -i -e 's#?>#set_include_path(get_include_path() . PATH_SEPARATOR . __ROOT__); ?>#g' /var/www/html/mutillidae/includes/constants.php && \
	mv config.inc.php /var/www/html/mutillidae/phpmyadmin/

CMD ["/bin/bash", "/run.sh"]
