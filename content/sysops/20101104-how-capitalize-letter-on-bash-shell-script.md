---
title: Capitalize letters on bash shell script
created: 2010/11/04
image: linux.jpg
---

It's easy just use the **tr** command to lower, upper or capital case. Here is an example and more info in [TLDP](https://www.tldp.org/LDP/abs/html/string-manipulation.html)

```bash
    function toCapital
    {
       for x in $*
       do
          echo -n ${x:0:1} | tr '[a-z]' '[A-Z]' | xargs echo -n
          echo -n ${x:1} | tr '[A-Z]' '[a-z]' | xargs echo -n
          echo -n " "
       done
    }
```

To test the function just call it: 

```bash
    toCapital yuCa aMigo
```

The output is:

> Yuca Amigo

Hope it's useful.