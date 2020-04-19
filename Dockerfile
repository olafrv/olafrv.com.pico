FROM php:7.2-apache
COPY . /var/www/html/pico
COPY docker.index.php /var/www/html/index.php
WORKDIR /var/www/html/pico
RUN a2enmod rewrite
RUN apt -y update \
	&& apt -y install zip \
   && apt -y clean
RUN curl -sSL https://getcomposer.org/installer | php
RUN php composer.phar install
