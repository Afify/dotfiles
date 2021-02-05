#!/bin/sh
mkdir .mail/afify .config/mutt/cache/headers .config/mutt/cache/bodies .config/mutt/certificates .config/mutt/tmp
doas ln -s /etc/sv/crond	/var/service/
dbus
crontab -i
