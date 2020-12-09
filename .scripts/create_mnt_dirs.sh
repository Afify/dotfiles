#!/bin/sh

[ "$USER" != "root" ] && echo "Must run as root." && exit 1

cd /mnt/ && \
mkdir 4tb 1tb data sd1 sd2 usb1 usb2 phone1 phone2 temp1 temp2 vera
chown -R hassan /mnt/* && chgrp -R hassan /mnt/*
