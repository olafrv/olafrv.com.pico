---
title: Preventing SSH brute force attacks
created: 2011/02/26
image: linux.jpg
---

Basically denyhosts (written in Python) scans /var/log/secure and fills /etc/hosts.deny based on failed login attempts. On Fedora: 

```bash
    yum install denyhosts
    vim /etc/denyhosts.conf
    service denyhosts restart
    chkconfig denyhosts on
```

Visit: <https://denyhosts.sourceforge.net/>