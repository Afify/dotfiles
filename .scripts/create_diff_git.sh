#!/bin/sh

# Description : create diff file from 2 commits

# git_dir=$()
# --git-dir $git_dir/.git
# patch -p1 < path/to/patch.diff

# diff -u old new > patch.diff
# patch OriginalFile < PatchFile
# diff -r -x *.o -x *.so -x *.git dir1 dir2


old_commit=$(git log --all --pretty=format:'%h %s %d' |\
	dmenu -p 'old commmit' -l 10 | awk '{print $1}')

if [ "$old_commit" ]; then
	new_commit=$(git log --all  --pretty=format:'%h %s' |\
	dmenu -p 'new commmit' -l 10 | awk '{print $1}')
	if [ "$new_commit" ]; then
# 		 TODO
		file_name=$(ls -p | grep -v /| dmenu -p 'select file' -l 10)
		if [ "$file_name" ]; then
			output_file="$old_commit"_"$new_commit"_"$file_name".diff
			git diff "$old_commit" "$new_commit"  -- "$file_name" > "$output_file" && echo "create diff for $file_name."
		else
			output_file="$old_commit"_"$new_commit".diff
			git diff "$old_commit" "$new_commit" > "$output_file" && echo "create diff all dir."
		fi
	fi
fi
