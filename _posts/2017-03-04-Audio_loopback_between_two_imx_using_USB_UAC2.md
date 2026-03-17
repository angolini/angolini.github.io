---
title: Audio loopback between two imx using USB UAC2
date: 2017-02-24 10:41:21
author: daiane
tags: [usb, L4.1.15_2.0.0_GA, IMX7D, IMX6UL]
---

UAC can be used to transfer audio using the USB connection. This tutorial shows
in 5 command lines how to get a loopback to hear the microphone from one imx out
from the speaker output of another imx, only using a USB cable to connect them,
and the following command lines.


{% capture notice-text %}
* UAC2 is not supported by windows but supports both playback and capture;
* UAC1 is supported by windows, but only supports playback.
{% endcapture %}


<div class="notice--success">
  <h4>UAC1 and UAC2 support:</h4>
  {{ notice-text | markdownify }}
</div>
{: .notice--success}

See the connections I used in the following image.

<img src="{{ absolute_url }}/images/audio-loopback.jpg ">

How to record the remote audio
----------

The following procedure plays the `Kaleidoscope` wav file in i.MX7D board and
transfers it to i.MX6UL board thought the USB cable recording it to `file_48.wav`.

```
1. modprobe g_audio c_srate=48000 (IMX7)
2. arecord -Dhw:1 -r 48000 -c 2 -f S16_LE -d 200 file_48.wav (IMX6UL)
3. aplay -Dhw:2 /run/media/sda1/Kaleidoscope_raw_48.wav (IMX7)
```

LOOPBACK
--------

The following procedure take the audio from the attached microphone on i.MX7D,
transfers it to i.MX6UL and play it on the headphone (see picture)

```
4. arecord -f dat -t wav -D hw:0,0 | aplay -D hw:2,0 (IMX7)
5. arecord -f dat -t wav -D hw:1,0 | aplay -D hw:0,0 (IMX6UL)
```


{% capture notice-text2 %}

* I used step 2 and 3 to test the environment to be able to get to steps 4 and 5.
* I used kernel from L4.1.15-2.0.0 GA.
{% endcapture %}


<div class="notice--info">
  <h4>Environment:</h4>
  {{ notice-text2 | markdownify }}
</div>

Debug information
-----------------

See above the sound cards I have just after the modprobe command line on each
imx7D Sabre SD and imx6UL EVK boards.

```
root@imx7dsabresd:~# modprobe g_audio c_srate=48000
g_audio gadget: Linux USB Audio Gadget, version: Feb 2, 2012
g_audio gadget: g_audio ready
g_audio gadget: high-speed config #1: Linux USB Audio Gadget
root@imx7dsabresd:~# aplay -l
**** List of PLAYBACK Hardware Devices ****
card 0: wm8960audio [wm8960-audio], device 0: HiFi wm8960-hifi-0 []
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 1: sii902xaudio [sii902x-audio], device 0: sii902x hdmi snd-soc-dummy-dai-0 []
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 2: UAC2Gadget [UAC2_Gadget], device 0: UAC2 PCM [UAC2 PCM]
  Subdevices: 1/1
  Subdevice #0: subdevice #0


root@imx6ulevk:~# aplay -l
**** List of PLAYBACK Hardware Devices ****
card 0: wm8960audio [wm8960-audio], device 0: HiFi wm8960-hifi-0 []
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 0: wm8960audio [wm8960-audio], device 1: HiFi-ASRC-FE (*) []
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 1: Gadget [Linux USB Audio Gadget], device 0: USB Audio [USB Audio]
  Subdevices: 1/1
  Subdevice #0: subdevice #0
```

---
This post was originally posted on [i.MXDev Blog](https://imxdev.gitlab.io/).