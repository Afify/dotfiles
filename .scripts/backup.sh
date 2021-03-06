#!/bin/sh

# gpgconf --kill gpg-agent
# gpg2 --export 965AEAEBA391E4441D997BE1CBBC1F408F97EB2B > /mnt/usb1/public.key
# gpg2 --export-secret-key 965AEAEBA391E4441D997BE1CBBC1F408F97EB2B > /mnt/usb1/private.key


add_gpg_keys(){
	all_keys=$(gpg2 --list-secret-keys --with-colons | awk -F: "/^sec.*\$/ {print \$5}")
	for each_key in $all_keys
	do
		if ! gpg2 --export-secret-keys $each_key > /tmp/$each_key.pri; then
			exit
		fi
		if ! gpg2 --export $each_key > /tmp/$each_key.pub; then
			exit
		fi
	done
	keys=$(cd /tmp && ls *.pri *.pub)
	tar -cvf "$of" -C /tmp $keys
	rm -rf /tmp/*.pri /tmp/*.pub
}

compress(){
	add_gpg_keys
	tar -rvf "$of" -C $HOME $files
	gzip "$of"
}

check_default_dis(){
	if [ ! -d "$default_dis" ]
	then dis=$(df | grep -Eo "/mnt/[a-zA-Z0-9]+" |\
			dmenu -i -p "Default Not found Select other destination ")
	else dis=$default_dis
	fi
}

today=$(date +%Y_%m_%d)
files=".ssh .password-store"
default_dis="/mnt/4tb/backups"
check_default_dis
of=$dis/home_$today.tar

if [ ! "$dis" ] || [ ! -d "$dis" ] || [ -f "$of.gz" ]; then
	echo "$of";exit 1
fi


if compress; then
	notify-send "Backup Completed Succesfully"
else
	 notify-send -u critical "Backup Failed"
fi

# Note
# c – Creates a new .tar archive file.
# v – Verbosely show the .tar file progress.
# f – File name type of the archive file.
# j - for bzip2
# z - for gzip
# r - append to tar
# veracrypt
