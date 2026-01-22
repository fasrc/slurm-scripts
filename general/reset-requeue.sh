#!/bin/bash
# This script resets only nodes that have jobs running that are preemptable (i.e. from the requeue partitions)
nodelist=$(/usr/local/bin/lsload | grep DRAIN | awk '{{print $1}}')

echo $nodelist

#scontrol release $joblist

#i = 1

for j in $nodelist
do
  j=${j//\(d\)}
  echo $j

  # Get partition list
  part=$(squeue -w $j -O Partition -h | sort | uniq)

  # Check if there are jobs running on the node.
  if [ -n "$part" ]
  then
    prempt=1

    # Test if any of the partitions are not requeue partitions (i.e. the jobs are not preemptable)
    for p in $part
    do
      if [ -z "$(echo $p | grep requeue)" ]
      then
          prempt=0
      fi
    done

    # If all the jobs are preemptable reset the node
    if [ $prempt == "1" ]
    then
      echo $part
      ipmitool -I lanplus -U root -P $1 -H $j-obm.rc.fas.harvard.edu chassis power reset
    fi
  fi
done
