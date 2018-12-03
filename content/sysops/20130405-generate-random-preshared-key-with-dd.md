title: Generate Random Preshared Key With "dd"
link: https://www.olafrv.com/wordpress/generate-random-preshared-key-with-dd/
author: chanchito
description: 
post_id: 1145
created: 2013/04/05 00:29:04
created_gmt: 2013/04/05 04:59:04
comment_status: open
post_name: generate-random-preshared-key-with-dd
status: publish
post_type: post

# Generate Random Preshared Key With "dd"

State of the art, so elegant!: 
    
    
    dd if=/dev/random bs=32 count=1 2>/dev/null | od -t x1 | sed  '$d;s/^[[:xdigit:]]* //;s/ //g' | tr -d '\n'; echo
    

Source: <https://www.linuxquestions.org/questions/linux-newbie-8/can-dd-be-used-to-clone-just-the-data-on-a-partition-595285/>