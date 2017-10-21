FROM php:7-apache
MAINTAINER Iurii Makukh <gplcart.software@gmail.com>

RUN apt-get update && apt-get install -y \
      libpng12-dev \
      libjpeg-dev \
      libpq-dev \
    && rm -rf /var/lib/apt/lists/* \
    && docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr \
    && docker-php-ext-install gd \
       mbstring \
       pdo \
       pdo_mysql \
       pdo_pgsql

RUN a2enmod rewrite
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