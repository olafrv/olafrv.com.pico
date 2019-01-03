
# Windows
PICO=c:/olafrv.com.pico
# Linux
PICO=~/Documents/Inventos/olafrv.com.pico

# Apache Container

sudo chmod 666 /var/run/docker.sock
docker stop apache-php
docker rm apache-php
docker run -d --name apache-php -v $PICO:/var/www/html/pico -p 80:80 php:5.6.38-apache-stretch 
docker exec apache-php a2enmod rewrite
docker exec -it apache-php /bin/bash

# Developer PC (Git+Composer)

apt update
apt install git
# https://github.com/settings/keys
cd /var/www/html/pico 
curl -sSL https://getcomposer.org/installer | php
./vendors
php composer.phar install

#########################
# PicoCMS from scratch! # Careful!!!
# $ php composer.phar create-project picocms/pico-composer .
# PicoCMS code update!  # Careful!!!
# $ php composer.phar update
###



