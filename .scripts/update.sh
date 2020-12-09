#!/bin/sh
[ "$USER" != "root" ] && echo "Must run as root." && exit 1
case $(uname) in
	Linux) xbps-install -Syu && xbps-remove -Ooy;;
	OpenBSD) fw_update && sysupgrade -s && pkg_add -Uu && pkg_delete -a && pkg_check;;
esac
