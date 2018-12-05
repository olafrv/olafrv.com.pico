---
title: Deshabilitar ALT+CTRL+BACKSPACE para reiniciar el X Display Manager
created: 2010/02/28 23:54:00
image: linux.jpg
---

Por defecto, varias distribuciones Linux (incluyendo Debian 5.0 Lenny) habilitan la combinación ALT+CTRL+BACKSPACE en el entorno gráfico (bloqueado o no) para poder reiniciar el servidor X. Esto permite a cualquier usuario físicamente enfrente del computador pueda iniciar sesión gráfica debido a que termina (y mata) los procesos del usuario que tiene abierta o bloqueada la sesión gráfica actual. Para deshabilitar esta función debe modificar (o añadir) la sección ServerFlags en el archivo** /etc/X11/xorg.conf**: 
    
    
    Section "ServerFlags"
      Option "DontZap"  "Yes"
    EndSection
    

Saludos.-