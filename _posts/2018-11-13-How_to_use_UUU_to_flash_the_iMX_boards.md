---
title: How to use UUU to flash the iMX boards
date: 2018-11-13 13:06:15
author: daiane
tags: [IMX8, IMX8QXP, mfgtools, uuu, L4.14.62_1.0.0_Beta ]
---

UUU is the next version of MFGTools, a tool used to load the software on the
RAM or flash it to a list of boot media supported by several i.MX boards.
UUU is helpful for development or production environment.

# Introduction
UUU stands for **Universal Update Utility** - also known as mfgtools 3.0.

It runs on Windows or Linux with the same look and feel, the source code is
available on
[GitHub](https://github.com/NXPmicro/mfgtools) along with the
[documentation](https://github.com/NXPmicro/mfgtools/wiki), the
[issue tracking system](https://github.com/NXPmicro/mfgtools/issues) and the
[release artifacts](https://github.com/NXPmicro/mfgtools/releases).

# Installation

The installation only requires copying the right set of files to one directory.
The next table shows the minimum files needed to get UUU running on Linux or
Windows.

|Linux|Windows
|---  |---
|`uuu`|`uuu.exe`
|     |`libusb-1.0.dll`

# How to use UUU for i.MX 8QXP MEK

The i.MX 8QXP MEK is shown in the following picture:

<center><img src="{{ absolute_url }}/images/imx8qxp-top.jpg" width="80%"/></center>

## Connect the board

The first step is to connect all the needed cables to the board and power on
the board.

* Connect the 12V/8.3A universal power supply between the outlet and connector `J9`
* Connect a USB type B cable between the computer and connector `J11`
* Connect a USB type C cable between the computer and connector `J10`

The power indication led is `D2`. To verify if the USB connections are right use
the Linux command `lsusb` or
[USBView](https://www.ftdichip.com/Support/Utilities/usbview.zip) on Windows.

The USB devices created are as in the following table:

|USB Type|Connector|Use             | USB device recognized by OS
|---     |---      |---             |---
|micro  |`J11`    | Serial Console |`Bus 001 Device 006: ID 0403:6010 Future Technology Devices International, Ltd FT2232C Dual USB-UART/FIFO IC`
|Type C  |`J10`    |Serial Download |`Bus 003 Device 003: ID 1fc9:012f NXP Semiconductors `

If using on Windows, additional drivers may be needed. This
[link](https://github.com/NXPmicro/mfgtools/wiki/How-to-install-USB-to-serial-driver-on-Windows)
may help.

## Serial download mode

The serial download mode is used to enable UUU to communicate with the i.MX SoC.
The SoC enters serial download mode every time a boot media is not found. For
example, if the board is configured to boot from SDCard, but there is no SDCard
connected or the boot media does not have a valid bootloader copied into it.

In this example, the `SW2` dip switch is set to `1100` (follow the instructions
written on the board).

## Download the image

In this example the image used is from L4.14.62_1.0.0_Beta release. For i.MX
8QXP MEK download the pre-built image from [here](https://www.nxp.com/webapp/Download?colCode=L4.14.62_1.0.0_Beta_MX8QXp&appType=license&location=null&Parent_nodeId=1454108179417712493862&Parent_pageType=product)
(you must read and decide if you accept the license).

## UUU

UUU uses scripts with the same API used in MFGTools. The L4.14.62_1.0.0_beta
release pre-built image already includes some script examples, a README file for
UUU and the default script `uuu.auto` which flashes the default pre-built
`fsl-image-validation-imx-imx8qxpmek.sdcard` to eMMC.

The files related to UUU are listed with the following command:

```
$ unzip -l ~/Download/L4.14.62_1.0.0_beta_images_MX8QXPMEK.zip | grep uuu
      160  2018-10-18 05:40   README.uuu
     1775  2018-10-30 03:25   samples/uuu.xen
      526  2018-10-30 03:25   samples/example_spinor.uuu
     3171  2018-10-30 03:25   samples/example_kernel_emmc.uuu
      546  2018-10-30 03:25   samples/example_weimnor.uuu
      454  2018-10-30 03:25   samples/uuu.auto
     2795  2018-10-30 03:25   samples/example_kernel_nand.uuu
      434  2018-10-30 03:25   samples/example_sata.uuu
      591  2018-10-30 03:25   samples/uuu_sd_m4.auto
      570  2018-10-18 05:41   uuu.auto
```

The default use of UUU is to flash the eMMC using the pre-built image is show
bellow:

```
$ cp ~/Download/uuu .
$ chmod a+x uuu
$ sudo ./uuu ~/Download/L4.14.62_1.0.0_beta_images_MX8QXPMEK.zip
uuu (Universal Update Utility) for nxp imx chips -- libuuu_1.1.108-0-g5a7bfd2

Success 1    Failure 0

3:2    7/ 7   [Done                        ] FB: done
```
This command follows the instructions from `uuu.auto` automatically to flash the
board.

The progress can be followed in the board console:

```
U-Boot 2018.03-imx_v2018.03_4.14.62_1.0.0_beta+g7fac6b9 (Oct 16 2018 - 07:03:51 +0000)

CPU:   Freescale i.MX8QXP revB A35 at 1200 MHz at 27C
Model: Freescale i.MX8QXP MEK
Board: iMX8QXP MEK
Boot:  USB
DRAM:  3 GiB
TCPC:  Vendor ID [0x1fc9], Product ID [0x5110], Addr [I2C1 0x50]
MMC:   FSL_SDHC: 0, FSL_SDHC: 1
Loading Environment from MMC... Card did not respond to voltage select!
*** Warning - No block device, using default environment

Failed (-5)
[pcie_ctrlb_sata_phy_init_rc] LNK DOWN 8600000
In:    serial
Out:   serial
Err:   serial

 BuildInfo:
  - SCFW 07a6cccf, SECO-FW 31fabbff, IMX-MKIMAGE 7f7b5b25, ATF 30d73be
  - U-Boot 2018.03-imx_v2018.03_4.14.62_1.0.0_beta+g7fac6b9

Card did not respond to voltage select!
Detect USB boot. Will enter fastboot mode!
Net:
Warning: ethernet@5b040000 (eth0) using random MAC address - 46:98:d2:ce:23:f0
eth0: ethernet@5b040000 [PRIME]
Warning: ethernet@5b050000 (eth1) using random MAC address - d2:ce:c7:57:a3:43
, eth1: ethernet@5b050000
Fastboot: Normal
Boot from USB for mfgtools
Use default environment for                              mfgtools
Run bootcmd_mfg: run mfgtool_args;if iminfo ${initrd_addr}; then if test ${tee} = yes; then bootm ${tee_addr} ${initrd_addr} ${fdt_addr}; else booti ${loadaddr} ${initrd_addr};
Hit any key to stop autoboot:  0

## Checking Image at 83100000 ...
Unknown image format!
Run fastboot ...
1 setufp mode 0
1 cdns3_uboot_initmode 0
Detect USB boot. Will enter fastboot mode!
flash target is MMC:1
Card did not respond to voltage select!
MMC card init failed!
Card did not respond to voltage select!
** Block device MMC 1 not supported
Detect USB boot. Will enter fastboot mode!
flash target is MMC:0
switch to partitions #0, OK
mmc0(part 0) is current device
status: -104 ep 'ep1in' trans: 0
Detect USB boot. Will enter fastboot mode!
Starting download of 16776232 bytes
..........................................................................
.....................................................
downloading of 16776232 bytes finished
writing to partition 'all'
sparse flash target is mmc:0
writing to partition 'all' for sparse, buffer size 16776232
Flashing sparse image at offset 0
Flashing Sparse Image
........ wrote 16776192 bytes to 'all'
status: -104 ep 'ep1in' trans: 0
Starting download of 16776244 bytes
..........................................................................
.....................................................
downloading of 16776244 bytes finished
writing to partition 'all'
sparse flash target is mmc:0
writing to partition 'all' for sparse, buffer size 16776244
Flashing sparse image at offset 0
Flashing Sparse Image
........ wrote 16776192 bytes to 'all'
Starting download of 16776244 bytes
..........................................................................
.....................................................
downloading of 16776244 bytes finished
writing to partition 'all'
```

## Boot the board

Change the `SW1` to `0010`, reset the board, follow the output of serial console.

---
This post was originally posted on [i.MXDev Blog](https://imxdev.gitlab.io/).