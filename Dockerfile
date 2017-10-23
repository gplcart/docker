FROM php:7-apache
MAINTAINER Iurii Makukh <gplcart.software@gmail.com>

RUN apt-get update && apt-get install -y && rm -rf /var/lib/apt/lists/*

RUN a2enmod rewrite

RUN sed -i \
    -e "s/^memory_limit.*/memory_limit = 256M/" \
    -e "s/^max_execution_time.*/max_execution_time = 120/" \
    -e "s/^allow_url_fopen.*/allow_url_fopen = Off/" \
    /etc/php7/php.ini

RUN service apache2 restart

WORKDIR /var/www/html

ENV GPLCART_VER dev
ENV GPLCART_URL https://github.com/gplcart/gplcart/archive/${GPLCART_VER}.tar.gz
ENV GPLCART_FILE gplcart.tar.gz

RUN set -xe \
    && curl -sSL ${GPLCART_URL} -o ${GPLCART_FILE} \
    && tar xzf ${GPLCART_FILE} --strip 1 \
    && rm ${GPLCART_FILE} \
    && chown -R www-data:www-data .