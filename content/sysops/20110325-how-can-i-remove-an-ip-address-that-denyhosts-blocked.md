title: How can I remove an IP address that DenyHosts blocked?
link: https://www.olafrv.com/wordpress/how-can-i-remove-an-ip-address-that-denyhosts-blocked/
author: chanchito
description: 
post_id: 721
created: 2011/03/25 12:12:36
created_gmt: 2011/03/25 16:42:36
comment_status: open
post_name: how-can-i-remove-an-ip-address-that-denyhosts-blocked
status: publish
post_type: post

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