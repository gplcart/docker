FROM php:7.1-apache
MAINTAINER Iurii Makukh <gplcart.software@gmail.com>

RUN set -ex \
	&& apt-get update \
	&& apt-get install -y \
		libjpeg-dev \
		libpng-dev \
                libcurl4-openssl-dev \
	&& rm -rf /var/lib/apt/lists/* \
	&& docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr \
	&& docker-php-ext-install opcache gd pdo_mysql zip

RUN a2enmod rewrite expires

WORKDIR /var/www/html

COPY config/php/php.ini /usr/local/etc/php/

ENV GPLCART_VER dev
ENV GPLCART_URL https://github.com/gplcart/gplcart/archive/${GPLCART_VER}.tar.gz
ENV GPLCART_FILE gplcart.tar.gz

RUN set -xe \
    && curl -sSL ${GPLCART_URL} -o ${GPLCART_FILE} \
    && tar -xzf ${GPLCART_FILE} --strip 1 \
    && rm ${GPLCART_FILE} \
    && chown -R www-data:www-data /var/www/html/*

CMD ["apache2-foreground"]

