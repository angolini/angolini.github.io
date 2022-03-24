---
title: WaRP7 Linux Kernel status including upstream
date: 2016-10-27 10:51:12
author: daiane
tags: [ warp7, IMX7S, kernel ]
---
We have been working to code and upstream as much WaRP7 features as we can.
Currently we are working on a 3 different Linux Kernel source code repositories,
with different upstream levels and content, depending on each community guideline.

* **linux-warp7:** [https://github.com/WaRP7/linux-fslc](https://github.com/WaRP7/linux-fslc)
* **linux-fslc-imx:** [https://github.com/Freescale/linux-fslc/tree/4.1-1.0.x-imx](https://github.com/Freescale/linux-fslc/tree/4.1-1.0.x-imx)
* **kernel.org:**  [https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/log/?id=refs/tags/v4.9-rc2](kernel.org)

|Features | linux-warp7 | linux-fslc-imx | kernel.org|
| ------- |:------:|:------:|:------:|
|PMIC<BR>(PF3000)               | YES | YES | YES |
|Battery Charger<BR>(BC3770)    | YES | YES | NO  |
|WiFi/BLE<BR>(BCM4343W)         | YES | YES | YES |
|Accelerometer<BR> (FXOS8700CQ) | YES | YES | NO  |
|Magnetometer<BR> (FXOS8700CQ)  | YES | YES | NO  |
|Pressure Sensor<BR>(MPL3115A2) | YES | YES | YES |
|Gyroscope<BR> (FXAS21002)      | YES | YES | NO  |
|Audio<BR> (SGTL5000)           | YES | YES | YES |
|board buttons                  | YES | YES | YES |
|Display                        | YES | NO  | NO  |
|Touchscreen                    | YES | NO  | NO  |
|Camera interface               | NO  | NO  | NO  |

**YES**: the support is already available in the Linux Kernel

**NO**: the needed source code is not present yet

For WiFi and BLE the firmware files are needed in the rootfs and may be under
license restrictions.

---
This post was originally posted on [i.MXDev Blog](https://imxdev.gitlab.io/).