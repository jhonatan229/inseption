#!/bin/sh

WP_CONFIG=wp-config.php

if [ ! -f "$WP_CONFIG" ]
then
	mv wp-config-sample.php $WP_CONFIG
	sed -i "s/database_name_here/$DB_NAME/g" $WP_CONFIG
	sed -i "s/username_here/$MYSQL_USER/g" $WP_CONFIG
	sed -i "s/password_here/$MYSQL_PASSWORD/g" $WP_CONFIG
	sed -i "s/localhost/$DB_HOST/g" $WP_CONFIG
	sed -i "s/\/run\/php\/php7.3-fpm.sock/9000/g" /etc/php/7.3/fpm/pool.d/www.conf
	mv /srcs/index.html .
fi

exec "$@"