#!/bin/sh

hdmi_active=$(xrandr | grep "^HDMI.* connected")
[ -n "$hdmi_active" ] && xrandr --output DP-0  --off && \
	xrandr --output "$hdmi_active" --auto
exec xbacklight -set 20 &
exec wsconsctl keyboard.backlight=0 &
exec redshift -P -O 3000 -m randr &
exec xsetroot -solid black &
exec slstatus &
exec setxkbmap -option caps:none &
exec xbanish -m ne &
#exec xinput set-prop "SynPS/2 Synaptics TouchPad" 357 1
#exec xinput set-prop "SynPS/2 Synaptics TouchPad" 337 1
exec dwm
