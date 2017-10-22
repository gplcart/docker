FROM php:7-apache
MAINTAINER Iurii Makukh <gplcart.software@gmail.com>

RUN apt-get update && apt-get install -y && rm -rf /var/lib/apt/lists/*
RUN a2enmod rewrite && service apache2 restart

WORKDIR /var/www/html

ENV GPLCART_VER dev
ENV GPLCART_URL https://github.com/gplcart/gplcart/archive/${GPLCART_VER}.tar.gz
ENV GPLCART_FILE gplcart.tar.gz

RUN set -xe \
    && curl -sSL ${GPLCART_URL} -o ${GPLCART_FILE} \
    && tar xzf ${GPLCART_FILE} --strip 1 \
    && rm ${GPLCART_FILE} \
    && chown -R www-data:www-data .