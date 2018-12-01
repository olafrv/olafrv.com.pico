title: Modify CONTROL file in Debian Package
link: https://www.olafrv.com/wordpress/modify-control-file-in-debian-package/
author: chanchito
description: 
post_id: 145
created: 2010/02/21 06:23:04
created_gmt: 2010/02/21 06:23:04
comment_status: open
post_name: modify-control-file-in-debian-package
status: publish
post_type: post

# Modify CONTROL file in Debian Package

Suppose you have your-package.deb file and want to change files inside the package: 
    
    
    mkdir -p tmp/DEBIAN
    dpkg-deb -x your-package.deb tmp/
    dpkg-deb --control your-package.deb tmp/DEBIAN
    

Modify the file tmp/DEBIAN/control as you like it. 
    
    
    dpkg-deb -b tmp your-package-custom.deb
    

Finally, 
    
    
    dpkg -i your-package-custom.deb
    

Done!!!