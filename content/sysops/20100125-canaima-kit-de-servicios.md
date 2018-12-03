title: Canaima - Kit de Servicios
link: https://www.olafrv.com/wordpress/canaima-kit-de-servicios/
author: chanchito
description: 
post_id: 72
created: 2010/01/25 00:23:45
created_gmt: 2010/01/25 00:23:45
comment_status: open
post_name: canaima-kit-de-servicios
status: publish
post_type: post

# Canaima - Kit de Servicios

Cito textualmente: "Proveer una herramienta para la gestión y control de los diferentes Servicios que conforman la Plataforma Tecnológica de Información de las distintas instituciones que integran la Administración Pública Nacional mediante el uso de Tecnologías Libres.", disponible aquí: <https://wiki.canaima.softwarelibre.gob.ve/wiki/index.php/Kit_de_Servicios> Interesante y útil, pues hablamos de instalación, configuración y despliegue de: 

  * **Xen:** Plataforma de Virtualización.
  * **OpenLDAP:** Esquematización del árbol LDAP, organización basada en servicios, schemas LDAP personalizados.
  * Todos los servidores de la plataforma integrada poseen:
  * **sudo** conectado a '**LDAP**:

    

  * Usuarios conectados a **PAM**; eso logra tener a **SSH** conectado a **LDAP**
  * Infraestructura de clave pública conectada a **LDAP**
  * Información de red **(NIS/NSS)** conectada a **LDAP**
  * Certificados digitales; conexión **TLS/SSL** o **SASL**
  * **OpenVPN** con autenticación **LDAP**
  * Certificados **SSL** para todos los servicios.
  * **Entidad Certificadora base:**

    

    

    

    

  * \+ TinyCA, EasyCA

  * **Plataforma PKI básica:**

    

    

    

    

  * \+ OpenCA

  * **Servicio de correo electrónico:**

    

    

    

    

  * **Postfix** (**bdb** y **LDAP** para **lookup tables**)
  * **Dovecot** (Servidor **IMAP** con clientes virtuales basados en **LDAP**)
  * **Thunderbird** como cliente **IMAP**
  * Webmail: RoundCube
  * **Spamassassin** y **dspam**
  * **clamAV**
  * **o Amavis-new**

  * **Time Server (NTP)** para sincronización de hora en servidores
  * **Firewall** integrado y protección (hardening) de servidores y servicios
  * **OpenVPN**
  * **DNS** autoritativo basado en **LDAP**
  * **DHCP** autoritativo conectado a **LDAP:**

    

    

    

    

  * dhcp groups
  * subnets
  * shared networks
  * reservas IP

  * **Freeradius y Autenticación 802.1x**

    

    

    

    

  * **Freeradius** por usuario conectado a **LDAP**

  * **Apache 2**
  * Gestión de **vhosts** vía **LDAP**
  * Autenticación via **LDAP**
  * Balanceo y Alta disponibilidad basada en **DNS** y Directores de carga (load Balancers)
  * **Samba**

    

    

    

    

  * Primary Domain Controller
  * Scripts básicos de migración de entornos Microsoft (Active Directory)
  * NFS
  * Servidor de archivos
  * Servidor de impresión

  * Servicios de configuración e instalación desasistida:

    

    

    

    

  * FAI
  * Puppet
  * SystemImager
Saludos.- :-)