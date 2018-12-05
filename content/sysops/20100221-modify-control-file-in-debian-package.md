---
title: Modify CONTROL file in Debian Package
created: 2010/02/21 06:23:04
image: linux.jpg
---

Suppose you have your-package.deb file and want to change files inside the package:

```bash
    mkdir -p tmp/DEBIAN
    dpkg-deb -x your-package.deb tmp/
    dpkg-deb --control your-package.deb tmp/DEBIAN
```

Modify the file tmp/DEBIAN/control as you like it. 

```bash
    dpkg-deb -b tmp your-package-custom.deb
```

Finally,

```bash
    dpkg -i your-package-custom.deb
```

Done!!!