#!/bin/sh

usb=$(lsblk --noheadings --raw -o NAME,SIZE |\
	awk '$1~/sd[a-z]$/' |\
	dmenu -i -p "choose disk"|\
	awk '{print $1}')
if [ ! "$usb" ]; then exit;fi

format=$(printf "mkfs.vfat\nmkfs.ext4\nmkfs.ext2\nmkfs.exfat" |\
	dmenu -i -p "choose format")

wipe=$(printf "no\nyes" |\
   	dmenu -p  "WARNING wipe $usb" -nb "#000" -nf "#FFF" -sb "#FF0000" -sf "#FFF")

	dmenu -P -p "sudo " |\
	sudo -S -- sh -c "if [ $wipe = yes ]; then\
		dd bs=4M if=/dev/urandom of=/dev/$usb status=progress oflag=sync;fi;\

		if [ $format = mkfs.ext4 ]; then
			printf \"o\nn\np\n1\n2048\n\n\nw\n\" | fdisk /dev/$usb;\
			mkfs.ext4 /dev/${usb}1 && notify-send 'formated ''$usb'

		elif [ $format = mkfs.ext2 ]; then
			printf \"o\nn\np\n1\n2048\n\n\nw\n\" | fdisk /dev/$usb;\
			mkfs.ext2 /dev/${usb}1 && notify-send 'formated ''$usb'

		elif [ $format = mkfs.exfat ]; then
			printf \"o\nn\np\n1\n2048\n\nt\n7\n\nw\n\" | fdisk /dev/$usb;\
			mkfs.exfat /dev/${usb}1 && notify-send 'formated ''$usb'

		elif [ $format = mkfs.vfat ]; then
			printf \"o\nn\np\n1\n2048\n\nt\nb\n\nw\n\" | fdisk /dev/$usb;\
			mkfs.vfat /dev/${usb}1 && notify-send 'formated ''$usb'
		fi"
