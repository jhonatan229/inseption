#!/bin/bash
SERVER_CONF=/etc/nginx/sites-available/jestevam
if [ ! -f "SERVER_CONF" ];
then
	openssl req -new -x509 -nodes -days 365 \
	-newkey rsa:4096 -sha256 \
	-keyout /etc/ssl/private/nginx.key \
	-out /etc/ssl/certs/nginx-certificate.crt \
	-subj "/C=BR/ST=Sao Paulo/L=Mairipora/O=42Sp/OU=jestevam/CN=jestevam.42.fr"
	mkdir -p /var/www/jestevam
	mv /srcs/jestevam /etc/nginx/sites-available/
	ln -s /etc/nginx/sites-available/jestevam /etc/nginx/sites-enabled/
fi

exec "$@"