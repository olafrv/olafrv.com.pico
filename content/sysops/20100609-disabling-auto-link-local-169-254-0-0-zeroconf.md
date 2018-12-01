title: Disabling auto link-local 169.254.0.0 zeroconf
link: https://www.olafrv.com/wordpress/disabling-auto-link-local-169-254-0-0-zeroconf/
author: chanchito
description: 
post_id: 450
created: 2010/06/09 23:52:06
created_gmt: 2010/06/10 04:22:06
comment_status: open
post_name: disabling-auto-link-local-169-254-0-0-zeroconf
status: publish
post_type: post

# Disabling auto link-local 169.254.0.0 zeroconf

**History**

> Zero configuration networking allow novice users to interconnect network enabled devices without any (zero) configuration, it is used when there is no DHCP and DNS servers available on the network. Zeroconf provides: 
> 
>   1. Auto assignment of network address (link-local)
>   2. Auto resolution of hostnames via multicast DNS
>   3. Automatic location of network services (i.e. printing) after auto discovering DNS servers.
> The zeroconf network address assignment is described in [RFC 3927](http://www.ietf.org/rfc/rfc3927.txt) and correspond to the 169.254.0.0/16 IPv4 or fe80::/16 networks, this mecanism is called Link-Local address assignment. Microsoft calls Link-Local as Automatic Private IP Addressing (APIPA) or Internet Protocol Automatic Configuration (IPAC). The name resolution is done by using Apple Multicast DNS (mDNS) an open standard or with Microsoft Multicast Name Resolution (LLMNR). The service discovery is done by using Multicast DNS/DNS-SD (Applet), UPnP SSDP (Simple Service Discovery de Microsoft). There is an open standard for service discovery proposed by IETF called Service Location Protocol (SLP) described in [RFC 2608](http://www.ietf.org/rfc/rfc2608.txt) y [RFC 3224](http://www.ietf.org/rfc/rfc3224.txt) supported by HP Printers, Novell and Sun Microsoft. There many implementation of this RFC such as: Bonjour (Apple), [Avahi (Linux)](http://avahi.org/), LLMNR Windows CE 5.0 (Microsoft), zcip, BusyBox, StableBox, zeroconf, avahi-autoipd (Linux, includes an implementation for the IPv4 Link Local).

Based on: <http://en.wikipedia.org/wiki/Zero_configuration_networking> (2010-06-10) **How to disable zeroconf** **Debian** like systems edit **/etc/default/avahi-daemon** and change this line: 

> AVAHI_DAEMON_DETECT_LOCAL=0

On Red Hat like systems edit **/etc/sysconfig/network**: 

> NOZEROCONF=yes

Restart the daemon and the next time you restart the network link-local will be gone!!: 
    
    
    /etc/init.d/avahi-daemon restart
    

On Red Hat like systems: 
    
    
    service avahi restart
    

If you want to stop (on boot) the service (avahi) responsible for auto network discovery: 
    
    
    update-rc.d -f avahi-daemon remove
    

On Red Hat like systems: 
    
    
    chkconfig avahi-daemon off
    

If you want to uninstall the package: 
    
    
    apt-get --purge remove avahi-daemon
    

On Red Hat like systems: 
    
    
    yum -y remove avahi-daemon
    

**Avahi-daemon and other packages** The package avahi-daemon (in Debian like systems) suggest the avahi-autoipd and recommend libnss-mdns, you can also try to unninstall those.