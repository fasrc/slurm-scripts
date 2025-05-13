#!/bin/bash
while read nodename; do
  sbatch --nodelist $nodename wakeup_nodes.sh
  echo "submitted job to $nodename"
  sleep 10
done <list_of_nodes.txt

