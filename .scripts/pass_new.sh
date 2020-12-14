#!/bin/sh

dec_old_passwords(){
	all=$(find "$HOME/.password-store" -type f -iname "*.gpg" -printf '%f\n' | sed -n 's/\.gpg$//p')
	all_url=$(echo "$all" | awk -F: '{print $1}')
	for i in $all; do
		pass "$i" >> "$backup_dir/$i.txt"
	done
}

new_passwords(){
	all=$(find "$HOME/.password-store" -type f -iname "*.gpg" -printf '%f\n' | sed -n 's/\.gpg$//p')
	all_url=$(echo "$all" | awk -F: '{print $1}')
	for i in $all; do
		pass generate -f "$i" 25
	done
}

create_new_ed25519_key(){
gpgconf --kill gpg-agent
echo "Key-Type: eddsa
Key-Curve: ed25519
Key-Usage: cert, sign, auth
Subkey-Type: ecdh
Subkey-Curve: cv25519
Subkey-Usage: encrypt
Expire-Date: 1y
Name-Real: Hassan Afify
Name-Comment: 2021
Name-Email: hassan@afify.dev" | gpg2 --gen-key --batch
}

setagent(){
	gpgconf --kill gpg-agent
	gpg-agent --daemon --use-standard-socket --pinentry-program /usr/bin/pinentry-curses
	 watch -n1 cat /proc/sys/kernel/random/entropy_avail
}

get_newid(){
	newid=$(gpg2 --list-secret-keys --with-colons |\
		awk -F: "/^sec.*\$/ {print \$5}")
}

copy_new_gpgkey(){
	echo "$newid" > "$HOME/.password-store/.gpg-id"
	sed -i "s/signingkey.*/signingkey = $newid/" ~/.config/git/config
}

init(){
	backup_dir="$HOME/pass_bk"
	[ -d "$backup_dir" ] || mkdir "$backup_dir"
}

clean_gpg_ssh(){
	cp -r "$HOME/.ssh" "$HOME/.gnupg" "$backup_dir"
	rm -rf "$HOME/.ssh" "$HOME/.gnupg"
	mkdir "$HOME/.ssh" "$HOME/.gnupg"
	printf "# allow-loopback-pinentry
pinentry-program /bin/pinentry-dmenu\n" > "$HOME/.gnupg/gpg-agent.conf"
}

init
dec_old_passwords
clean_gpg_ssh
create_new_ed25519_key
get_newid
copy_new_gpgkey
new_passwords
firefox $all_url
# create_new_ssh

nosympass(){
	pass generate --no-symbols privateemail.com:afify.dev 32
}
