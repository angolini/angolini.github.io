---
title: "How to update dtb or Image when booting lmp-base"
date: 2024-08-12 00:00:00 +0000
tags: ["lmp"]
---
The first step is to enable (or review if this is already enabled) the UMS fragment into the U-Boot configuration. Reference: https://docs.foundries.io/latest/porting-guide/pg-spl-uboot-fragments.html#creating-the-u-boot-configuration-fragments

The fragment to be added:

```bash
CONFIG_CMD_USB_MASS_STORAGE=y
```

After that, rebuild the image, reflash to the board.

Booting the board, stop at U-Boot prompt:

```bash
u-boot=> **mmc list** 
FSL_SDHC: 1
FSL_SDHC: 2 (eMMC)

u-boot=> **mmc dev 2**
switch to partitions #0, OK
mmc2(part 0) is current device
u-boot=> **mmc part**

Partition Map for MMC device 2  --   Partition Type: DOS

Part    Start Sector    Num Sectors     UUID            Type
  1     16384           170392          30ca3544-01     0c Boot
  2     196608          30580736        30ca3544-02     83

u-boot=> **fatls mmc 2:1**
 30560768   Image
      170   boot.scr
   200231   imx-boot
    66144   imx8mm-evk-8mic-revE.dtb
    66521   imx8mm-evk-8mic-swpdm.dtb
    63476   imx8mm-evk-ak4497.dtb
    63071   imx8mm-evk-ak5558.dtb
    63143   imx8mm-evk-audio-tdm.dtb
    62957   imx8mm-evk-dpdk.dtb
    62868   imx8mm-evk-ecspi-slave.dtb
     3717   imx8mm-evk-inmate.dtb
    64218   imx8mm-evk-lk.dtb
    63159   imx8mm-evk-pcie-ep.dtb
    63171   imx8mm-evk-qca-wifi.dtb
    63195   imx8mm-evk-revb-qca-wifi.dtb
    63586   imx8mm-evk-rm67191-cmd-ram.dtb
    63586   imx8mm-evk-rm67191.dtb
    63559   imx8mm-evk-rm67199-cmd-ram.dtb
    63559   imx8mm-evk-rm67199.dtb
    64172   imx8mm-evk-root.dtb
    65206   imx8mm-evk-rpmsg-wm8524-lpv.dtb
    65218   imx8mm-evk-rpmsg-wm8524.dtb
    64758   imx8mm-evk-rpmsg.dtb
    62999   imx8mm-evk-usd-wifi.dtb
    63051   imx8mm-evk.dtb
  1594770   u-boot.itb
      387   uEnv.txt

27 file(s), 0 dir(s)

u-boot=> **ums mmc 2:1**
UMS: LUN 0, dev mmc 2, hwpart 0, sector 0x4000, count 0x29998
Failed to configure default pinctr
```

Here we have 5 commands:

- `mmc list`: list the available mmc devices. In the example, we have 1 and 2, and 2 is the emmc. If an SDCard was inserted, 1 would be the SDCard.
- `mmc dev 2`: my target is emmc, so for me it’s dev 2. This command switches the default dev
- `mmc part`: this is used to list all the partitions in this device. The example shows 2 partitions
- `fatls mmc 2:1`: in this example, I know the partition is a FAT partition (because it’s a lmp-base boot partition), but only to make sure, let’s see the files of `2:1` to make sure it is what we think it is.
- `ums mmc 2:1`: it will finally mount the partition 1 from device 2 of an mmc device using the USB C cable connected to the DEBUG port. Make sure to bring that cable to a linux pc host. The partition will be mounted on the host and we can now copy over new files.

---

<aside>
<img src="https://www.notion.so/icons/drafts_green.svg" alt="https://www.notion.so/icons/drafts_green.svg" width="40px" /> **Home** **•**  [Pages](https://www.notion.so/Pages-66946fdd3188404796eada6badf1245d?pvs=21) **•**  [e-mail](mailto:angolini@gmail.com) **•**  [github](http://www.github.com/angolini) **•**

</aside>

---