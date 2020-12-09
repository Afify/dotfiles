#!/bin/sh
[ "$(uname)" != "Linux" ] && exit
jbl="FC:A8:9A:57:A4:8A"
j_status=$(bluetoothctl info $jbl | awk '/Connected/ {print $2}')
[ "$j_status" = "yes" ] && echo ""
[ "$a_status" = "yes" ] && echo ""
