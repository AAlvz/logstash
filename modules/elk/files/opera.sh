#!/bin/sh

NOW=$(date +"%d/%b/%Y:%T %z")
FOLLOWERS=$(wget -q -O- 'https://addons.opera.com/en/extensions/details/opera-adblock' \
		   | sed -n -e 's/.*Downloads<\/dt><dd>\([0-9,]\+\).*/\1/p' \
	           | tr -d ',' )\

printf "[$NOW] $FOLLOWERS opera\n" >> /var/log/abp/downloads.log

