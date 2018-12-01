title: Servers package difference => "dpkg-diff"
link: https://www.olafrv.com/wordpress/servers-package-difference-dpkg-diff/
author: chanchito
description: 
post_id: 1124
created: 2012/09/26 22:59:12
created_gmt: 2012/09/27 03:29:12
comment_status: open
post_name: servers-package-difference-dpkg-diff
status: publish
post_type: post

# Servers package difference => "dpkg-diff"

**Problem** You have two linux servers A and B, you want to know what installed packages are not in both servers (A-B joined with B-A). **Solution** The following script (dpkg-diff.sh, tested on GNU/Linux Debian Lenny/Squeeze). 

> **dpkg-query** command and a **ssh server** must be installed on both servers.
    
    
    ###
    # FILE: dpkg-diff.sh
    # AUTHOR: Olaf Reitmaier 
    # LICENSE: GNU/GPL v3 (Visit www.gnu.org for more info)
    # USAGE: Servers package difference => "dpkg-diff"
    # WARNING: Modify header vars according to your needs.
    ##
    
    # Header variables
    
    s1=server1.example.com
    s2=server2.example.com
    u1=testuser
    u2=$u1
    # Exclude lib* packages
    ft="-v ^lib"
    f1=/tmp/dpkg-diff.1
    f2=/tmp/dpkg-diff.2
    
    # Do not edit this lines unless you know what your doing!
    
    ssh $u1@$s1 "dpkg-query --list" | grep '^ii' | awk '{print $2}' > $f1
    ssh $u2@$s2 "dpkg-query --list" | grep '^ii' | awk '{print $2}' > $f2
    
    clear
    
    echo "Only in $s1"
    
    cat $f1 | grep $ft | sort | while read package
    do
    	if [ $(cat $f2  | grep $package | wc -l) -eq 0 ]
    	then
    		echo -n "$package "
    	fi
    done
    echo
    echo
    
    echo "Only in $s2"
    
    cat $f2 | grep $ft | sort | while read package
    do
    	if [ $(cat $f1 | grep $package | wc -l) -eq 0 ]
    	then
    		echo -n "$package "
    	fi
    done
    echo
    echo