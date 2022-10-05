FROM debian:buster

RUN			apt-get update && apt-get install -y \
			apt-utils \
			mariadb-server \
			procps \
			&& mkdir -p /var/run/mysqld \
			&& chown -R mysql:mysql /var/run/mysqld


COPY ./tools/config.sh /usr/local/bin/
COPY ./conf/wordpress_conf.sql .

EXPOSE 3306

ENTRYPOINT [ "config.sh" ]

CMD ["mysqld", "--bind-address=0.0.0.0"]