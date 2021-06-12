#!/bin/sh

[ "$USER" != "root" ] && echo "Must run as root." && exit 1

mkdir /root/.config
ln -s /home/hassan/.local/share/nvim/site /root/.local/share/nvim/site
ln -s /home/hassan/.config/nvim   /root/.config/nvim
ln -s /home/hassan/.vim           /root/.vim
ln -s /mnt/data/todo.txt          /home/hassan/

if [ "$(uname)" = "Linux" ]; then
	ln -s /home/hassan/android-studio/bin/studio.sh /usr/local/bin/android-studio
	ln -fs /bin/clang               /bin/cc
	ln -fs /bin/ld.lld              /bin/ld
	ln -s /etc/sv/wpa_supplicant    /var/service/
	ln -s /etc/sv/ntpd              /var/service/
	ln -s /etc/sv/apache            /var/service/
	ln -sf /etc/sv/mysqld           /var/service/
# 	ln -s /etc/sv/sshd		/var/service/
# 	ln -s /etc/sv/bluetoothd	/var/service/
fi

[ "$(uname)" = "OpenBSD" ] && ln -s /home/hassan/dev /mnt/data/dev
