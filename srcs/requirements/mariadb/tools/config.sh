#!/bin/sh

PATH_DB=/var/lib/mysql/$DB_NAME

if [ ! -d "$PATH_DB" ]
then
	service mysql start;
	mysql -u root \
	--execute="CREATE DATABASE $DB_NAME; \
	CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD'; \
	GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$MYSQL_USER'@'%';";
	mysqladmin -u root password $MYSQL_ROOT_PASSWORD;
	mysql -uroot -p$MYSQL_ROOT_PASSWORD wordpress < wordpress_conf.sql;
	mysqladmin -uroot -p$MYSQL_ROOT_PASSWORD shutdown;
fi

exec "$@"