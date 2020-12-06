#!/bin/sh

[ "$(uname)" != "Linux" ] && exit

jbl="FC:A8:9A:57:A4:8A"
anne="4C:24:98:32:B7:01"
j_status=$(bluetoothctl info $jbl | awk '/Connected/ {print $2}')
a_status=$(bluetoothctl info $anne | awk '/Connected/ {print $2}')
[ "$j_status" = "yes" ] && echo ""
[ "$a_status" = "yes" ] && echo ""
