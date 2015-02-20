#!/bin/sh

NOW=$(date +"%d/%b/%Y:%T %z")
FOLLOWERS=$(wget -q -O- 'https://plus.google.com/+AdblockPlus' \
    | grep '<span class="BOfSxb">' \
    | sed -e 's/.*class="BOfSxb">\([0-9.]\+\).*/\1/' \
          -e 's/\.//')

printf "[$NOW] $FOLLOWERS googleplus\n" >> media.log


