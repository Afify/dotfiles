#!/bin/sh

if [ "$(uname)" = "Linux" ]; then
	[ "$(rfkill -rn | awk '/wlan/ {print $4}')" = "blocked" ] && result=""
	[ "$(rfkill -rn | awk '/bluetooth/ {print $4}')"   = "blocked" ] && result=$result" "
	printf "%s" "$result"
fi
