#!/bin/sh

import_gpg(){
	cd "$default_des"
	allkeys=$(ls *.pri)
	for eachkey in $allkeys; do
		gpg2 --import "$default_des/$eachkey"
		rm -rf "$default_des/$eachkey"
	done
}

trust_all_keys(){
	for fpr in $(gpg2 --list-keys --with-colons  |\
		awk -F: '/fpr:/ {print $10}' | sort -u); do  printf "5\ny\n" |\
		gpg2 --command-fd 0 --expert --edit-key $fpr trust; done
}

chech_source(){
	if [ ! -d "$default_src" ]; then
		src=$(df | grep -Eo "/mnt/[a-zA-Z0-9]+" |\
			dmenu -i -p "Default Not found Select other source ")
	else
		src=$default_src
	fi
}

select_backup(){
	default_des=$HOME/backup
	default_src="/mnt/sd1/backups"
	chech_source
	backup_file=$(find "$src" -name "home_*" | sort -r | head -n 1)
	file_full_path=$backup_file

	[ ! -d "$default_des" ] && mkdir "$default_des"
	tar xzf $file_full_path -C $default_des
}

select_backup
import_gpg
trust_all_keys
