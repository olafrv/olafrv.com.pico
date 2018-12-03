---
title: Cómo REFORMATEAR (SOLO SI ES NECESARIO!!!) un pendrive de más de 32 GB
created: 2010/12/10 01:45:42
---

# Cómo REFORMATEAR (SOLO SI ES NECESARIO!!!) un pendrive de más de 32 GB

> ![](https://blog.olafrv.com/wp-content/uploads/2010/11/dialog_warning.png)**FORMATEAR UN PENDRIVE O CUALQUIER DISPOSITIVO DE BLOQUES DE FORMA INCORRECTA O SIN CONOCIMIENTO PUEDE LLEVAR A DEJARLO EN UN ESTADO INUTILIZABLE HASTA QUE SEA FORMATEADO CORRECTAMENTE POR PERSONAL TÉCNICO. HAGA RESPALDO DE SU INFORMACIÓN PERSONAL CONTENIDA EN EL DISPOSITIVO!!!**

A través de Windows XP o Vista no es recomendable realizar el procedimiento sin utilizar la utilidad **fat32format** de [RidgeCorp Consultants, Ltd.](https://www.ridgecrop.demon.co.uk/index.htm), la cual, permite eliminar la restricción de formatear disco mayores a 32GB con el formato FAT 32 aumentando el tamaño de bloque. Esto es necesario las limitaciones expresadas por el propio Microsoft aquí: [https://support.microsoft.com/default.aspx?scid=KB;EN-US;Q314463&](https://support.microsoft.com/default.aspx?scid=KB;EN-US;Q314463&) y la poca compatibilidad con el futuro formato propietario exFAT (precursos de FAT64). [Descargar fat32format (guiformat.exe)](https://blog.olafrv.com/wp-content/uploads/2010/11/guiformat.exe) ![](https://blog.olafrv.com/wp-content/uploads/2010/11/guiformat-243x300.png)   


* * *

  
**El Nuevo Formato exFAT para memorias flash mayores a 32 GB** También funcionan con el nuevo sistema de archivos [exFAT](https://es.wikipedia.org/wiki/ExFAT) precursor de FAT 64. En realidad exFAT es un FAT32 mejorado por Microsoft y patentado hace un par de años, para sortear las limitaciones de 32GB impuestas por éste último.   


* * *

  
**Usuarios con Sistema Operativo Windows** Windows de forma predeterminada detecta el formato FAT32 del pendrive, pero no debe reformatearse sin considerar lo descrito a continuación sobre el formato exFAT. 

> Si desea en Windows reformatear el pendrive deberá utilizar el formato exFAT. Primero, si no se tiene un sistema Windows XP con las últimas actualizaciones (Vista y Windows 7 no tienen ese problema) se debe ** instalar gratis el siguiente parche** <https://support.microsoft.com/kb/955704>, de lo contrario, el pendrive será detectado de forma errada con formato "RAW" mostrando espacio disponible igual a cero (0). Segundo, debe eliminarse la partición FAT32 del pendrive a través de Mi PC > Administrar > Administrador de Discos Lógico > Eliminar Partición. Luego, crear una partición y formatearla como exFAT. 

  


* * *

  
**Usuarios con Sistema Operativo Linux** Linux detecta el formato del pendrive como FAT32. 

> Si se desea utilizar el formato exFAT en Linux, éste lo detecta de forma errada haciéndonos creer que es NTFS/HPFS, por lo tanto, es necesario instalar <https://code.google.com/p/exfat/> para tener disponible el sistema de archivos exFAT a través de [FUSE](https://fuse.sourceforge.net/). Después de instalar podemos ejecutar: 
>     
>     
>     mount.exfat /dev/sdX /media/mipendrive
>     
> 
> Aunque no es recomendable también se puede dar formato al pendrive con FAT32 (VFAT), EXT3 o EXT4, sin embargo, tomará un tiempo considerable y tedioso debido a que no existe un "formato rápido", además que estos formatos no son reconocidos por Windows o Mac.

El Kernel de Linux 2.6 todavía no incluye un controlador estable para exFAT por un tema de licenciamiento, sin embargo, ya existen proyectos para dar soporte de lectura y escritura (No formateo) en las plataforma Linux a través de las librerías [FUSE](https://fuse.sourceforge.net/) disponibles en estos sistemas operativos, siempre y cuando el pendrive haya sido formateado en Windows.   


* * *

  
**Usuarios con Sistema Operativo Mac** En el caso de Mac éste detecta el pendrive como FAT32. 

> Si no se desea utilizar el formato FAT32 por defecto que tiene el pendrive, entonces es necesario instalar <https://code.google.com/p/macfuse/> para tener disponible el sistema de archivos exFAT a través de [FUSE](https://fuse.sourceforge.net/), siempre y cuando el pendrive haya sido formateado en Windows. Aunque no es recomendable también se puede dar formato al pendrive con HFS, HFS+ o HFSX, sin embargo, tomará un tiempo considerable y tedioso debido a que no existe un "formato rápido".

Saludos.-