---
title: "How to flash SDCards using bmaptool"
date: 2023-03-09 00:00:00 +0000
tags: ["image"]
---
Install the `bmap-tools`. I'm using Ubuntu, so for me, it's:

```bash
sudo apt install bmap-tools
```

For using `bmap-tools` you need two files:

- The `bmap` file
- The image file (in my case, it’s a `wic.gz` image file)

So the command is:

```bash
sudo bmaptool copy --bmap lmp-base-console-image-imx93-11x11-lpddr4x-evk.wic.bmap lmp-base-console-image-imx93-11x11-lpddr4x-evk.wic.gz /dev/mmcblk0

bmaptool: info: block map format version 2.0
bmaptool: info: 266179 blocks of size 4096 (1.0 GiB), mapped 153985 blocks (601.5 MiB or 57.9%)
bmaptool: info: copying image 'lmp-base-console-image-imx93-11x11-lpddr4x-evk.wic.gz' to block device '/dev/mmcblk0' using bmap file 'lmp-base-console-image-imx93-11x11-lpddr4x-evk.wic.bmap'
bmaptool: info: 100% copied
bmaptool: info: synchronizing '/dev/mmcblk0'
bmaptool: info: copying time: 51.0s, copying speed 11.8 MiB/sec
```

I should have spent time on this early in my life. 🙄

---

<aside>
<img src="https://www.notion.so/icons/drafts_green.svg" alt="https://www.notion.so/icons/drafts_green.svg" width="40px" /> **Home** **•**  [Pages](https://www.notion.so/Pages-66946fdd3188404796eada6badf1245d?pvs=21) **•**  [e-mail](mailto:angolini@gmail.com) **•**  [github](http://www.github.com/angolini) **•**

</aside>

---