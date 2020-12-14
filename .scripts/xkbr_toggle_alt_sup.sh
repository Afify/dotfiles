#!/bin/sh

# Alt_L=64
# Super_L=115
# Control_L=37

# Alt_R=113
# Super_R=116
# Control_R=109

switch(){
	echo switch
	xmodmap -e "clear mod1"
	xmodmap -e "clear mod4"
	xmodmap -e "keycode 115 = Alt_L"
	xmodmap -e "keycode 64 = Super_L"
	xmodmap -e "add mod1 = Alt_L"
	xmodmap -e "add mod4 = Super_L"
}

restore(){
	echo restore
	xmodmap -e "clear mod1"
	xmodmap -e "clear mod4"
	xmodmap -e "keycode 115 = Super_L"
	xmodmap -e "keycode 64 = Alt_L"
	xmodmap -e "add mod1 = Super_L"
	xmodmap -e "add mod4 = Alt_L"
	setxkbmap
}

# get current value of Alt_L
alt=$(xmodmap | awk '/mod1/ {print $3}' | tr -d '(),')

if [ "$alt" = "0x40" ]; then
	switch
elif [ "$alt" = "0x73" ]; then
	restore
fi
