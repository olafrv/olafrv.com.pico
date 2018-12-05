---
title: Generate Random Preshared Key With "dd"
created: 2013/04/05
image: linux.jpg
---

State of the art, so elegant!: 
    
```bash
    dd if=/dev/random bs=32 count=1 2>/dev/null | od -t x1 | sed  '$d;s/^[[:xdigit:]]* //;s/ //g' | tr -d '\n'; echo
```

Source: <https://www.linuxquestions.org/questions/linux-newbie-8/can-dd-be-used-to-clone-just-the-data-on-a-partition-595285/>