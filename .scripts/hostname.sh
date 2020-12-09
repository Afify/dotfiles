#!/bin/sh

[ "$USER" != "root" ] && echo "Must run as root." && exit 1

if [ "$(uname)" = "OpenBSD" ]; then
	hostname openbsd && echo "openbsd" > /etc/myname &&\
	printf "127.0.0.1\topenbsd\tlocalhost\n::1\t\topenbsd\tlocalhost\n" > /etc/hosts

elif [ "$(uname)" = "Linux" ]; then
	hostname alien && echo "alien" > /etc/hostname &&\
	printf "127.0.0.1\talien\tlocalhost\n::1\t\talien\tlocalhost\n" > /etc/hosts
	sed -i 's/#hostname/hostname/' /etc/dhcpcd.conf
	sv restart dhcpcd
fi
