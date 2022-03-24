---
title: How to install apt-get to the Yocto Project image
date: 2017-10-11 10:46:57
author: daiane
tags: [install, yocto, IMX6, apt-get]
---

This post brings the step-by-step on how to configure an Yocto Project image to
get `apt-get` installed in your development machine.

After the step-by-step, there is a section to explain the commands, and then
why this tutorial is not recommended for production (only development).

# The step-by-step

1. Change the `build/conf/local.conf` by adding the following lines
```
PACKAGE_CLASSES = "package_deb"
PACKAGE_FEED_URIS = "http://<local-machine-ip>:5678"
EXTRA_IMAGE_FEATURES += " package-management "
```
2. Choose an image, for example, `core-image-full-cmdline`
```console
$ bitbake core-image-full-cmdline
```
3. When it's ready, create the package index:
```console
$ bitbake package-index
```
4. Export the package index to the *world*
```console
$ cd build/tmp/deploy/deb
$ python -m SimpleHTTPServer 5678
```
5. Deploy the image to the target
```console
$ sudo dd if=core-image-full-cmdline.wic of=/dev/sdX
```
6. Boot your target and update it
```console
$ apt-get update
```
7. At this point, only packages listed by `core-image-full-cmdline` are
available on the package index, so we need to build something different. For
example, GStreamer.
(**don't forget to update the package index as well**)
```console
$ bitbake gstreamer1.0
$ bitbake package-index
```
8. Update the target and install the package (**don't forget to be connected**)
```console
$ apt-get update
$ apt-cache search gstreamer1.0
$ apt-get install gstreamer1.0
```

# Understanding

The variable `PACKAGE_CLASSES`[1] defines the which package manager used to
build the packages (among RPM, DEB, and IPK). It is common to hear people
talking about `apt-get` as a synonym of package management, but there are other
programs and package managers (such as smart, dnf, opkg).

The default for Poky distro is RPM. Choosing the package manager for your
application is out of this post scope, as it's a complex decision. There are
several articles debating this topic on the Internet.

It's one of the BitBake's tasks to create the packages to be installed in the
images, so any BitBake command generates the packages under the directory
`build/tmp/deploy/<rpm>` in the RPM example.

BitBake can also create the package index, a complete list of all the packages
inside that directory and available to be installed.
When the target has the right packages installed and is configured to search for
the package index in the right `IP:PORT`, the developer can take advance of
those already built packages to ease the development cycle.

In case, for any reason, the local machine IP changes after the image is
deployed, change the file `/etc/apt/sources.list` from the target rootfs with
the new IP address.

# Why this is a development only approach?

During the development cycle we are more interested in getting the package
installed without the hassle of building and copying another image file.
There is no real worry about how long the package will be available or to who.

However, during the production there are a lot of other important questions to
think about, for example:

- is the HTTP server secure?
- is the package dependency chain fulfilled properly?
- is the package dependency chain of all the package version fulfilled?
- in case one package is updated, all the dependency chain must be updated?

During the development phase, we think more about installing missing packages,
however during the production phase the most important point is to properly
update the packages.

If you are looking for help on how to properly have package management installed
during the production phase, I highly recommend you to contact a professional.
Follow this tutorial at your own risk!
{: .notice--danger}

[1]:http://www.yoctoproject.org/docs/current/mega-manual/mega-manual.html#var-PACKAGE_CLASSES

---
This post was originally posted on [i.MXDev Blog](https://imxdev.gitlab.io/).