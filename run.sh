
# Windows
PICO=c:/olafrv.com.pico
# Linux
PICO=~/Desktop/olafrv.com.pico

# docker stop apache-php
# docker rm apache-php

docker run -d --name apache-php \
	-v $PICO:/var/www/html/pico \
       	-p 80:80 php:5.6.38-apache-stretch 
docker exec -it apache-php /bin/bash

# Composer (Libs)

# $ cd /var/www/html/pico
# $ apt update
# $ apt install git

# $ curl -sSL https://getcomposer.org/installer | php
# ./vendors
# $ php composer.phar install

#########################
# PicoCMS from scratch! # Careful!!!
# $ php composer.phar create-project picocms/pico-composer .
# PicoCMS code update!  # Careful!!!
# $ php composer.phar update
###

# a2enmod rewrite


