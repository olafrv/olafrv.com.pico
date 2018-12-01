title: Deshabilitar ALT+CTRL+BACKSPACE para reiniciar el X Display Manager
link: https://www.olafrv.com/wordpress/deshabilitar-altctrlbackspace-para-reiniciar-el-x-display-manager/
author: chanchito
description: 
post_id: 251
created: 2010/02/28 23:54:00
created_gmt: 2010/02/28 23:54:00
comment_status: open
post_name: deshabilitar-altctrlbackspace-para-reiniciar-el-x-display-manager
status: publish
post_type: post

# Deshabilitar ALT+CTRL+BACKSPACE para reiniciar el X Display Manager

Por defecto, varias distribuciones Linux (incluyendo Debian 5.0 Lenny) habilitan la combinación ALT+CTRL+BACKSPACE en el entorno gráfico (bloqueado o no) para poder reiniciar el servidor X. Esto permite a cualquier usuario físicamente enfrente del computador pueda iniciar sesión gráfica debido a que termina (y mata) los procesos del usuario que tiene abierta o bloqueada la sesión gráfica actual. Para deshabilitar esta función debe modificar (o añadir) la sección ServerFlags en el archivo** /etc/X11/xorg.conf**: 
    
    
    Section "ServerFlags"
      Option "DontZap"  "Yes"
    EndSection
    

Saludos.-