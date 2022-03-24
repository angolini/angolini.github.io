---
title: WaRP7 supported on Yocto Project by meta-fsl-arm-extra
redirect_from: blog/ann/2016/09/21/WaRP7_supported_on_Yocto_Project_by_meta-fsl-arm-extra/
date: 2016-09-21 16:20:21
author: daiane
tags: [IMX7S, warp7, yocto, meta-fsl-arm-extra, meta-freescale ]
---

WaRP7 is supported in Yocto Project since **Krogoth**, but now it uses the kernel from [linux-warp7](https://github.com/WaRP7/linux-fslc) by default. Of course, it's also available on **master** branch.

This kernel currently provides support for:

* NXP FXOS8700 accelerometer + magnetometer
* NXP FXAS21002 Gyroscope
* NXP MPL3115A2 pressure sensor
* NXP SGTL5000 audio codec
* NXP NT3H1101 NFC tag IC
* MIPI Display
* NXP PF3001 PMIC
* NXP BC3770 Battery charger IC
* Murata 1DX Wi-Fi + Bluetooth

You can download the pre-built for this board from [Blink](http://blink.ossystems.com.br/boards/imx7s-warp?processor=15) (thanks to FSL Community BSP).

**fsl-image-machine-test** should have all the packages you need to test the sensors such as:
* evtest
* fbset
* aplay
* i2c-tools (for hw debug)
* v4l-utils (if you choose X11).

It does **not** contain wpa-supplicant, but does contain the wifi firmware.

And if you need to build your own tailored Yocto Project image for WaRP7 board, you can download the source code with the following commands:

```console
$ mkdir ~/bin
$ curl http://commondatastorage.googleapis.com/git-repo-downloads/repo >  ~/bin/repo
$ chmod a+x ~/bin/repo
$ PATH=${PATH}:~/bin
$ mkdir fsl-community-bsp
$ cd fsl-community-bsp
$ repo init -u https://github.com/Freescale/fsl-community-bsp-platform -b krogoth
$ repo sync
```

you can replace krogoth on the command lines for master if you prefer to test master instead

---
This post was originally posted on [i.MXDev Blog](https://imxdev.gitlab.io/).