FROM centos:latest
MAINTAINER Łukasz Faber <faber@agh.edu.pl>

RUN yum update -y && yum install -y httpd mod_ssl php php-mysql php-pear php-gd php-mbstring git bind-utils

COPY run.sh config.inc.php /

RUN \
	git clone https://github.com/webpwnized/mutillidae.git /var/www/html/mutillidae && \
	sed -i -e 's#^;date.timezone =.*$#date.timezone = Europe/Warsaw#g' /etc/php.ini && \
	sed -i -e 's#^allow_url_include = Off$#allow_url_include = On#g' /etc/php.ini && \
	sed -i -e 's#?>#set_include_path(get_include_path() . PATH_SEPARATOR . __ROOT__); ?>#g' /var/www/html/mutillidae/includes/constants.php && \
	mv config.inc.php /var/www/html/mutillidae/phpmyadmin/ && \
	yum clean all

CMD ["/bin/bash", "/run.sh"]
