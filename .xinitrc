#!/bin/sh

exec xbacklight -set 20 &
exec wsconsctl keyboard.backlight=0 &
exec redshift -P -O 3000 -m randr &
exec xsetroot -solid black &
exec slstatus &
exec setxkbmap -option caps:none &
exec xbanish -m ne &
exec dwm
