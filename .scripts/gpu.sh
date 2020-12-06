#!/bin/sh

max_mem="400"
max_temp="52"
max_gpu="25"

if ! [ "$(uname)" = "Linux" ]; then exit;fi

query=$(nvidia-smi --query-gpu=memory.used,temperature.gpu,utilization.gpu \
	--format=csv | sed 's/memory.*//g' | tr -d '\n,')

cur_mem=$(echo "$query" | awk '{print $1}')
cur_temp=$(echo "$query" | awk '{print $3}')
cur_gpu=$(echo "$query" | awk '{print $4}')

if [ "$cur_mem" -gt "$max_mem" ] ||
	[ "$cur_temp" -gt "$max_temp" ] ||
	[ "$cur_gpu" -gt "$max_gpu" ]; then
		echo "GPU [$cur_mem MB] [$cur_temp C] [$cur_gpu %]"
fi
