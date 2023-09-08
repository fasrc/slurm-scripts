#!/bin/bash

cat ./rawdata/$1.txt | sort -r | uniq | sed 's/|/,/g' > ./data/$1.csv
