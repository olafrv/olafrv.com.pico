---
title: Clamav RAR files scanning support in Debian 5 Lenny
created: 2010/06/30
image: clamav.png
---

After installing clamav in Debian 5 Lenny infected rar files are not detected??? It means, this command:

```bash
    clamscan clam.rar
```

Produce this output:

> clam.rar: OK \----------- SCAN SUMMARY ----------- Known viruses: 803282 Engine version: 0.96 Scanned directories: 0 Scanned files: 1 Infected files: 0 Data scanned: 0.00 MB Data read: 0.00 MB (ratio 0.00:1) Time: 3.216 sec (0 m 3 s) 

**Well, you just need to install one of this package:** 

<https://packages.debian.org/squeeze/amd64/libclamunrar6/> Use dpkg to install the selected package for your system:

```bash
    dpkg -i libclamunrar6_0.95.3-1_i???.deb
```

If you are using clamav-daemon your restart it: 

```bash
    /etc/init.d/clamav-daemon restart
```

Then just test your new clamav: 

```bash
    clamscan clam.exe 
```

> clam.rar: ClamAV-Test-File FOUND \----------- SCAN SUMMARY ----------- Known viruses: 803282 Engine version: 0.96 Scanned directories: 0 Scanned files: 1 Infected files: 1 Data scanned: 0.00 MB Data read: 0.00 MB (ratio 0.00:1) Time: 3.222 sec (0 m 3 s) 

Done!!!