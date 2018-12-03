---
title: Preventing SSH brute force attacks
created: 2011/02/26 23:31:30
---

# Preventing SSH brute force attacks

Basically denyhosts (written in Python) scans /var/log/secure and fills /etc/hosts.deny based on failed login attempts. On Fedora: 
    
    
    yum install denyhosts
    vim /etc/denyhosts.conf
    service denyhosts restart
    chkconfig denyhosts on
    

Visit: <https://denyhosts.sourceforge.net/>