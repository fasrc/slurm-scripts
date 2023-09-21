#!/bin/bash

#joblist=$(/usr/bin/squeue | awk '{if ($5 =="S"){print $1}}')
#joblist=$(/usr/bin/squeue -p $1 | awk '{if ($5 =="PD"){print $1}}')
joblist=$(/usr/bin/squeue | grep -i held  |  awk '{if ($5 =="RH"){print $1}}')
#joblist=$(/usr/bin/squeue --qos=doshi-velez -u mamasood | awk '{if ($5 =="PD"){print $1}}')
#joblist=$(sprio -u $1 | awk '{if ($2 =="azari"){print $1}}')
#joblist=$(/usr/bin/squeue --reservation=kuang2 | awk '{if ($5 =="R"){print $1}}')

echo $joblist

#scontrol release $joblist

#i = 1

for j in $joblist
do
	echo $j
#	scancel $j
#	scancel --signal=CONT $j
#	let i=i+1
#	echo $i
#	if [ $i = 1000 ];
#	then
#		break
#	fi
#
#        scancel $j
#	scontrol update JobID=$j priority=999999999
#	scontrol update JobID=$j partition=zhuang
#	scontrol update JobID=$j timelimit=+1-00:00:00
#        scontrol update JobID=$j account=icecube
#	scontrol resume $j
	scontrol release $j
done
