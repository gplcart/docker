FROM php:7.1-apache
MAINTAINER Iurii Makukh <gplcart.software@gmail.com>

RUN a2enmod rewrite expires

RUN set -ex \
	&& apt-get update \
	&& apt-get install -y --no-install-recommends \
		libjpeg-dev \
		libpng-dev \
        libcurl4-openssl-dev \
	&& rm -rf /var/lib/apt/lists/* \
	&& docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr \
	&& docker-php-ext-install opcache gd pdo_mysql zip

WORKDIR /var/www/html

COPY config/php/php.ini /usr/local/etc/php/
COPY docker-entrypoint.sh /usr/local/bin/

ENV GPLCART_INSTALL 1
ENV GPLCART_EMAIL test@test.com
ENV GPLCART_PASSWORD 12345678

ENV GPLCART_VER dev
ENV GPLCART_URL https://github.com/gplcart/gplcart/archive/${GPLCART_VER}.tar.gz
ENV GPLCART_FILE gplcart.tar.gz

RUN set -xe \
    && curl -sSL ${GPLCART_URL} -o ${GPLCART_FILE} \
    && tar -xzf ${GPLCART_FILE} --strip 1 \
    && rm ${GPLCART_FILE} \
    && chown -R www-data:www-data . \
    && chmod +x /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
CMD ["apache2-foreground"]