#!/bin/sh

case $(uname) in
	Linux) unmuted_count=$(pactl list sources| grep -c 'Mute: no')
		[ "$unmuted_count" -gt 0 ] && echo " $unmuted_count 壘 ";;
	OpenBSD) [ "$(sysctl -n kern.audio.record)" -gt 0 ] && echo " 壘 ";;
esac
