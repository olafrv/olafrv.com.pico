title: Kernel Compilation
link: https://www.olafrv.com/wordpress/kernel-compilation/
author: chanchito
description: 
post_id: 1386
created: 2013/09/22 22:31:31
created_gmt: 2013/09/23 03:01:31
comment_status: open
post_name: kernel-compilation
status: publish
post_type: post

# Kernel Compilation

Download stable Kernel **linux-3.11.1.tar.xz** from [www.kernel.org](http://www.kernel.org) and then: 
    
    
    unxz linux-3.11.1.tar.xz
    cd linux-3.11.1
    cp /boot/config-$(uname -r) .config
    make oldconfig
    Enter until exit (Or meditated and change the answers).
    make -j 4 deb-pkg LOCALVERSION=-custom
    

The option **-j 4** is to use the 4 cores full power of my [Intel® Core™ i7-2600K CPU @ 3.40GHz](http://ark.intel.com/products/52214): 
    
    
    cd ..
    dpkg -i linux-*_3.11.1-custom-*.deb
    reboot
    

**Based on:** https://wiki.ubuntu.com/KernelTeam/GitKernelBuild