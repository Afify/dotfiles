#!/bin/sh
base=$(echo "$1" | cut -f 1 -d '.')
puttygen "$1" -O private-openssh -o "$base"
puttygen "$1" -O public-openssh  -o "$base.pub"
