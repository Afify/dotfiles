#!/bin/sh

cin=$(who | grep -Ec "\\([0-9]{1,3}")
cout=$(pgrep -f "^ssh " | wc -l | tr -d ' ')
[ "$cin" -gt 0 ] && in="$cin 﫻 "
[ "$cout" -gt 0 ] && out="$cout  "
[ "$(pgrep sshd | wc -l)" -gt 0 ] && sshd="[sshd]"
printf " %s%s%s" "$in" "$out" "$sshd"
