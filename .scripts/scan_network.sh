#!/bin/sh

cn=$(sh ~/.scripts/network ips |  awk -F "." '{print $1"."$2"."$3}')
count=$(echo "$cn" | wc -l)

if [ "$count" -gt 0 ]; then
	net_ip=$(echo "$cn" | dmenu -l 10 -p "Select network: ")
else
	net_ip=$cn
fi

case $1 in
	ssh) arg='-p22 --open';;
	*) arg='-sP';;
esac

nmap $arg $net_ip.0/24 | grep -E "$net_ip" | sed 's/.*for //g'
