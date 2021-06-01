#!/bin/sh

umask 077
export EDITOR=nvim
export VISUAL=nvim
export GPG_TTY=$(tty)
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export ENV=~/.config/ksh/kshrc
export R2_RCFILE=~/.config/radare2rc
export HISTSIZE=10000
export HISTCONTROL=ignoredups
export HISTFILE=~/.cache/.sh_history
export GTK2_RC_FILES=~/.config/gtk-2.0/gtkrc-2.0
export PATH="$PATH:/mnt/data/dev/clones/flutter/bin"
export MANPATH="/usr/local/share/man:/usr/local/man:/usr/share/man:/usr/X11R6/man"
export JAVA_HOME="$HOME/android-studio/jre/"
export _JAVA_AWT_WM_NONREPARENTING=1
export LESSHISTFILE="-"
export LESS_TERMCAP_mb="$(printf '\33[38;5;214m')"
export LESS_TERMCAP_md="$(printf '\33[38;5;214m')"
export LESS_TERMCAP_me="$(printf '\33[0m')"
export LESS_TERMCAP_so="$(printf '\33[1;44;37m')"
export LESS_TERMCAP_se="$(printf '\33[0m')"
export LESS_TERMCAP_us="$(printf '\33[38;5;166m')"
export LESS_TERMCAP_ue="$(printf '\33[0m')"
export LESS=-r

if [ "$(uname -s)" = "Linux" ]; then
	export HW=$(cat /sys/devices/virtual/dmi/id/sys_vendor /sys/devices/virtual/dmi/id/product_name)
else
	export HW="$(sysctl -n hw.vendor) $(sysctl -n hw.product)"
fi
