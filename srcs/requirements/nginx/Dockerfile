FROM debian:buster

WORKDIR /

# install everything necessary
RUN apt-get update &&\
	apt-get install -y \
	nginx \
	openssl

COPY ./conf/ /srcs/
COPY ./tools/ssl-config.sh /usr/local/bin

EXPOSE 443 7000

ENTRYPOINT [ "ssl-config.sh" ]

CMD ["nginx", "-g", "daemon off;"]
