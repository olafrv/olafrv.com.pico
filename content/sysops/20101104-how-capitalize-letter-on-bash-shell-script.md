---
title: How to capitalize letters on bash shell script
created: 2010/11/04 16:39:42
---

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

**[Olaf Reitmaier Veracierta](#2232 "2010-11-05 15:19:22"):** Also more information on TLDP.org: https://www.tldp.org/LDP/abs/html/string-manipulation.html Cheers!!!

