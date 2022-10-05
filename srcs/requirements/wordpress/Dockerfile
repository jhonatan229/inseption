FROM debian:buster

RUN apt-get update && \
	apt-get install -y \
	php-fpm php-common php-mbstring php-xmlrpc \
	php-soap php-gd php-xml php-intl php-mysql \
	php-cli php-ldap php-zip php-curl \
	wget

RUN mkdir /run/php && \
	wget https://wordpress.org/latest.tar.gz && \
	tar -zxvf latest.tar.gz && rm latest.tar.gz &&\
	mkdir -p /var/www/jestevam && \
	mv wordpress /var/www/jestevam/wordpress && \
	chown -R www-data:www-data /var/www/jestevam/wordpress/ && \
	chmod -R 755 /var/www/jestevam/wordpress/
	COPY ./tools/ /usr/local/bin

EXPOSE 9000

WORKDIR /var/www/jestevam/wordpress

ENTRYPOINT [ "config.sh" ]

CMD [ "/usr/sbin/php-fpm7.3", "--nodaemonize" ]