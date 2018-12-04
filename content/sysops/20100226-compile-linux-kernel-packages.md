---
title: Compile linux-* kernel packages
created: 2010/02/26 06:02:30
---

# Compile linux-* kernel packages

In Debian Like Systems it goes like this… **Installing need packages**
    
```bash
    apt-get install kernel-package libncurses5-dev fakInstalling need packageseroot wget bzip2 build-essential
```

**Download and decompress the kernel from kernel.org**
    
```bash 
    wget https://www.kernel.org/pub/linux/kernel/v2.6/linux-2.6.22.3.tar.bz2
    bzip2 -d linux-2.6.22.3.tar.bz2
    tar xvf linux-2.6.22.3.tar.bz2
```

**Configure the source for compilation**
    
```bash 
    cd /usr/src/linux-2.6.22-3
    make clean && make mrproper
    cp /boot/config-`uname -r` ./.config
    make menuconfig
```

> Load alternate file > .config > ESC > Save? Yes

**Compiling**
    
```bash 
    make-kpkg clean
    fakeroot make-kpkg –initrd –append-to-version=-custom kernel_image kernel_headers
```

**Installing new linux-headers package**
    
```bash 
    cd /usr/src
    dpkg -i linux-headers-2.6.22.3-custom.deb
    dpkg -i linux-image-2.6.22.3-custom.deb
```

**Reconfiguring using new kernel (before boot or install linux-image)**
    
```bash
    export KERN_DIR=/usr/src/linux-headers-2.6.22.3/
```

Use the new kernel headers to configure you application, in my case Virtualbox 
    
```bash
    /etc/init.d/vboxdrv setup
```
