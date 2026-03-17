---
title: How to dump the SDCard content to an image file
date: 2018-08-22 09:58:50
author: daiane
tags: [fdisk, sdcard, image]
---

This post shows a way to dump the content of a booting SDCard to an image file
with purpose of duplicating the SDCard or sharing its image.

# Determine the origin SDCard blocksize and the number of sectors to be copied

```
$ sudo fdisk -l /dev/sdb
Disk /dev/sdb: 7.3 GiB, 7780433920 bytes, 15196160 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disklabel type: dos
Disk identifier: 0x00000000

Device     Boot Start    End Sectors Size Id Type
/dev/sdb1        2048  34815   32768  16M 53 OnTrack DM6 Aux3
/dev/sdb2  *    34816  67583   32768  16M  c W95 FAT32 (LBA)
/dev/sdb3       67584 190463  122880  60M 83 Linux
```

The line `Units: sectors of 1 * 512 = 512 bytes` describes the size of a sector
on this SDCard. In this example, it's **512** bytes.

In this example, the total number of used sectors is it's **32768** for `/dev/sdb1` plus **32768** for `/dev/sdb2` plus **122880** for `/dev/sdb3`, a total of **188416** sectors.

# Dump it in an image file

```
sudo dd if=/dev/sdb of=dump.sdcard bs=512 count=188416
```

# Duplicate the image in another SDCard

```
sudo dd if=dump.sdcard of=/dev/sdX
```
---
This post was originally posted on [i.MXDev Blog](https://imxdev.gitlab.io/).