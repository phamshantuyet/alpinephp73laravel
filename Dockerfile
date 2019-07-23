FROM phamshantuyet/phalconphp_alpine:latest
LABEL maintainer="Pham Shan Tuyet <phamshantuyet@gmail.com>"

RUN apk --no-cache add php7.3-gd && cp /usr/lib/php/7.3/modules/gd.so /usr/local/lib/php/extensions/no-debug-non-zts-20180731/ && cp /etc/php/7.3/conf.d/00_gd.ini /usr/local/etc/php/conf.d/

RUN apk --no-cache add libzip-dev zip && docker-php-ext-configure zip --with-libzip && docker-php-ext-install zip

RUN cp /usr/lib/php/7.3/modules/pdo_mysql.so /usr/local/lib/php/extensions/no-debug-non-zts-20180731/ && cp /etc/php/7.3/conf.d/02_pdo_mysql.ini /usr/local/etc/php/conf.d/

EXPOSE 80

CMD ["/bin/sh", "-c", "/sbin/runit-wrapper"]
