---
title: How to install a lot of gstreamer ugly plugins
date: 2017-07-11 14:13:43
author: daiane
tags: [yocto, GStreamer, ugly, asf, libav]
---

Are you in a hurry and need to install every ugly plugin in yocto? Don't think twice.



Add the following on your `build/conf/local.conf`:

```
CORE_IMAGE_EXTRA_INSTALL += "gstreamer1.0-plugins-ugly-meta \
                             packagegroup-fsl-gstreamer1.0-commercial "
LICENSE_FLAGS_WHITELIST += "commercial"
CORE_IMAGE_EXTRA_INSTALL += "gstreamer1.0-plugins-ugly"

PACKAGECONFIG_append_pn-gstreamer1.0-plugins-ugly = " x264 mad \
                                                  amrnb  amrwb dvdread "
```

The packagegroup `packagegroup-fsl-gstreamer1.0-commercial` only works if you have
the metalayer `meta-freescale-distro` in your `BBLAYERS`.

It brings `asf` and `libav`.

It also brings `packagegroup-fsl-gstreamer1.0.bb` which includes basically lots
of gstreamer packages (see the complete list
[here](https://github.com/Freescale/meta-freescale-distro/blob/master/recipes-fsl/packagegroups/packagegroup-fsl-gstreamer1.0.bb)).

It's your responsibility to understand what **commercial** license means.
{: .notice--danger}

If you are not in a hurry, it's advisable to include `gstreamer1.0-plugins-ugly_%.bbappend`
with your tailored configuration using as example the [post](https://imxdev.gitlab.io/tutorial/Encoding_and_decoding_H264_without_VPU/)

---
This post was originally posted on [i.MXDev Blog](https://imxdev.gitlab.io/).