#!/bin/sh
[ "$(uname)" = "OpenBSD" ] && [ $(apm -l) -lt 100 ] && case $(apm -a) in
	0) echo  $(apm -l)% $(apm -m) ;;
	1) echo  $(apm -l)% ;; esac && exit
