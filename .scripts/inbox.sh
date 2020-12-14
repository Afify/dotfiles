#!/bin/sh
count=$(ls /home/hassan/.mail/afify/Inbox/new | wc -l)
[ "$count" -gt 0 ] && echo "[$count]" && exit 0
