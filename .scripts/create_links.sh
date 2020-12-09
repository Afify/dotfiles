#!/bin/sh

[ "$USER" != "root" ] && echo "Must run as root." && exit 1

ln -s /home/hassan/.vimrc	/root/.vimrc
ln -s /home/hassan/.vim		/root/.vim
ln -s /mnt/data/todo.txt	/home/hassan/

if [ "$(uname)" = "Linux" ]; then
	ln -fs /bin/clang		/bin/cc
	ln -fs /bin/ld.lld		/bin/ld
	ln -s /etc/sv/wpa_supplicant	/var/service/
	ln -s /etc/sv/ntpd		/var/service/
	ln -s /etc/sv/sshd		/var/service/
	ln -s /etc/sv/bluetoothd	/var/service/
fi

[ "$(uname)" = "OpenBSD" ] && ln -s /home/hassan/dev /mnt/data/dev
