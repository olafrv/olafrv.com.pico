---
title: Clamav RAR files scanning support in Debian 5 Lenny
created: 2010/06/30 18:44:02
---

# Clamav RAR files scanning support in Debian 5 Lenny

After installing clamav in Debian 5 Lenny infected rar files are not detected??? It means, this command: 
    
    
    clamscan clam.rar 
    

Produce this output: 

> clam.rar: OK \----------- SCAN SUMMARY ----------- Known viruses: 803282 Engine version: 0.96 Scanned directories: 0 Scanned files: 1 Infected files: 0 Data scanned: 0.00 MB Data read: 0.00 MB (ratio 0.00:1) Time: 3.216 sec (0 m 3 s) 

**Well, you just need to install one of this package:** <https://packages.debian.org/squeeze/i386/libclamunrar6/> <https://packages.debian.org/squeeze/amd64/libclamunrar6/> Use dpkg to install the selected package for your system: 
    
    
    dpkg -i libclamunrar6_0.95.3-1_i???.deb
    

If you are using clamav-daemon your restart it: 
    
    
    /etc/init.d/clamav-daemon restart
    

Then just test your new clamav: 
    
    
    clamscan clam.exe 
    

> clam.rar: ClamAV-Test-File FOUND \----------- SCAN SUMMARY ----------- Known viruses: 803282 Engine version: 0.96 Scanned directories: 0 Scanned files: 1 Infected files: 1 Data scanned: 0.00 MB Data read: 0.00 MB (ratio 0.00:1) Time: 3.222 sec (0 m 3 s) 

Done!!!