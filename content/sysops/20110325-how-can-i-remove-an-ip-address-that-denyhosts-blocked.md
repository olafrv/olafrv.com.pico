---
title: How can I remove an IP address that DenyHosts blocked?
created: 2011/03/25 12:12:36
---

# How can I remove an IP address that DenyHosts blocked?

Just with this script: 
    
    
    ###
    # FILE: denyhosts-remove.sh (2011/Abr/06)
    # AUTHOR: Olaf Reitmaier Veracieta
    # USE: How can I remove an IP address that DenyHosts blocked?
    #      https://denyhosts.sourceforge.net/faq.html#3_19
    # WARNING: Tested on Debian Squeeze
    ##
    
    #!/bin/bash
    
    DENYDIR=/var/lib/denyhosts
    
    
    if [ ! -z "$1" ]
    then
            /etc/init.d/denyhosts stop
            sed -i "/$1/d" /etc/hosts.deny $DENYDIR/hosts* $DENYDIR/users-hosts
            /etc/init.d/denyhosts start
    else
            echo "Usage ./$0 "
    fi