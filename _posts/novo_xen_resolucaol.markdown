Following the i.MX Virtualization User's Guide, on step 11, instead of:

    xl create /etc/xen/domu-imx8qm-mek-androidauto.cfg 

 

use

    xl create /etc/xen/domu-imx8qm-mek-androidauto.cfg ; xl console DomU

 

it will give you early access to the DomU prompt, so you can stop the DomU bootloader. Just after the command press any key repetitively (to stop u-boot prompt)

In that prompt enter:

 

    setenv append_bootargs androidboot.displaymode=720p

    boota mmc0

 

and them the screen should have the different resolution


For linux:

change the Weston.ini, uncomment the [ountput] configuration,

 

815$ cat /etc/xdg/weston/weston.ini

[core]

#gbm-format=argb8888

idle-time=0

#use-g2d=1

xwayland=true

 

#[shell]

#size=1920x1080

 

[libinput]

touchscreen_calibrator=true

 

#[output]

#name=HDMI-A-1

#mode=1280x720@60

#transform=90

 

#[output]

#name=HDMI-A-2

#mode=off

#     WIDTHxHEIGHT    Resolution size width and height in pixels

#     off             Disables the output

#     preferred       Uses the preferred mode

#     current         Uses the current crt controller mode

#transform=90

 

[screen-share]

command=/usr/bin/weston --backend=rdp-backend.so --shell=fullscreen-shell.so --no-clients-resize

 

For android, please search for androidboot.displaymode in Android User Guide. Please use one of the supported resolutions
