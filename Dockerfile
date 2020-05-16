FROM php:7.2-apache
COPY html/pico /var/www/html/pico
ADD html/index.php /var/www/html/
RUN a2enmod rewrite
RUN apt -y update \
	&& apt -y install zip \
   && apt -y clean
WORKDIR /var/www/html/pico
RUN curl -sSL https://getcomposer.org/installer | php
RUN php composer.phar install
