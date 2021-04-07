#!/bin/bash

nodelist=$(/usr/local/bin/lsload | grep DOWN | grep unexpected | awk '{{print $1}}')
#joblist=$(/usr/bin/squeue | grep -i held | awk '{if ($5 =="PD"){print $1}}')
#joblist=$(/usr/bin/squeue --qos=doshi-velez -u mamasood | awk '{if ($5 =="PD"){print $1}}')
#joblist=$(sprio -u $1 | awk '{if ($2 =="azari"){print $1}}')
#joblist=$(/usr/bin/squeue --reservation=kuang2 | awk '{if ($5 =="R"){print $1}}')

echo $nodelist

#scontrol release $joblist

#i = 1

for j in $nodelist
do
	j=${j//\(d\)}
	echo $j
	ipmitool -I lanplus -U root -P $1 -H $j-obm.rc.fas.harvard.edu chassis power reset
done
