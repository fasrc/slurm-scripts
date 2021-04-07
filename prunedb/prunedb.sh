#!/bin/bash

userlist=$(sshare -a --noheader --parsable2 | cut -d "|" -f 2 | sed '/^$/d')
current=$(date +%D)
twoweeks=$(date +%D -d "-14 days")
sixmonths=$(date +%D -d "-6 months")

echo $current $twoweeks $sixmonths

#echo $userlist
let i=0

for u in $userlist
do
	if [ $u != root ]
	then
		if [ $(sacct --noheader --start=$twoweeks --end=$current -u $u | grep -v dummy | grep -v batch | grep -v extern | wc -l) == 0 ]
		then
			if [ $(sacct --noheader --start=$sixmonths --end=$current -u $u | grep -v dummy | grep -v batch | grep -v extern | wc -l) == 0 ]
			then
				echo $u
				sacctmgr -i delete user name=$u
				let i=i+1
				echo $i 
			fi
		fi
	fi
done
echo $i
