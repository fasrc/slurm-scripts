#!/bin/bash
# This script restores data from the slurm archive depending on name of file.

filepath=$1
filecount=$2

echo "1"
sacctmgr -i archive load file=${filepath}

for i in $(seq 2 $2)
do
  echo $i
  sacctmgr -i archive load file=${filepath}.${i}
done
