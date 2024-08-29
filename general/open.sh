#!/bin/bash
nodelist=$(/usr/local/bin/lsload | grep Power | awk '{{print $1}}')
#nodelist=$(sinfo -p fas_gpu -o "%60E %12U %19H %6t %n" | sed -e '/none/d' | sort |uniq | awk '{print $7}')
#nodelist=$(sinfo -o "%n %60E %12U %19H %6t "  | sed -e '/none/d' | sort |uniq | grep 'Kill task failed'| awk '{ print $1 }')
#nodelist=$(sinfo -o "%n %60E %12U %19H %6t "  | sed -e '/none/d' | sort |uniq | grep 'procs still running'| awk '{ print $1 }')
#nodelist=$(/usr/local/bin/lsload | grep DOWN | grep env | awk '{{print $1}}')
#nodelist=$(sinfo -p sapphire --long --list-reasons |  grep responding | awk '{{print $6}}')
#nodelist=$(sinfo -p kempner --long --list-reasons | grep Kill | awk '{{print $7}}')
#joblist=$(/usr/bin/squeue | grep -i held | awk '{if ($5 =="PD"){print $1}}')
#joblist=$(/usr/bin/squeue --qos=doshi-velez -u mamasood | awk '{if ($5 =="PD"){print $1}}')
#joblist=$(sprio -u $1 | awk '{if ($2 =="azari"){print $1}}')
#joblist=$(/usr/bin/squeue --reservation=kuang2 | awk '{if ($5 =="R"){print $1}}')

echo $nodelist

#scontrol release $joblist

#i = 1

for j in $nodelist
do
	echo $j
	scontrol update state=resume nodename=$j
done
