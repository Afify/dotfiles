#!/bin/sh
[ "$USER" != "root" ] && echo "Must run as root." && exit 1
wifi=$(ifconfig | awk '/wlp/ {print $1}' | tr -d ':')
ssid=$1
pass=$2
wpa_passphrase $ssid $pass >> /etc/wpa_supplicant/wpa_supplicant-$wifi.conf
sv restart dhcpcd
wpa_cli -i $wifi reconfigure
