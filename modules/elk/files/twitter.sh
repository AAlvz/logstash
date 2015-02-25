#!/bin/sh

NOW=$(date +"%d/%b/%Y:%T %z")
FOLLOWERS=$(wget -q -O- 'https://twitter.com/AdblockPlus' \
    | grep 'data-nav="followers"' \
    | sed -e 's/.*\<title="\([0-9.]\+\)\s\+[Ff]ollower".*/\1/' \
	  -e 's/\.//' )

printf "[$NOW] $FOLLOWERS twitter\n" >> /var/log/abp/media.log
