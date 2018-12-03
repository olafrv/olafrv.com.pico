title: Recuperar archivos borrados en un sistema de ficheros ext3
link: https://www.olafrv.com/wordpress/recuperar-archivos-borrados-en-un-sistema-de-ficheros-ext3/
author: chanchito
description: 
post_id: 259
created: 2010/03/01 20:57:48
created_gmt: 2010/03/01 20:57:48
comment_status: open
post_name: recuperar-archivos-borrados-en-un-sistema-de-ficheros-ext3
status: publish
post_type: post

# Recuperar archivos borrados en un sistema de ficheros ext3

Si se sabe la **ruta del archivo borrado** **(no sirve con directorios)** se puede hacer lo siguiente (me funcionó con unos archivos .php). Descargar el código fuente del programa** ext3grep** en <https://code.google.com/p/ext3grep/> Instalar las librerías necesarias, generalmente basta con: 
    
    
    apt-get install e2fslibs-dev
    

Extraer, compilar e instalar el comando **ext3grep**: 
    
    
    tar xfz ext3grep.tar.gz
    cd ext3grep
    ./configure
    make && make install
    

La partición que contiene los archivos perdidos no necesariamente debe estar desmontada, pero debemos ejecutar el comando de restauración habiendo cambiado el directorio actual a otra partición con el comando **cd**. 

> No se deben restaurar los archivos en la misma partición afectada!!!.

Finalmente, ejecutamos por ejemplo: 
    
    
    ext3grep /dev/sda3 --restore-file /var/www/apps/admin/views/Controller.php
    

Podemos ver los archivos disponibles para restaurar con: 
    
    
    ext3grep /dev/sda3 --dump-names
    

Suerte!!!