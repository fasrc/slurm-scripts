#!/bin/bash
#This script sets the fairshare scores for labs by reading for a csv file.
#The csv file should be formatted as labname,fairshare

# Handles creating the kempner specific fairshare structure.
./fairshare-kempner.sh

scores=$(cat cannon/cannon-fairshare-census-12-8-23.csv)

sacctmgr -i modify account set fairshare=200

for i in $scores
do
  lab=$(echo $i | cut -d "," -f 1)
  share=$(echo $i | cut -d "," -f 2)
  if [ "$lab" != "cluster_users" ]; then 
    sacctmgr -i modify account name=$lab set fairshare=$share
  fi
done
