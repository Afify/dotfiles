#!/bin/sh

[ "$(uname)" = "OpenBSD" ] && [ $(apm -l) -lt 100 ] && case $(apm -a) in
	0) echo  $(apm -l)% $(apm -m) ;;
	1) echo  $(apm -l)% ;; esac && exit

[ "$(uname)" = "Linux" ] && bstatus=$(acpi | awk '/Battery 0:/ {print $3}') &&\
	case $bstatus in
		Full,) exit ;;
		Discharging,) acpi | awk '/Battery 0:/ {print " "$4" "$5}' ;;
		Charging,)    acpi | awk '/Battery 0:/ {print " "$4" "$5}' ;;
# 		*) echo "" ;;
	esac
