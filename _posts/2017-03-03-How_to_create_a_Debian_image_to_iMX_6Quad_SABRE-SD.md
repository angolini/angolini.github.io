---
title: How to create a Debian image to iMX 6Quad SABRE-SD
date: 2017-03-03 10:19:56
author: daiane
tags: [debian, IMX6QDL ]
---

Prepare the host machine installing the following packages:

```
$ sudo apt-get install debootstrap qemu-user-static
```
Create a mounting point, mount your SDCard and start **Wheezy Debian** installation,
(or any other version).

```
$ mkdir mounting
$ sudo mount /dev/sdb2 mounting/
$ sudo debootstrap --foreign --arch=armhf wheezy mounting/
```
Enable **QEMU ARM** and second stage:

```
$ sudo cp /usr/bin/qemu-arm-static mounting/usr/bin/
$ sudo chroot mounting/ /debootstrap/debootstrap --second-stage
```

Add the following line in the file `mounting/etc/inittab`

```
T0:23:respawn:/sbin/getty -L ttymxc0 115200 vt100
```

Add the `eth0` configuration above in the file `mounting/etc/network/interfaces`

```
auto eth0
iface eth0 inet dhcp
```

To enable the system to let you enter as root edit the file `mounting/etc/shadow`
changing the first line to be like the following (remove the `*`):

```
  root::15880:0:99999:7:::
```

Unmount the partition and boot the board

```
$ sudo umount mounting/
```

If you feel like installing a X11 Windows Manager, in the imx6qsabresd:

```
# apt-get update
# apt-get install xfce4 slim
```

{: .notice--success}
I used an already running SDCard with `fsl-image-machine-test` from `morty` and
only replaced the rootfs by removing the partition content and mounting it on my
PC. This process is not listed here because the process of creating the SDCard
base is straight forward and present in several tutorials. However, if you need
help with this process, please leave a comment.

{: .notice--info}
The resultant image is not yet accelerated by GPU or VPU. The process to install
the needed pieces to get the hardware acceleration will be shared in a different
post.

---
This post was originally posted on [i.MXDev Blog](https://imxdev.gitlab.io/).