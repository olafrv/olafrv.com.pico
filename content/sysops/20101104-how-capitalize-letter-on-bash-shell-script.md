title: How to capitalize letters on bash shell script
link: https://www.olafrv.com/wordpress/how-capitalize-letter-on-bash-shell-script/
author: chanchito
description: 
post_id: 577
created: 2010/11/04 16:39:42
created_gmt: 2010/11/04 21:09:42
comment_status: open
post_name: how-capitalize-letter-on-bash-shell-script
status: publish
post_type: post

# How to capitalize letters on bash shell script

It's easy just use the **tr** command to lower, upper or capital case. Here is an example... 
    
    
    function toCapital
    {
       for x in $*
       do
          echo -n ${x:0:1} | tr '[a-z]' '[A-Z]' | xargs echo -n
          echo -n ${x:1} | tr '[A-Z]' '[a-z]' | xargs echo -n
          echo -n " "
       done
    }
    

To test the function just call it: 
    
    
    toCapital yuCa aMigo
    

The output is: 

> Yuca Amigo

Hope it's useful.

## Comments

**[Olaf Reitmaier Veracierta](#2232 "2010-11-05 15:19:22"):** Also more information on TLDP.org: http://www.tldp.org/LDP/abs/html/string-manipulation.html Cheers!!!

