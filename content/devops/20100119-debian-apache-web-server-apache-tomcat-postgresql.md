---
title: Debian + Apache Web Server + Apache Tomcat + PostgreSQL
link: https://www.olafrv.com/wordpress/debian-apache-web-server-apache-tomcat-postgresql/
author: chanchito
description: 
post_id: 28
created: 2010/01/19 04:25:55
created_gmt: 2010/01/19 04:25:55
comment_status: open
post_name: debian-apache-web-server-apache-tomcat-postgresql
status: publish
post_type: post
---

# Debian + Apache Web Server + Apache Tomcat + PostgreSQL

El presente manual ([Haga clic aquí para descargar el manual](../wp-content/uploads/2010/01/debian4_apache2_tomcat5_pgsql74.txt)) establece como debe realizarse la instalación integrada de: \- Servidor de Páginas Web - "Apache Web Server" / "MÃ³dulo mod-jk" \- Servidor de Aplicaciones Web - "Java" / "Apache Tomcat" \- Servidor de Base de Datos - "PostgreSQL" \- Script de Respaldos - "Tape-Backup" Tomando en cuenta las mejores prácticas y garantizando los niveles básicos de eficiencia y seguridad de la información, entre las cuales, se incluyen: \- Balanceo de las solicitudes HTTP y redirección de las mismas al servicio de TOMCAT. \- Encarcelamiento del servidor TOMCAT en una celda sin privilegios de administrador. \- Respaldo de archivos a disco (y/o en cinta) mediante scripts configurables. \- Configuración de un cortafuegos de primer nivel. Cumplimiento de las Polí­ticas del Sistema Operativo GNU/Linux Debian disponibles en http://www.debian.org/doc/devel-manuals#policy