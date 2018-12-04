docker stop apache-php
docker rm apache-php
docker run -d --name apache-php \
	-v c:/olafrv.com.pico:/var/www/html/pico \
       	-p 80:80 php:5.6.38-apache-stretch 
docker exec -it apache-php /bin/bash
