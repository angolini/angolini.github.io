---
title: Hardware rework on imx6QP Sabre SD RevA1 for Murata WiFi BT module
date: 2017-07-07 09:56:44
author: daiane
tags: [murata,wifi,bluetooth,IMX6QP,LBEH5HMZPC]
---

This post shows the hardware rework needed to get Murata WiFi/BT module working
on early version of i.MX6QP Sabre SD Rev A boards connected on `J13`.

The i.MX6QP Sabre SD Rev A2 (SCH-28857_A2) does **not** need hardware rework as
the hardware is by default configured to be used with WiFi/BT module"
{: .notice--warning}

# I.MX6QP Sabre SD Rev A

## Explanation

The i.MX6QP share the same pin for SPI NOR Flash and WiFi/BT control. By
default the i.MX6QP Sabre SD Rev A (SCH-28857_A) hardware is configured to use
the SPI NOR controller. So we need to rework the board to be able to use the
connector `J13` to support WiFi/BT Murata signals.

In the board revision A2 (SCH-28857_A2) the hardware is configured by default to
support WiFi/BT over `J13`, so no rework is needed.

If you own a **SCH-28857_A** board and want to test WiFi/BT Murata modules, you
need the Murata Quick Start Guide, section **2.3 Connecting to i.MX
6Q/DL SDB/SDP or i.MX 6 QP SDB**, which details the change needed. The link to
this file can be found at the end of this post, at **External Links** section.
The same information is also included in the **i.MX6QP Schematics**, file
`SPF-28857_A2.pdf`, page 15.

Those documents instruct the rework: depopulated the SPI NOR FLASH
U14 and populate the resistors `R209`-`R213`.

But with a quick review from the same files it's easy to spot that there is a
typo.  Resistors `R209`-`R215` are the right set of resistors to be populated.

## The rework

Only to make it clear. The needed rework on imx6QP Sabre SD RevA board is:

Depopulated the SPI NOR FLASH (if present) and populate `R209`, `R210`, `R211`,
`R212`, `R213`, `R214`, `R215`.
{: .notice--success}

## Pictures

The picture below shows the final result after the rework:

<img src="{{ absolute_url }}/images/rework-sabresd-reva1.png">

To help you locate the right pads, see a snapshot of `DNP-28857_A.pdf` layout file:

<img src="{{ absolute_url }}/images/layout.png" width="50%">

The tested module was LBEH5HMZPC-TEMP-DS-SD (Type ZP EVK+). See the connections
in the picture below:

<img src="{{ absolute_url }}/images/imx6qpsabresd-wifibt-module.jpg">

The files `SPF-28857_A2.pdf` and `DNP-28857_A.pdf` are included in **i.MX6QP Schematics**.

## External Links

1. [Murata Quick Start Guide](http://wireless.murata.com/RFM/data/murata_quick_start_guide_linux.pdf){: .btn .btn--info}
2. [i.MX6QP Sabre SD Schematics](https://www.nxp.com/webapp/Download?colCode=i.MX6_SABRE_SDP_DESIGNFILES&appType=license&Parent_nodeId=1337723891654732089522&Parent_pageType=product
){: .btn .btn--info}

---
This post was originally posted on [i.MXDev Blog](https://imxdev.gitlab.io/).