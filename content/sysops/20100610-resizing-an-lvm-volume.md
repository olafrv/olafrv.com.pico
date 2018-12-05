---
title: Resizing a LVM ext2/ext3 volume (online)
created: 2010/06/10 08:48:07
---

Suppose we have this:

```bash
    df -h
```

> Filesystem Size Used Avail Use% Mounted on /dev/mapper/VolGroup00-root 30G 11G 17G 40% / /dev/sda1 494M 25M 445M 6% /boot tmpfs 426M 0 426M 0% /dev/shm none 426M 152K 426M 1% /var/lib/xenstored 

Suppose we want to extend the size of the /root partition which is a volumes group. To show the volumes groups configured in the system: 

```bash
    vgdisplay
```

In this case there is a group volume call "VolGroup00" with a total size of 74.00 GB and a free space of 42 GB:

> \--- Volume group --- VG Name VolGroup00 System ID Format lvm2 Metadata Areas 1 Metadata Sequence No 5 VG Access read/write VG Status resizable MAX LV 0 Cur LV 2 Open LV 2 Max PV 0 Cur PV 1 Act PV 1 VG Size 74.00 GB PE Size 32.00 MB Total PE 2368 Alloc PE / Size 1024 / 32.00 GB Free PE / Size 1344 / 42.00 GB VG UUID t79wNG-3da0-9i6j-3REv-o9WU-nndE-IfJvBK 

To show which logical volumes inside VolGroup00: 

```bash
    lvdisplay
```

Look for logical volume specification which says "VG Name VolGroup00": 

> \--- Logical volume --- LV Name /dev/VolGroup00/root VG Name VolGroup00 LV UUID 9T9MIN-5uc9-I2Sg-g9Jr-45g2-TxY6-39S7nA LV Write Access read/write LV Status available # open 1 LV Size 30.00 GB Current LE 960 Segments 2 Allocation inherit Read ahead sectors auto \- currently set to 256 Block device 253:0 

From the last output we guest that "/dev/VolGroup00/root" is a logical volume with 30 GB size, but we must be sure this volume is used for root partition using the command: 

```bash
    mount
```

The bellow line from last ouput confirm our guest: 

> /dev/mapper/VolGroup00-root on / type ext3 (rw) 

Now we extend in 30 GB the logical volume /dev/VolGroup00/root and resize online the /root (ext2/ext3) partition: 

```bash
    lvextend -L 60G /dev/VolGroup00/root
    resize2fs /dev/mapper/VolGroup00-root
```
