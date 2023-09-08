#!/bin/bash

cat ./rawdata/sshare.txt | sort -r | uniq | sed 's/|/,/g' > ./data/sshare.csv
