#!/bin/sh

NOW=$(date +"%d/%b/%Y:%T %z")
FOLLOWERS=$(wget -q -O- 'https://api.facebook.com/method/fql.query?format=json&query=select fan_count from page where username="adblockplus"' \
		   | sed -e 's/.*:\([0-9.]\+\).*/\1/')

printf "[$NOW] $FOLLOWERS facebook\n" >> /var/log/abp/media.log
