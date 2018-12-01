title: Preventing SSH brute force attacks
link: https://www.olafrv.com/wordpress/preventing-ssh-brute-force-attacks/
author: chanchito
description: 
post_id: 711
created: 2011/02/26 23:31:30
created_gmt: 2011/02/27 04:01:30
comment_status: open
post_name: preventing-ssh-brute-force-attacks
status: publish
post_type: post

# Preventing SSH brute force attacks

Basically denyhosts (written in Python) scans /var/log/secure and fills /etc/hosts.deny based on failed login attempts. On Fedora: 
    
    
    yum install denyhosts
    vim /etc/denyhosts.conf
    service denyhosts restart
    chkconfig denyhosts on
    

Visit: <http://denyhosts.sourceforge.net/>