---
title: How to inspect OpenEmbedded kickstart wic files
date: 2018-05-04 17:16:45
author: daiane
tags: [yocto, wic, image, openembedded, wks]
---

The disk image format used in the Yocto Project is `wic`. Follow this [link][1] to
understand what it is and its history. In addition to the complete manual.

# What it is (former .sdcard)

The **FSL Community BSP** used to provide a `*.sdcard` image ready to be copied
to the SDCard. Now that the Yocto Project uses the `wic` format the layer
`meta-freescale` has also provided some choices to the user, and by default, the
generated image is a `*.wic.gz` file instead of a `*.sdcard`.

They are basically the same for the user. The `*.gz` file must be decompressed
and the next step is exact the same:

```console
$ gunzip core-image-base.wic.gz
$ sudo dd if=core-image-base-wic of=/dev/sdX
```

## How to list all available disk formats

For example, when using [FSL Community BSP].

Remember to setup the environment to have access to the `wic` command.
{: .notice--warning}

```console
$ source setup-environment build
$ wic list images
  imx-uboot                     		Create SD card image with a boot partition
  imx-uboot-spl-bootpart        		Create SD card image with a boot partition
  imx-uboot-spl                 		Create SD card image with a boot partition
  imx-uboot-mxs                 		Create SD card image without a boot partition
  imx-barebox                   		Create SD card image with a boot partition
  imx-uboot-mxs-bootpart        		Create SD card image with a boot partition
  imx-uboot-bootpart            		Create SD card image with a boot partition
  directdisk-gpt                		Create a 'pcbios' direct disk image
  sdimage-bootpart              		Create SD card image with a boot partition
  mkhybridiso                   		Create a hybrid ISO image
  directdisk-multi-rootfs       		Create multi rootfs image using rootfs plugin
  mkefidisk                     		Create an EFI disk image
  directdisk-bootloader-config  		Create a 'pcbios' direct disk image with custom bootloader config
  systemd-bootdisk              		Create an EFI disk image with systemd-boot
  directdisk                    		Create a 'pcbios' direct disk image
  qemux86-directdisk            		Create a qemu machine 'pcbios' direct disk image
```

# How to list partitions

Two examples on different `wic` disk images content:

**One partition only**
```console
$ wic ls ~/pico/core-image-base-imx7d-pico-20180429185116.rootfs.wic
Num     Start        End          Size      Fstype
 1       4194304    102341631     98147328  ext4
```

**More partitions**
```console
$ wic ls tmp/deploy/images/imx7d-pico/core-image-imx7d-pico-20180430173731.rootfs.wic
Num     Start        End          Size      Fstype
 1       8388608    354686975    346298368  ext4
 2     360710144    707008511    346298368  ext4
 3     713031680    729808895     16777216  ext4
```

# How to list inside partitions

To list the content of partition number 1 of the following image. Pay attention
to the number at the end of command line.

If the partition number does not exist in the disk image, you will face an error.
Make sure to list all the existing partitions before list its content.

```console
$ wic ls ~/pico-pi/core-image-base-imx7d-pico-20180429185116.rootfs.wic:1
debugfs 1.42.13 (17-May-2015)
      2   40755 (2)      0      0    1024 29-Apr-2018 15:59 .
      2   40755 (2)      0      0    1024 29-Apr-2018 15:59 ..
     11   40700 (2)      0      0   12288 29-Apr-2018 15:59 lost+found
     12   40755 (2)      0      0    1024 29-Apr-2018 15:59 home
     14   40755 (2)      0      0    3072 29-Apr-2018 15:53 lib
    247   40755 (2)      0      0    1024 29-Apr-2018 15:52 var
    290   40755 (2)      0      0    3072 29-Apr-2018 15:59 sbin
    359   40755 (2)      0      0    1024 29-Apr-2018 15:40 usr
   1851   40755 (2)      0      0    3072 29-Apr-2018 15:59 etc
   2154   40755 (2)      0      0    1024 29-Apr-2018 13:00 dev
   2155   41777 (2)      0      0    1024 29-Apr-2018 13:00 tmp
   2156   40755 (2)      0      0    1024 29-Apr-2018 13:00 sys
   2157   40755 (2)      0      0    1024 29-Apr-2018 13:00 media
   2158   40755 (2)      0      0    1024 29-Apr-2018 13:00 run
   2159   40755 (2)      0      0    1024 29-Apr-2018 15:59 boot
   2166   40755 (2)      0      0    1024 29-Apr-2018 15:59 mnt
   2168   40755 (2)      0      0    3072 29-Apr-2018 15:59 bin
   2239   40755 (2)      0      0    1024 29-Apr-2018 13:00 proc
```

[1]: https://www.yoctoproject.org/docs/current/mega-manual/mega-manual.html#creating-partitioned-images-using-wic
[FSL Community BSP]: http://freescale.github.io/#download

---
This post was originally posted on [i.MXDev Blog](https://imxdev.gitlab.io/).