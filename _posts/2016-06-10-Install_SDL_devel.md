---
title: Install SDL devel
redirect_from:  blog/tutorial/2016/06/10/Install_SDL_devel/
date: 2016-06-10 09:52:01
author: daiane
tags: [yocto, poky, error, SDL, jethro,L4.1.15_1.0.0_GA]
---
When working with **imx-4.1.15-1.0.0_ga** you may face the following error

```console
NOTE: Preparing RunQueue
NOTE: Executing SetScene Tasks
NOTE: Executing RunQueue Tasks
ERROR: Function failed: do_configure (log file is located at /code/yocto/imx-4.1.15-1.0.0_ga/build-x11/tmp/work/x86_64-linux/qemu-native/2.4.0-r1/temp/log.do_configure.5724)
ERROR: Logfile of failure stored in: /code/yocto/imx-4.1.15-1.0.0_ga/build-x11/tmp/work/x86_64-linux/qemu-native/2.4.0-r1/temp/log.do_configure.5724
Log data follows:
| DEBUG: Executing python function sysroot_cleansstate
| DEBUG: Python function sysroot_cleansstate finished
| DEBUG: Executing shell function autotools_preconfigure
| DEBUG: Shell function autotools_preconfigure finished
| DEBUG: Executing python function autotools_copy_aclocals
| DEBUG: Python function autotools_copy_aclocals finished
| DEBUG: Executing shell function do_configure
|
| ERROR: User requested feature sdl
|        configure was not able to find it.
|        Install SDL devel
|
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_configure (log file is located at /code/yocto/imx-4.1.15-1.0.0_ga/build-x11/tmp/work/x86_64-linux/qemu-native/2.4.0-r1/temp/log.do_configure.5724)
ERROR: Task 5 (virtual:native:/code/yocto/imx-4.1.15-1.0.0_ga/sources/poky/meta/recipes-devtools/qemu/qemu_2.4.0.bb, do_configure) failed with exit code '1'
NOTE: Tasks Summary: Attempted 306 tasks of which 301 didn't need to be rerun and 1 failed.
No currently running tasks (306 of 310)

```

## TL;DR;
This is already fixed on `jethro` branch of poky. So in order to fix it:

1. Update Poky:

```console
$ cd sources/poky
$ git remote update
$ git checkout yocto/jethro -b jethro
$ git pull
```

2. Fix `local.conf` by commenting (or **deleting**) the line `ASSUME_PROVIDED += "libsdl-native"`

## Understand

Originally the **SDL devel** package was not integrated properly in Poky, so it was "ASSUMEd PROVIDED" by the local host machine. However, it was causing troubles on several machines (such as Ubuntu 15.10). So community worked to get it integrated asap, so now it's not needed anymore to assume it is provided by host machine.

When you download the `fsl-arm-yocto-bsp.git` repository, the manifest used points to a poky commit id, so it does not automatically update the jethro bugfixes.

In addition, your `<build-dir>/conf/local.conf` was created using this old copy of poky, so it was created assuming SDL devel package is provided by host machine, and now you need to update it removing this assumption.

By removing this assumption, BitBake understands the SDL devel inside Yocto Project must be included.

## External References

<https://lists.yoctoproject.org/pipermail/poky/2014-July/009800.html>

<https://bugzilla.yoctoproject.org/show_bug.cgi?id=8553>

---
This post was originally posted on [i.MXDev Blog](https://imxdev.gitlab.io/).