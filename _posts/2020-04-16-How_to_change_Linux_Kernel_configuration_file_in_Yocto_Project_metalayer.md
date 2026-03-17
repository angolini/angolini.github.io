---
layout: post
title: How to change Linux Kernel configuration file in Yocto Project metalayer
date: 2020-04-16 10:54:20
---

It is common that the metalayer providing a Linux Kernel recipe includes a default configuration file for the Linux Kernel source code (the `defconfig` file).

There are several approaches to customize the Linux Kernel source code and `defconfig` file. This article presents the option to patch the defconfig from the Linux Kernel source code and is a good approach to be used with `meta-fsl-bsp-release` or `meta-imx`.

## Preparing the requirements

The list of requirements:

* the target metalayer (in this example, it's `meta-imx:imx-5.4.3-2.0.0`)
* the same Linux Kernel source code, but git cloned


### Download the metalayer

For example, take BSP release `imx-5.4.3-2.0.0` for [`meta-imx`](https://source.codeaurora.org/external/imx/meta-imx/log/?h=zeus-5.4.3-2.0.0)

```
$ repo init -u https://source.codeaurora.org/external/imx/imx-manifest  -b imx-linux-zeus -m imx-5.4.3-2.0.0.xml
$ repo sync
$ MACHINE=imx8mnevk DISTRO=fsl-imx-xwayland source ./imx-setup-release.sh -b bld-xwayland
```

### Git clone the Linux Kernel source code

Use the very same Linux Kernel source code from the metalayer. In this example, open the file `sources/meta-imx/meta-bsp/recipes-kernel/linux/linux-imx_5.4.bb` to get the git repository, and git commit.

```
$ git clone git://source.codeaurora.org/external/imx/linux-imx.git
$ cd linux-imx
$ git checkout fd263a3edd95dfe812397fabf1059b5f99bba2ab -b change_defconfig

```

### Customize the configuration

Using the default `defconfig` as a base, configure the Linux Kernel, and then use `make menuconfig` to change the configuration as desired.

After the customization, generate a new `defconfig` file and replace the default one.

The step by step with all the commands can be see in next snippet:

```
$ export ARCH=arm64
$ export CROSS_COMPILE=aarch64-linux-gnu-
$ make defconfig
$ make menuconfig
$ make savedefconfig
$ cp defconfig arch/arm64/configs/defconfig

```

The customization can be highlighted by git, in this example the result is show in next log:

```shell
$ git status
On branch change_defconfig
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)

	modified:   arch/arm64/configs/defconfig

Untracked files:
  (use "git add <file>..." to include in what will be committed)

	defconfig

no changes added to commit (use "git add" and/or "git commit -a")
```

Review the change and create a commit, with that commit, create a patch.

TIP: The `defconfig` file can also be directly changed. The `make menuconfig` can be skipped in that case.

```
$ git add arch/arm64/configs/defconfig
$ git commit  -s -m "defconfig: Customize defconfig"
$ git format-patch -1
0001-defconfig-Customize-defconfig.patch
```

### Copy the configuration to the metalayer

Now that the Linux Kernel configuration is customized, and a patch to the kernel is created, copy over that patch to the metalayer, and install it to the Linux Kernel recipe file.

```
$ mkdir <BSP_DIR>/sources/meta-imx/meta-bsp/recipes-kernel/linux/linux-imx/
$ cp 0001-defconfig-Customize-defconfig.patch <BSP_DIR>/sources/meta-imx/meta-bsp/recipes-kernel/linux/linux-imx/
```


### Install the patch in the Linux Kernel recipe

The Linux Kernel recipe for this example is `linux-imx_5.4.bb`. Edit the file to install the patch.

```shell
$ gedit <BSP_DIR>/sources/meta-imx/meta-bsp/recipes-kernel/linux/linux-imx_5.4.bb
```
Add the following line:

```python
SRC_URI += "file://0001-defconfig-Customize-defconfig.patch "
```

The resultant change is show above:

```shell
cd sources/meta-imx/

$ git diff
diff --git a/meta-bsp/recipes-kernel/linux/linux-imx_5.4.bb b/meta-bsp/recipes-kernel/linux/linux-imx_5.4.bb
index 214647abb..3f926314c 100644
--- a/meta-bsp/recipes-kernel/linux/linux-imx_5.4.bb
+++ b/meta-bsp/recipes-kernel/linux/linux-imx_5.4.bb
@@ -16,6 +16,7 @@ KERNEL_BRANCH ?= "imx_5.4.3_2.0.0"
 LOCALVERSION = "-2.0.0"
 KERNEL_SRC ?= "git://source.codeaurora.org/external/imx/linux-imx.git;protocol=https"
 SRC_URI = "${KERNEL_SRC};branch=${KERNEL_BRANCH}"
+SRC_URI += "file://0001-defconfig-Customize-defconfig.patch "

 SRCREV = "fd263a3edd95dfe812397fabf1059b5f99bba2ab"
```

### Build the new image with the different Linux Kernel configuration

Remember to change the current directory to the metalayer.

Build the image again. The new image binary reflects the changes in Linux Kernel, and in case the change removes some kernel module, the rootfs also reflects the change.

```
$ cd <BSP_DIR>/bld-xwayland
$ bitbake <image-name>
```

<!---
Copyright 2020 NXP
To generate the HTML:

$ pandoc -s howto.md -o yocto-defconfig.html
-->
