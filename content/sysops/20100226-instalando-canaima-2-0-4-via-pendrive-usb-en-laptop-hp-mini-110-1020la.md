---
title: Instalando Canaima 2.0.4 vía Pendrive USB en Laptop HP Mini 110 1020la
created: 2010/02/26 06:03:19
---

# Instalando Canaima 2.0.4 vía Pendrive USB en Laptop HP Mini 110 1020la

![](https://blog.olafrv.com/wp-content/uploads/2010/02/IMG00159-20100225-0003-300x225.jpg) 

## REQUERIMIENTOS

  1. GNU/Linux (Tipo Debian) instalado.
  2. Pendrive USB de 2.0 GBytes.
  3. Archivo TAR.GZ con[ imagen de GNU/Linux Canaima en Vivo](   https://canaima.softwarelibre.gob.ve:8080/canaima_cms/descargas/canaima-vivo-usb/releases/2.0  )
  4. Archivo ZIP con [imagen de GNU/Linux Gparted ](https://gparted.sourceforge.net/livecd.php)

 
## PRIMER PASO: CAMBIAR EL TAMAÑO DE LA PARTICIÓN WINDOWS (SI LO DESEAS)**


Instalar los paquetes necesarios: 
    
```bash
    aptitude update
    aptitude install syslinux mtools mbr dosfstools
```

## Hacer un pendrive booteable con GNU/Linux Gparted

Suponiendo que el pendrive se detecta como /dev/sdd Si el pendrive no esta vacio, debemos eliminar todas las particiones: 
    
```bash    
    fdisk /dev/sdd
```

Presionamos "d", hasta eliminar todas las particiones, "n" para crear una nueva, primaria "p", enter a todo lo demás. Para cambiar el tipo de la partición a FAT16 presionamos "t" y como código hexadecimal introducimos 06. Finalmente "w" para guardar los cambios y "q" para salir. También se puede utilizar cfdisk /dev/sdd, tiene problemas para escribir "si" acentuado cuando el programa lo pregunte, antes de ejecutar cfdisk se deben cambiar el lenguaje a inglés: 
    
```bash 
    export LANG=en_US
```

Una vez que se ha blanqueado el pendrive instalamos gparted en él: 
    
```bash 
    mkfs.vfat -F 32 /dev/sdd1
    mkdir /media/usb
    mount /dev/sdd1 /media/usb
    unzip gparted-live-0.4.5-2.zip -d /media/usb
    cd /media/usb/utils/linux
    bash makeboot.sh /dev/sdd1
    umount /media/usb
```

**Bootear por el pendrive para que inicie GNU/Linux Gparted. ** Cambiar el tamaño de la partición primaria y dejar espacio libre, después presionar aplicar.  _**Si la partición NTFS de la laptop no esta limpia (fue apagada abruptamente) las operaciones de cambio de tamaño fallarán con el error 95. **_ Para resolverlo estando en gparted abra un terminal y ejecute ntfsfix 

## SEGUNDO PASO: INSTALACIÓN DE CANAIMA

Ahora reutilizamos el mismo pendrive para instalar canaima: 
    
```bash    
    mkfs.vfat -n CanaimaUSB /dev/sdd1
    install-mbr /dev/sdd
    syslinux /dev/sdd1
    mount /dev/sdd1 /mnt/usb
    tar xvfz canaima_vivo_usb_i386.tar.gz -C /media/CanaimaUSB
```

Bootear con el pendrive e instalar canaima en el espacio libre. 

## TERCER PASO y ÚLTIMO PASO: CONFIGURAR EL HARDWARE EN CAINAMA

> Los paquetes linux-headers y build-essential vienen por defecto instalado en Canaima, si no abrá que parir.

**Tarjeta de Inalámbrica**

> 01:00.0 Network controller: Broadcom Corporation BCM4312 802.11b/g (rev 01)

Pueden seguir este procedimiento: [Haciendo funcionar Broadcom 4312 en GNU/Linux](https://blog.0x29.com.ve/?p=118), igual describo aquí como funcionó en mi caso: Descargar el controlador aquí: <https://www.broadcom.com/support/802.11/linux_sta.php> o desde aquí mismo: 

  * [hybrid-portsrc-x86_32-v5.60.48.36.tar.gz](https://www.olafrv.com/wp-content/uploads/2010/02/hybrid-portsrc-x86_32-v5.60.48.36.tar.gz)
  * [hybrid-portsrc-x86_64-v5.60.48.36](https://www.olafrv.com/wp-content/uploads/2010/02/hybrid-portsrc-x86_64-v5.60.48.36.tar.gz)

Luego, 
    
```bash
    tar xfz hybrid-portsrc-x86-32_5_10_27_12.tar.gz
    make && make install
    depmod -a
    modprobe ieee80211_crypt_tkip
    modprobe wl
```    

Añadir las siguientes líneas a /etc/modules 
    
```bash 
    ieee80211_crypt_tkip
    wl
```

**Tarjeta de Red Alámbrica**

> **02:00.0 Ethernet controller: Attansic Technology Corp. Device 1062 (rev c0)**

Descargar el controlador desde aquí: 

  * <https://www.jfwhome.com/wp-content/uploads/2009/08/atheros-wired-driver-1005ha-linux.zip>
  * <https://www.olafrv.com/wp-content/uploads/2010/02/atheros-wired-driver-1005ha-linux.zip>

Luego, 
    
```bash    
    unzip atheros-wired-driver-1005ha-linux.zip
    cd atheros-wired-driver-1005ha-linux
    make && make install
    modprobe atl1e
```

**Sonido**

> **00:1b.0 Audio device: Intel Corporation 82801G (ICH7 Family) High Definition Audio Controller (rev 02)**

> Cito textualmente a** apostols**: La versión de ALSA (1.0.17) que tiene Debian Lenny/Canaima no tiene buen soporte para esta tarjeta de sonido, solo tenemos que descargar una nueva versión del driver (empaquetado por la gente de LinuxANT) de: https://www.linuxant.com/alsa-driver/archive/alsa-driver-linuxant-1.0.20.3/alsa-driver-linuxant_1.0.20.3_all.deb.zip, y hacer: 
    
```bash 
    unzip alsa-driver-linuxant_1.0.20.3_all.deb.zip
    dpkg -i  alsa-driver-linuxant_1.0.20.3_all.deb
```

**Imagen Splash de GRUB** En /boot/grub/grub.cfg modificar vga=791 por vga=785 en las líneas del kernel de las entradas del menú. Luego, instalar GRUB en el disco principal (/dev/sda en mi caso) ejecutando: 
    
    
    grub-install /dev/sda
    

**Tamaño de Fuente de GNOME** Ir a Panel de Gnome, Sistema, Preferencias, Apariencia, Tipografía y colocar tamaño de fuente 8pts. 

 

**REFERENCIAS**

  1. [GParted Live on USB](https://gparted.sourceforge.net/liveusb.php)
  2. [Instalador USB para GNU/Linux Canaima](https://damncorner.blogspot.com/2009/07/instalador-usb-para-gnulinux-canaima.html)
  3. [Corriendo Canaima GNU/Linux 2.0.3 en una HP Mini 110-1020LA](https://apostols.net/?p=148)

## Comments

**[jose del carmen acosta acosta](#6 "2010-03-04 06:18:39"):** saludos revolucionario, tengo instalado ubunto pero necesito el driver de kyocera que ubuntu lo acecte, pues en widows estoy utilisando el telefono como modems para conectarme en internet y el mismo driver que estoy utilisando no lo pirmite ubuntu, quicera qe si alguno sabe como uvicar el driver de kyocera E2000 para UBUNTU, por aganmelo saber se los agradecere.

**[Olaf Reitmaier Veracierta](#7 "2010-03-04 07:48:11"):** Si eres "revolucionario" de pura cepa instala Canaima no Ubuntu. Si te gusta UBUNTU suscríbete y pregunta en https://ubuntuforums.org/. Es poco probable que haya controladores nativos para ese teléfono en GNU/Linux dado su arquitectura propietaria. Compra un Motorola o Blackberry (u otro teléfono más "imperialista") y más compatible con GNU/Linux que cualquier "vergatario", estos últimos en su mayoría hipócritamente sólo funciona en Microsoft Windows. Si ninguna de estas opciones te agrada apoya el Hardware Libre (https://es.wikipedia.org/wiki/Hardware_libre), generalmente no basta con el software libre.

**[tiostaphunic](#12 "2010-03-14 14:42:44"):** Help me please HP notebooks a suitable name of notebooks? I'm getting a new laptop soon and I'm curious is HP a good enough laptop. I need to know if it last for yers and have long enough battery life. I actually want a macbook... This thing is to expensive. So i was looking about if it worth to get HP laptops.

**[downfitkingfa](#13 "2010-03-14 15:25:42"):** Need advise if HP notebooks a good brand of laptops? My friend a new notebook in a nearest future and I wonder is HP a good laptop. I need to know if it last for yers and have long battery life. I'm not sure, maybe I want a MacBook... It is to expensive. So i was wondering if HP laptops are good notebooks.

**[sebastian](#4113 "2011-04-20 20:00:28"):** si de verdad creen en la revolucion socialista del siglo 21 deberian hacer un sistema canaima de instalacion desatendida como lo tienen otros DOS y dejen de llenarce la boca pensando que estan haciendo algo diferente para la gente del pueblo que ni los tecnicos viejos de windows saben como recuperar el sistema de esas computadoras para el pueblo.. mas bien parecen excusivas para un grupo selecto de tecnicos...

**[olafrv](#4394 "2011-05-04 16:52:20"):** Sebastian, con respeto te digo... 1) Ya hay instalaciones desantendidas para Linux. 2) Dudo que hayas pagado por tu licencia de Windows, Office, Mcafee, Norton, por tus juegos, por tus DVD o Bluerays, por los juegos de Wii o Xbox piratas o por los MP3 que te bajaste ayer con Emule o las películas de www.pirataweb.net. ¿Realmente te crees eso del software propietario en Venezuela?. 3) Los técnicos de Windows tampoco saben reparar Windows, como te explico... 4) Tu último comentario sólo delata tu ignorancia, Linux es para quien lo quiera usar, si no lo quieres usar, pues no lo uses, pero paga tus licencia de los software que utilizas. Saludos.-

**[Rys](#4860 "2011-06-18 18:01:41"):** de verdad me parecio complicadisimo, ota cosa como se hace para instalarlo sin necesidad de tener otro sist ope instalado es decir desde cero

**[Olaf Reitmaier Veracierta](#4868 "2011-07-17 00:26:42"):** No necesitas tenerlo instalado pero necesitarás otra máquina para hacer el pendrive que utilizarás para instalarlo siguiendo los pasos del método que describo aquí. También puedes utilizar una unidad de CD externa USB e instalar el sistema operativo de tu preferencia.

**[acne cure](#9519 "2014-09-19 14:52:28"):** This design is incredible! You certainly know how to keep a reader amused. Between your wit and your videos, I was almost moved to start my own blog (well, almost...HaHa!) Excellent job. I really enjoyed what you had to say, and more than that, how you presented it. Too cool!

