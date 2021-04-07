#!/bin/bash

acctlist=$(sshare -a --noheader --parsable2 | cut -d "|" -f 1 | sed '/^$/d')

#echo $acctlist
let i=0

for u in $acctlist
do
	if [ $u != root ]
	then
		if [ $(sshare --noheader -a --account="$u" | wc -l) == 1 ]
		then
			echo $u
			sacctmgr -i delete account name="$u"
			let i=i+1
			echo $i
		fi
	fi
done
echo $i
