#!/bin/bash

nodelist=$(/usr/local/bin/lsload | grep 8a29 | awk '{{print $1}}')
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
        joblist=$(/usr/bin/squeue -w $j | awk '{if ($5 =="S"){print $1}}')

#        scontrol update state=drain nodename=$j reason="IB work"

        echo $joblist
        for i in $joblist
        do
          echo $i
          scontrol resume $i
        done
        scontrol update state=resume nodename=$j
done
