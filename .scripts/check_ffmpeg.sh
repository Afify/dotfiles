#!/bin/sh

is_recording=$(pgrep -f "ffmpeg -f" | wc -l)
if [ "$is_recording" -gt 0 ]; then
	echo " 辶 "
fi
