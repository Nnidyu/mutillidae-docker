FROM centos:latest
MAINTAINER Łukasz Faber <faber@agh.edu.pl>

RUN yum update -y && yum install -y httpd mod_ssl php php-mysqlnd php-pear php-gd php-mbstring git bind-utils php-json

COPY run.sh config.inc.php /

RUN \
	git clone https://github.com/webpwnized/mutillidae.git /var/www/html && \
	sed -i -e 's#^;date.timezone =.*$#date.timezone = Europe/Warsaw#g' /etc/php.ini && \
	sed -i -e 's#^allow_url_include = Off$#allow_url_include = On#g' /etc/php.ini && \
	sed -i -e 's#?>#set_include_path(get_include_path() . PATH_SEPARATOR . __ROOT__); ?>#g' /var/www/html/includes/constants.php && \
	mv config.inc.php /var/www/html/phpmyadmin/ && \
	yum clean all && \
	/usr/libexec/httpd-ssl-gencerts

EXPOSE 80
EXPOSE 443

CMD ["/bin/bash", "/run.sh"]
