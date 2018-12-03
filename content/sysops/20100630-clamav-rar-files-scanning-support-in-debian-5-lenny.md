title: Clamav RAR files scanning support in Debian 5 Lenny
link: https://www.olafrv.com/wordpress/clamav-rar-files-scanning-support-in-debian-5-lenny/
author: chanchito
description: 
post_id: 474
created: 2010/06/30 18:44:02
created_gmt: 2010/06/30 23:14:02
comment_status: open
post_name: clamav-rar-files-scanning-support-in-debian-5-lenny
status: publish
post_type: post

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