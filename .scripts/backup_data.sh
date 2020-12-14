#!/bin/sh

today=$(date +%Y_%m_%d)
src="/mnt/data"
dis="/mnt/4tb/backups"
of="$dis/data_$today.tar"

mkdir -p $dis
cp -R $src $dis
tar -cvf "$of" -C "$dis" "data"
gzip "$of"
rm -rf $dis/data
